{
  pkgs,
  version,
  license,
  sampleIndexes,
}:
{
  go-bindings = pkgs.buildGoModule {
    pname = "scip-bindings-go";
    inherit version;
    src = ./.;
    vendorHash = "sha256-8HgeG/SXkM7ptOwKSi/PUH3VySxFqqoIpXI7bZtbO4A=";
    buildTags = [ "asserts" ];
    subPackages = [
      "bindings/go/scip"
      "bindings/go/scip/internal"
      "bindings/go/scip/memtest"
      "bindings/go/scip/testutil"
    ];
    preCheck = ''
      export SCIP_SAMPLE_INDEXES_DIR=${sampleIndexes}
    '';
    installPhase = "touch $out";
  };

  haskell-bindings = pkgs.haskellPackages.mkDerivation {
    pname = "scip-bindings-haskell";
    inherit license version;
    src = ./bindings/haskell;
    libraryHaskellDepends = with pkgs.haskellPackages; [ proto-lens-runtime ];
    prePatch = ''
      cp --remove-destination ${./LICENSE} LICENSE
    '';
  };

  reprolang = pkgs.buildGoModule {
    pname = "scip-reprolang";
    inherit version;
    src = ./.;
    vendorHash = "sha256-8HgeG/SXkM7ptOwKSi/PUH3VySxFqqoIpXI7bZtbO4A=";
    subPackages = [
      "cmd/scip/tests/reprolang/src"
      "cmd/scip/tests/reprolang/bindings/go/repro"
    ];
    installPhase = "touch $out";
  };

  rust-bindings = pkgs.rustPlatform.buildRustPackage {
    pname = "scip-bindings-rust";
    inherit version;
    src = ./bindings/rust;
    cargoLock = {
      lockFile = ./bindings/rust/Cargo.lock;
    };
  };

  typescript-bindings = pkgs.stdenv.mkDerivation {
    pname = "scip-bindings-typescript";
    inherit version;
    src = ./.;
    yarnOfflineCache = pkgs.fetchYarnDeps {
      yarnLock = ./yarn.lock;
      hash = "sha256-NF533Kx6/YnQO7wNKX1IEHbIYETWhqPYgdyX8nV9RkE=";
    };
    nativeBuildInputs = with pkgs; [
      yarnConfigHook
      nodejs
    ];
    buildPhase = "node_modules/.bin/tsc --noEmit -p bindings/typescript";
    installPhase = "touch $out";
  };
}
