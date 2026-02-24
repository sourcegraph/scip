{
  pkgs,
  version,
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
    vendorHash = "sha256-JuGh7/CnpCWABK6WYE+Mo7P8X0glFrFa9ve9eO//1v8=";
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

  haskell-bindings =
    let
      cabal = pkgs.haskellPackages.callCabal2nix "scip" ./bindings/haskell { };
    in
    assert pkgs.lib.assertMsg (
      cabal.version == version
    ) "Version mismatch in bindings/haskell/scip.cabal: expected ${version}, got ${cabal.version}";
    cabal.overrideAttrs {
      prePatch = ''
        cp --remove-destination ${./LICENSE} LICENSE
      '';
    };

  reprolang =
    let
      reprolangVersion = (builtins.fromJSON (builtins.readFile ./reprolang/package.json)).version;
    in
    assert pkgs.lib.assertMsg (
      reprolangVersion == version
    ) "Version mismatch in reprolang/package.json: expected ${version}, got ${reprolangVersion}";
    pkgs.buildGoModule {
      pname = "scip-reprolang";
      inherit version;
      src = ./.;
      modRoot = "./reprolang";
      vendorHash = "sha256-H6RLXmQsufwKtI5BujsUEibVuCMpILqtX3W0Wg9m3T8=";
      proxyVendor = true;
      buildInputs = [ pkgs.tree-sitter ];
      subPackages = [
        "grammar"
        "repro"
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
      cd reprolang
      cp -r grammar grammar-before
      tree-sitter generate --abi 14 --output grammar
      prettier --write 'grammar/grammar.json' 'grammar/node-types.json'
      diff -rq grammar-before grammar
    '';
    installPhase = "touch $out";
  };

  rust-bindings =
    let
      cargoTomlVersion =
        (builtins.fromTOML (builtins.readFile ./bindings/rust/Cargo.toml)).package.version;
    in
    assert pkgs.lib.assertMsg (
      cargoTomlVersion == version
    ) "Version mismatch in bindings/rust/Cargo.toml: expected ${version}, got ${cargoTomlVersion}";
    pkgs.rustPlatform.buildRustPackage {
      pname = "scip-bindings-rust";
      inherit version;
      src = ./bindings/rust;
      cargoLock = {
        lockFile = ./bindings/rust/Cargo.lock;
      };
    };

  typescript-bindings =
    let
      packageJsonVersion =
        (builtins.fromJSON (builtins.readFile ./bindings/typescript/package.json)).version;
    in
    assert pkgs.lib.assertMsg (packageJsonVersion == version)
      "Version mismatch in bindings/typescript/package.json: expected ${version}, got ${packageJsonVersion}";
    pkgs.buildNpmPackage {
      pname = "scip-bindings-typescript";
      inherit version;
      src = ./bindings/typescript;
      npmDepsHash = "sha256-8ARcCJUUHebhvjL55X6+9h9JxLSoCe0VC51z7HZI4aE=";
      buildPhase = ''
        runHook preBuild
        npx tsc --noEmit
        runHook postBuild
      '';
      installPhase = "touch $out";
    };
}
