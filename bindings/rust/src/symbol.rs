#![allow(dead_code)]

use crate::types::{descriptor, Descriptor};
use crate::types::{Package, Symbol};
use protobuf::{MessageField, SpecialFields};

#[non_exhaustive]
#[derive(Debug, PartialEq)]
pub enum SymbolError {
    InvalidIndex,
    InvalidIdentifier(String),
    MissingDescriptor,
    MissingCharacter(String),
    EndOfSymbol(String),
    InvalidLocalSymbol(String),
}

/// Returns true if the symbol is obviously not a local symbol.
///
/// CAUTION: Does not perform full validation of the symbol string's contents.
pub fn is_global_symbol(sym: &str) -> bool {
    !sym.starts_with("local ")
}

pub fn is_simple_identifier(sym: &str) -> bool {
    sym.chars().all(|c| c.is_alphanumeric() || c == '$' || c == '+' || c == '-' || c == '_')
}

pub fn is_local_symbol(sym: &str) -> bool {
    if !sym.starts_with("local ") {
        return false;
    }
    let suffix = &sym[6..];
    !suffix.is_empty() && is_simple_identifier(suffix)
}

pub fn try_parse_local_symbol(sym: &str) -> Result<Option<&str>, SymbolError> {
    if !sym.starts_with("local ") {
        return Ok(None);
    }
    let suffix = &sym[6..];
    if !suffix.is_empty() && is_simple_identifier(suffix) {
        return Ok(Some(suffix));
    }
    Err(SymbolError::InvalidLocalSymbol(sym.to_string()))
}

pub struct SymbolFormatOptions {
    pub include_scheme: bool,
    pub include_package_manager: bool,
    pub include_package_name: bool,
    pub include_package_version: bool,
    pub include_descriptor: bool,
}

impl SymbolFormatOptions {
    fn default() -> SymbolFormatOptions {
        SymbolFormatOptions {
            include_scheme: true,
            include_package_manager: true,
            include_package_name: true,
            include_package_version: true,
            include_descriptor: true,
        }
    }
}

pub fn format_symbol_with(symbol: Symbol, options: SymbolFormatOptions) -> String {
    let mut parts = vec![];
    let Symbol {
        scheme,
        package: MessageField(package),
        descriptors,
        ..
    } = symbol;

    // Handle local symbols first, to enforce simple formatting
    if scheme == "local" {
        if let Some(symbol) = descriptors
            .iter()
            .find_map(|desc| match desc.suffix.enum_value() {
                Ok(descriptor::Suffix::Local) => Some(format!("local {}", desc.name)),
                _ => None,
            })
        {
            return symbol;
        }
    }

    if options.include_scheme {
        parts.push(scheme);
    }

    if options.include_package_manager {
        match &package {
            Some(package) if !package.manager.is_empty() => parts.push(package.manager.clone()),
            _ => parts.push(".".to_string()),
        }
    }

    if options.include_package_name {
        match &package {
            Some(package) if !package.name.is_empty() => parts.push(package.name.clone()),
            _ => parts.push(".".to_string()),
        }
    }

    if options.include_package_version {
        match &package {
            Some(package) if !package.version.is_empty() => parts.push(package.version.clone()),
            _ => parts.push(".".to_string()),
        }
    }

    if options.include_descriptor && !descriptors.is_empty() {
        parts.push(
            descriptors
                .iter()
                .filter_map(|desc| {
                    Some(match desc.suffix.enum_value() {
                        Ok(val) => {
                            let name = escape_name(&desc.name);
                            match val {
                                descriptor::Suffix::Package | descriptor::Suffix::Namespace => {
                                    format!("{}/", name)
                                }
                                descriptor::Suffix::Type => format!("{}#", name),
                                descriptor::Suffix::Term => format!("{}.", name),
                                descriptor::Suffix::Method => {
                                    format!("{}({}).", name, desc.disambiguator)
                                }
                                descriptor::Suffix::TypeParameter => format!("[{}]", name),
                                descriptor::Suffix::Parameter => format!("({})", name),
                                descriptor::Suffix::Macro => format!("{}!", name),
                                descriptor::Suffix::Meta => format!("{}:", name),
                                descriptor::Suffix::Local => format!("{}", name),
                                descriptor::Suffix::UnspecifiedSuffix => return None,
                            }
                        }
                        Err(_) => return None,
                    })
                })
                .collect::<Vec<String>>()
                .concat(),
        );
    }

    parts.join(" ")
}

fn escape_name(name: &str) -> String {
    if name
        .chars()
        .all(|ch| ch == '_' || ch == '+' || ch == '-' || ch == '$' || ch.is_ascii_alphanumeric())
    {
        name.to_string()
    } else {
        format!("`{}`", name)
    }
}

