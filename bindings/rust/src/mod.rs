// SCIP bindings for rust

// This will pull generated code into `scip::types`
#[path = "generated/mod.rs"]
mod scip_mod;
pub use scip_mod::scip as types;

// Exports symbol usage under scip::symbol namespace
pub mod symbol;

/// Write a message to a particular filepath.
///
/// This allows users of the SCIP library to not add protobuf as
/// a direct dependency of the project (which can be useful to limit
/// usage of protobuf elsewhere if not desired).
pub fn write_message_to_file<P>(
    path: P,
    msg: impl protobuf::Message,
) -> Result<(), Box<dyn std::error::Error>>
where
    P: AsRef<std::path::Path>,
{
    use std::io::Write;

    let res = msg.write_to_bytes()?;
    let output = std::fs::File::create(path)?;
    let mut writer = std::io::BufWriter::new(output);
    writer.write_all(&res)?;

    Ok(())
}
