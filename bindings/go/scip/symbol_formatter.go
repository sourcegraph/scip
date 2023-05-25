package scip

import (
	"strings"
)

// SymbolFormatter configures how to format an SCIP symbol.
// Excluding parts of the symbol can be helpful for testing purposes. For example, snapshot tests may hardcode
// the package version number so it's easier to read the snapshot tests if the version is excluded.
type SymbolFormatter struct {
	OnError                 func(err error) error
	IncludeScheme           func(scheme string) bool
	IncludePackageManager   func(manager string) bool
	IncludePackageName      func(name string) bool
	IncludePackageVersion   func(version string) bool
	IncludeDescriptorString func(descriptor string) bool
	IncludeDescriptor       func(descriptor *Descriptor) bool
	IncludeDisambiguator    func(disambiguator string) bool
}

// VerboseSymbolFormatter formats all parts of the symbol.
var VerboseSymbolFormatter = SymbolFormatter{
	OnError:                 func(err error) error { return err },
	IncludeScheme:           func(_ string) bool { return true },
	IncludePackageManager:   func(_ string) bool { return true },
	IncludePackageName:      func(_ string) bool { return true },
	IncludePackageVersion:   func(_ string) bool { return true },
	IncludeDescriptorString: func(_ string) bool { return true },
	IncludeDescriptor:       func(_ *Descriptor) bool { return true },
	IncludeDisambiguator:    func(_ string) bool { return true },
}

// Same as VerboseSymbolFormatter but silently ignores errors.
var LenientVerboseSymbolFormatter = SymbolFormatter{
	OnError:                 func(_ error) error { return nil },
	IncludeScheme:           func(_ string) bool { return true },
	IncludePackageManager:   func(_ string) bool { return true },
	IncludePackageName:      func(_ string) bool { return true },
	IncludePackageVersion:   func(_ string) bool { return true },
	IncludeDescriptorString: func(_ string) bool { return true },
	IncludeDescriptor:       func(_ *Descriptor) bool { return true },
	IncludeDisambiguator:    func(_ string) bool { return true },
}

// DescriptorOnlyFormatter formats only the descriptor part of the symbol.
var DescriptorOnlyFormatter = SymbolFormatter{
	OnError:                 func(err error) error { return err },
	IncludeScheme:           func(scheme string) bool { return scheme == "local" },
	IncludePackageManager:   func(_ string) bool { return false },
	IncludePackageName:      func(_ string) bool { return false },
	IncludePackageVersion:   func(_ string) bool { return false },
	IncludeDescriptorString: func(_ string) bool { return true },
	IncludeDescriptor:       func(_ *Descriptor) bool { return true },
	IncludeDisambiguator:    func(_ string) bool { return true },
}

// SyntacticDescriptorOnlyFormatter formats only the syntactic descriptor part of the symbol.
var SyntacticDescriptorOnlyFormatter = SymbolFormatter{
	OnError:                 func(err error) error { return err },
	IncludeScheme:           func(scheme string) bool { return scheme == "local" },
	IncludePackageManager:   func(_ string) bool { return false },
	IncludePackageName:      func(_ string) bool { return false },
	IncludePackageVersion:   func(_ string) bool { return false },
	IncludeDescriptorString: func(_ string) bool { return true },
	IncludeDescriptor: func(descriptor *Descriptor) bool {
		switch descriptor.Suffix {
		case Descriptor_Namespace, Descriptor_Type, Descriptor_Term, Descriptor_Method:
			return true
		default:
			return false
		}
	},
	IncludeDisambiguator: func(_ string) bool {
		return false
	},
}

func (f *SymbolFormatter) Format(symbol string) (string, error) {
	parsed, err := ParseSymbol(symbol)
	if err != nil {
		return "", err
	}
	return f.FormatSymbol(parsed), nil
}

func (f *SymbolFormatter) FormatSymbol(symbol *Symbol) string {
	var parts []string
	if f.IncludeScheme(symbol.Scheme) { // Always include the scheme for local symbols
		parts = append(parts, symbol.Scheme)
	}
	if symbol.Package != nil && symbol.Package.Manager != "" && f.IncludePackageManager(symbol.Package.Manager) {
		parts = append(parts, symbol.Package.Manager)
	}
	if symbol.Package != nil && symbol.Package.Name != "" && f.IncludePackageName(symbol.Package.Name) {
		parts = append(parts, symbol.Package.Name)
	}
	if symbol.Package != nil && symbol.Package.Version != "" && f.IncludePackageVersion(symbol.Package.Version) {
		parts = append(parts, symbol.Package.Version)
	}
	descriptor := strings.Builder{}
	for _, desc := range symbol.Descriptors {
		if !f.IncludeDescriptor(desc) {
			continue
		}
		switch desc.Suffix {
		case Descriptor_Namespace:
			descriptor.WriteString(desc.Name)
			descriptor.WriteRune('/')
		case Descriptor_Type:
			descriptor.WriteString(desc.Name)
			descriptor.WriteRune('#')
		case Descriptor_Term:
			descriptor.WriteString(desc.Name)
			descriptor.WriteRune('.')
		case Descriptor_Method:
			descriptor.WriteString(desc.Name)
			descriptor.WriteRune('(')
			if f.IncludeDisambiguator(desc.Disambiguator) {
				descriptor.WriteString(desc.Disambiguator)
			}
			descriptor.WriteString(").")
		case Descriptor_TypeParameter:
			descriptor.WriteRune('[')
			descriptor.WriteString(desc.Name)
			descriptor.WriteRune(']')
		case Descriptor_Parameter:
			descriptor.WriteRune('(')
			descriptor.WriteString(desc.Name)
			descriptor.WriteRune(')')
		case Descriptor_Meta:
			descriptor.WriteString(desc.Name)
			descriptor.WriteRune(':')
		case Descriptor_Macro:
			descriptor.WriteString(desc.Name)
			descriptor.WriteRune('!')
		case Descriptor_Local:
			descriptor.WriteString(desc.Name)
		}
	}
	descriptorString := descriptor.String()
	if f.IncludeDescriptorString(descriptorString) {
		parts = append(parts, descriptorString)
	}

	return strings.Join(parts, " ")
}