pub fn format_symbol(symbol: Symbol) -> String {
    format_symbol_with(symbol, SymbolFormatOptions::default())
}

impl Symbol {
    pub fn new_local(id: usize) -> Self {
        internal_local_symbol(id.to_string().as_str())
    }
}

pub fn parse_symbol(symbol: &str) -> Result<Symbol, SymbolError> {
    fn dot(s: String) -> String {
        if s.as_str() == "." {
            "".to_string()
        } else {
            s
        }
    }

    match try_parse_local_symbol(symbol) {
        Ok(Some(s)) => return Ok(internal_local_symbol(s)),
        Err(err) => return Err(err),
        Ok(None) => {},
    }

    let mut parser = SymbolParser::new(symbol);

    let scheme = parser.accept_space_escaped_identifier("scheme")?;

    let package = crate::types::Package {
        manager: dot(parser.accept_space_escaped_identifier("package.manager")?),
        name: dot(parser.accept_space_escaped_identifier("package.name")?),
        version: dot(parser.accept_space_escaped_identifier("package.version")?),
        special_fields: SpecialFields::default(),
    };

    // If all the package fields are empty, we can just say that package is None
    let package = match (
        package.manager.as_str(),
        package.name.as_str(),
        package.version.as_str(),
    ) {
        ("", "", "") => protobuf::MessageField::none(),
        _ => protobuf::MessageField::some(package),
    };

    Ok(Symbol {
        scheme,
        package,
        descriptors: parser.accept_descriptors()?,
        special_fields: SpecialFields::default(),
    })
}

fn new_descriptor(name: String, suffix: descriptor::Suffix) -> Descriptor {
    Descriptor {
        name,
        disambiguator: "".to_string(),
        suffix: suffix.into(),
        special_fields: SpecialFields::default(),
    }
}

fn new_descriptor_with_disambiguator(
    name: String,
    suffix: descriptor::Suffix,
    disambiguator: String,
) -> Descriptor {
    Descriptor {
        name,
        disambiguator,
        suffix: suffix.into(),
        special_fields: SpecialFields::default(),
    }
}

#[derive(Debug)]
struct SymbolParser {
    sym: String,
    index: usize,
}

impl SymbolParser {
    fn new(sym: &str) -> Self {
        Self {
            sym: sym.to_string(),
            index: 0,
        }
    }

    fn current(&self) -> Result<char, SymbolError> {
        self.sym
            .chars()
            .nth(self.index)
            .ok_or(SymbolError::InvalidIndex)
    }

    fn peek_next(&self) -> Option<char> {
        self.sym.chars().nth(self.index + 1)
    }

    fn accept_space_escaped_identifier(&mut self, what: &str) -> Result<String, SymbolError> {
        self.accept_escaped_identifier(what, ' ')
    }

    fn accept_backtick_escpaed_identifier(&mut self, what: &str) -> Result<String, SymbolError> {
        self.accept_escaped_identifier(what, '`')
    }

    fn accept_escaped_identifier(
        &mut self,
        what: &str,
        escape_char: char,
    ) -> Result<String, SymbolError> {
        let mut chars = vec![];
        let len = self.sym.len();
        while self.index < len {
            let ch = self.current()?;
            if ch == escape_char {
                self.index += 1;
                if self.current()? == escape_char {
                    chars.push(ch)
                } else {
                    return Ok(chars.into_iter().collect());
                }
            } else {
                chars.push(ch)
            }

            self.index += 1;
        }

        Err(SymbolError::EndOfSymbol(format!("Parsing {}", what)))
    }

    fn accept_identifier(&mut self, what: &str) -> Result<String, SymbolError> {
        match self.current()? {
            '`' => {
                self.index += 1;
                Ok(self.accept_escaped_identifier(what, '`')?)
            }
            _ => {
                let start = self.index;
                while let Ok(c) = self.current() {
                    if !(c.is_alphabetic()
                        || c.is_digit(10)
                        || c == '-'
                        || c == '+'
                        || c == '$'
                        || c == '_')
                    {
                        break;
                    }
                    self.index += 1;
                }

                if start == self.index {
                    Err(SymbolError::InvalidIdentifier(what.to_string()))
                } else {
                    Ok(self
                        .sym
                        .chars()
                        .skip(start)
                        .take(self.index - start)
                        .collect())
                }
            }
        }
    }

    fn accept_character(&mut self, c: char, what: &str) -> Result<char, SymbolError> {
        // if self.peek_next().ok_or(SymbolError::InvalidIndex)? == c {
        if self.current()? == c {
            self.index += 1;
            Ok(c)
        } else {
            Err(SymbolError::MissingCharacter(format!(
                "{}:: Expected: {}, Got: {}",
                what.to_string(),
                c,
                self.current()?
            )))
        }
    }

