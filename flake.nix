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
        pkgs = nixpkgs.legacyPackages.${system};
        version = pkgs.lib.fileContents ./cmd/scip/version.txt;
        sampleIndexes = import ./sample-indexes.nix { inherit pkgs; };
      in
      {
        packages = {
          scip = pkgs.buildGoModule {
            pname = "scip";
            inherit version;

            src = ./.;
            vendorHash = "sha256-ywSR9yRysnm2E6kI8UJS6XcpuqKJF8wJpHcYS7TGmjI=";

            subPackages = [ "cmd/scip" ];

            ldflags = [ "-X main.Reproducible=true" ];

            meta = {
              description = "SCIP Code Intelligence Protocol";
              homepage = "https://github.com/sourcegraph/scip";
              license = pkgs.lib.licenses.asl20;
              mainProgram = "scip";
            };
          };

          speedtest = pkgs.buildGoModule {
            pname = "scip-speedtest";
            inherit version;

            src = ./.;
            vendorHash = "sha256-ywSR9yRysnm2E6kI8UJS6XcpuqKJF8wJpHcYS7TGmjI=";

            subPackages = [ "bindings/go/scip/speedtest" ];

            nativeBuildInputs = [ pkgs.makeWrapper ];
            postFixup = ''
              wrapProgram $out/bin/speedtest \
                --set SCIP_SAMPLE_INDEXES_DIR ${sampleIndexes}
            '';
          };

          proto-generate =
            let
              protoc-gen-rs = pkgs.rustPlatform.buildRustPackage {
                pname = "protoc-gen-rs";
                version = "3.7.2";
                src = pkgs.fetchCrate {
                  pname = "protobuf-codegen";
                  version = "3.7.2";
                  hash = "sha256-0d+xjYXpl87Sq/DdE8K2olnKa5bNpEHX7RTjp/2xza4=";
                };
                cargoHash = "sha256-xxw1WSP0Qatf5QT+JBUQPi8HFOPRMGbnFMVLOiKnTNk=";
                cargoBuildFlags = [
                  "--bin"
                  "protoc-gen-rs"
                ];
                nativeBuildInputs = [ pkgs.protobuf ];
              };
            in
            pkgs.writeShellApplication {
              name = "proto-generate";
              runtimeInputs = with pkgs; [
                buf
                gotools
                haskellPackages.proto-lens-protoc
                prettier
                protoc-gen-doc
                protoc-gen-es
                protoc-gen-go
                protoc-gen-rs
              ];
              text = ''
                buf generate
                goimports -w ./bindings/go/scip/scip.pb.go
                prettier --write --list-different '**/*.{ts,js(on)?,md,yml}'
              '';
            };

          default = self.packages.${system}.scip;
        };

        checks = import ./checks.nix {
          inherit
            pkgs
            version
            sampleIndexes
            ;
        };

        formatter = pkgs.nixfmt;

        devShells.default = pkgs.mkShell {
          inputsFrom = [ self.packages.${system}.scip ];

          packages =
            with pkgs;
            [
              cargo
              go
              nodejs
              rustc
              tree-sitter
            ]
            ++ (with pkgs.haskellPackages; [
              cabal-install
              ghc
              proto-lens-runtime
            ]);
        };
      }
    );
}
