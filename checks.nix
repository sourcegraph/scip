{
  pkgs,
  version,
  license,
  sampleIndexes,
}:
{
  formatting = pkgs.stdenv.mkDerivation {
    pname = "scip-formatting";
    inherit version;
    src = ./.;
    nativeBuildInputs = with pkgs; [
      go
      gotools
      nixfmt
      prettier
    ];
    buildPhase = ''
      prettier --check '**/*.{ts,js(on)?,md,yml}'
      gofmt -d . | tee /dev/stderr | diff /dev/null -
      goimports -d . | tee /dev/stderr | diff /dev/null -
      nixfmt --check *.nix
    '';
    installPhase = "touch $out";
  };

  go-bindings = pkgs.buildGoModule {
    pname = "scip-bindings-go";
    inherit version;
    src = ./.;
    vendorHash = "sha256-ywSR9yRysnm2E6kI8UJS6XcpuqKJF8wJpHcYS7TGmjI=";
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
    vendorHash = "sha256-ywSR9yRysnm2E6kI8UJS6XcpuqKJF8wJpHcYS7TGmjI=";
    subPackages = [
      "cmd/scip/tests/reprolang/src"
      "cmd/scip/tests/reprolang/bindings/go/repro"
    ];
    installPhase = "touch $out";
  };

  reprolang-generated = pkgs.stdenv.mkDerivation {
    pname = "scip-reprolang-generated";
    inherit version;
    src = ./.;
    nativeBuildInputs = with pkgs; [
      nodejs
      prettier
      tree-sitter
    ];
    buildPhase = ''
      cd cmd/scip/tests/reprolang
      cp -r src src-before
      tree-sitter generate --abi 14
      prettier --write 'src/grammar.json' 'src/node-types.json'
      diff -rq src-before src
    '';
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
    src = ./bindings/typescript;
    yarnOfflineCache = pkgs.fetchYarnDeps {
      yarnLock = ./bindings/typescript/yarn.lock;
      hash = "sha256-Ej75Mgn7ifARz1R2VzhbjegsMH9msIn+pXAcDtXSmAQ=";
    };
    nativeBuildInputs = with pkgs; [
      yarnConfigHook
      nodejs
    ];
    buildPhase = "node_modules/.bin/tsc --noEmit";
    installPhase = "touch $out";
  };
}
