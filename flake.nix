{
  description = "SCIP - Source Code Intelligence Protocol";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        lib = pkgs.lib;
        license = lib.licenses.asl20;
        pkgs = nixpkgs.legacyPackages.${system};
        version = lib.fileContents ./cmd/scip/version.txt;
      in
      {
        packages = {
          scip = pkgs.buildGoModule {
            pname = "scip";
            inherit version;

            src = ./.;
            vendorHash = "sha256-8HgeG/SXkM7ptOwKSi/PUH3VySxFqqoIpXI7bZtbO4A=";

            subPackages = [ "cmd/scip" ];

            meta = {
              description = "SCIP Code Intelligence Protocol";
              homepage = "https://github.com/sourcegraph/scip";
              inherit license;
              mainProgram = "scip";
            };
          };

          default = self.packages.${system}.scip;
        };

        checks = {
          go-bindings = pkgs.buildGoModule {
            pname = "scip-bindings-go";
            inherit version;
            src = ./.;
            vendorHash = "sha256-8HgeG/SXkM7ptOwKSi/PUH3VySxFqqoIpXI7bZtbO4A=";
            subPackages = [ "bindings/go/scip" ];
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
        };

        formatter = pkgs.nixfmt-rfc-style;

        devShells.default = pkgs.mkShell {
          inputsFrom = [ self.packages.${system}.scip ];

          packages =
            with pkgs;
            [
              cargo
              go
              nodejs
              rustc
              yarn
            ]
            ++ (with pkgs.haskellPackages; [
              ghc
              cabal-install
              proto-lens-runtime
            ]);
        };
      }
    );
}
