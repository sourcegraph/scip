// SCIP bindings for rust

// This will pull generated code into `scip::types`
#[path = "generated/mod.rs"]
mod scip_mod;

pub use scip_mod::scip as types;

// Exports symbol usage under scip::symbol namespace
pub mod symbol;