    fn accept_descriptors(&mut self) -> Result<Vec<Descriptor>, SymbolError> {
        let mut v = Vec::new();
        while self.index < self.sym.len() {
            v.push(self.accept_one_descriptor()?)
        }

        Ok(v)
    }

    fn accept_one_descriptor(&mut self) -> Result<Descriptor, SymbolError> {
        match self.current()? {
            '(' => {
                self.accept_character('(', "Opening Parameter")?;
                let descriptor = new_descriptor(
                    self.accept_identifier("parameter name")?,
                    descriptor::Suffix::Parameter,
                );
                self.accept_character(')', "Closing Parameter")?;
                Ok(descriptor)
            }
            '[' => {
                self.accept_character('[', "Opening Type Parameter")?;
                let descriptor = new_descriptor(
                    self.accept_identifier("type parameter name")?,
                    descriptor::Suffix::TypeParameter,
                );
                self.accept_character(']', "Closing Type Parameter")?;
                Ok(descriptor)
            }
            _ => {
                let name = self.accept_identifier(
                    format!("descriptor name: {:?} / {}", self, self.sym.len()).as_str(),
                )?;

                let suffix = self.current()?;
                self.index += 1;
                match suffix {
                    '(' => {
                        // We are not peeking here because we already advanced
                        // past suffix.
                        let disambiguator = match self.current()? {
                            ')' => "".to_string(),
                            _ => self.accept_identifier("method disambiguator")?,
                        };

                        self.accept_character(')', "closing method")?;
                        self.accept_character('.', "closing method")?;

                        Ok(new_descriptor_with_disambiguator(
                            name,
                            descriptor::Suffix::Method,
                            disambiguator,
                        ))
                    }
                    '/' => Ok(new_descriptor(name, descriptor::Suffix::Package)),
                    '.' => Ok(new_descriptor(name, descriptor::Suffix::Term)),
                    '#' => Ok(new_descriptor(name, descriptor::Suffix::Type)),
                    ':' => Ok(new_descriptor(name, descriptor::Suffix::Meta)),
                    '!' => Ok(new_descriptor(name, descriptor::Suffix::Macro)),
                    _ => Err(SymbolError::MissingDescriptor),
                }
            }
        }
    }
}

fn internal_local_symbol(id: &str) -> Symbol {
    let descriptor = Descriptor {
        name: id.to_string(),
        disambiguator: "".to_string(),
        suffix: descriptor::Suffix::Local.into(),
        special_fields: SpecialFields::default(),
    };

    Symbol {
        scheme: "local".to_string(),
        package: protobuf::MessageField::none(),
        descriptors: vec![descriptor],
        special_fields: SpecialFields::default(),
    }
}

impl Package {
    fn new_with_values(manager: &str, name: &str, version: &str) -> MessageField<Package> {
        MessageField::some(Package {
            manager: manager.to_string(),
            name: name.to_string(),
            version: version.to_string(),
            special_fields: SpecialFields::default(),
        })
    }
}

#[cfg(test)]
mod test {
    use crate::types::Package;

    use super::*;
    use pretty_assertions::assert_eq;

    #[test]
    fn parses_local() {
        assert_eq!(
            parse_symbol("local a").expect("to parse local"),
            internal_local_symbol("a")
        );
    }

    #[test]
    fn parses_backtick_escaped_descriptor() {
        assert_eq!(
            parse_symbol("a b c d `e f`.").expect("to parse backtick escaped"),
            Symbol {
                scheme: "a".to_string(),
                package: Package::new_with_values("b", "c", "d"),
                descriptors: vec![new_descriptor("e f".to_string(), descriptor::Suffix::Term)],
                special_fields: SpecialFields::default(),
            }
        );
    }

    #[test]
    fn parses_java_symbol() {
        let input_symbol =
            "lsif-java maven package 1.0.0 java/io/File#Entry.method(+1).(param)[TypeParam]";

        assert_eq!(
            parse_symbol(input_symbol).expect("java symbol"),
            Symbol {
                scheme: "lsif-java".to_string(),
                package: Package::new_with_values("maven", "package", "1.0.0"),
                descriptors: vec![
                    new_descriptor("java".to_string(), descriptor::Suffix::Package),
                    new_descriptor("io".to_string(), descriptor::Suffix::Package),
                    new_descriptor("File".to_string(), descriptor::Suffix::Type),
                    new_descriptor("Entry".to_string(), descriptor::Suffix::Term),
                    new_descriptor_with_disambiguator(
                        "method".to_string(),
                        descriptor::Suffix::Method,
                        "+1".to_string(),
                    ),
                    new_descriptor("param".to_string(), descriptor::Suffix::Parameter),
                    new_descriptor("TypeParam".to_string(), descriptor::Suffix::TypeParameter),
                ],
                special_fields: SpecialFields::default(),
            }
        );

        assert_eq!(
            input_symbol,
            format_symbol(parse_symbol(input_symbol).expect("java symbol"))
        )
    }

    #[test]
    fn parses_rust_method_no_disambiguator() {
        let input_symbol = "rust-analyzer cargo test_rust_dependency 0.1.0 MyType#new().";

        assert_eq!(
            parse_symbol(input_symbol).expect("rust symbol"),
            Symbol {
                scheme: "rust-analyzer".to_string(),
                package: Package::new_with_values("cargo", "test_rust_dependency", "0.1.0"),
                descriptors: vec![
                    new_descriptor("MyType".to_string(), descriptor::Suffix::Type),
                    new_descriptor_with_disambiguator(
                        "new".to_string(),
                        descriptor::Suffix::Method,
                        "".to_string(),
                    ),
                ],
                special_fields: SpecialFields::default(),
            }
        );

        assert_eq!(
            input_symbol,
            format_symbol(parse_symbol(input_symbol).expect("rust symbol"))
        )
    }

    #[test]
    fn parses_rust_method_with_disambiguator() {
        let input_symbol = "rust-analyzer cargo test_rust_dependency 0.1.0 MyType#new(test).";

        assert_eq!(
            parse_symbol(input_symbol).expect("rust symbol"),
            Symbol {
                scheme: "rust-analyzer".to_string(),
                package: Package::new_with_values("cargo", "test_rust_dependency", "0.1.0"),
                descriptors: vec![
                    new_descriptor("MyType".to_string(), descriptor::Suffix::Type),
                    new_descriptor_with_disambiguator(
                        "new".to_string(),
                        descriptor::Suffix::Method,
                        "test".to_string(),
                    ),
                ],
                special_fields: SpecialFields::default(),
            }
        );

        assert_eq!(
            input_symbol,
            format_symbol(parse_symbol(input_symbol).expect("rust symbol"))
        )
    }

    #[test]
    fn formats_symbol_with_dots() {
        assert_eq!(
            "scip-ctags . . . foo.",
            format_symbol(Symbol {
                scheme: "scip-ctags".to_string(),
                package: None.into(),
                descriptors: vec![new_descriptor("foo".to_string(), descriptor::Suffix::Term)],
                ..Default::default()
            })
        );

        // Handles randomly some are empty and some are dots
        assert_eq!(
            "scip-ctags manager . . MyType#foo.",
            format_symbol(Symbol {
                scheme: "scip-ctags".to_string(),
                package: Some(Package {
                    manager: "manager".to_string(),
                    name: ".".to_string(),
                    version: "".to_string(),
                    ..Default::default()
                })
                .into(),

                descriptors: vec![
                    new_descriptor("MyType".to_string(), descriptor::Suffix::Type),
                    new_descriptor("foo".to_string(), descriptor::Suffix::Term)
                ],
                ..Default::default()
            })
        );

        assert_eq!("local 7", format_symbol(Symbol::new_local(7)));
    }

    #[test]
    fn parses_rust_method_with_macro() {
        let input_symbol = "rust-analyzer cargo test_rust_dependency 0.1.0 println!";

        assert_eq!(
            parse_symbol(input_symbol).expect("rust symbol"),
            Symbol {
                scheme: "rust-analyzer".to_string(),
                package: Package::new_with_values("cargo", "test_rust_dependency", "0.1.0"),
                descriptors: vec![new_descriptor(
                    "println".to_string(),
                    descriptor::Suffix::Macro
                ),],
                special_fields: SpecialFields::default(),
            }
        );

        assert_eq!(
            input_symbol,
            format_symbol(parse_symbol(input_symbol).expect("rust symbol"))
        )
    }

    #[test]
    fn test_properly_escapes_identifiers() {
        let symbol_struct = Symbol {
            scheme: "scip-ctags".to_string(),
            package: None.into(),
            descriptors: vec![new_descriptor("foo=".to_string(), descriptor::Suffix::Term)],
            ..Default::default()
        };
        let symbol = format_symbol(symbol_struct.clone());

        assert_eq!(symbol, "scip-ctags . . . `foo=`.");
        assert_eq!(parse_symbol(&symbol).expect("to parse"), symbol_struct);
    }

    #[test]
    fn test_parse_error() {
        let test_cases = vec![
            "",
            "lsif-java maven package 1.0.0",
            "lsif-java maven package 1.0.0 java/io/File#Entry.trailingstring",
            "lsif-java maven package 1.0.0 java/io/File#Entry.unrecognizedSuffix@",
            "local 🧠",
            "local ",
            "local &&&",
        ];
        for test_case in test_cases {
            assert!(parse_symbol(test_case).is_err());
        }
    }
}
