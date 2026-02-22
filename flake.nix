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
        license = pkgs.lib.licenses.asl20;
        version = pkgs.lib.fileContents ./cmd/scip/version.txt;
        sampleIndexes = import ./sample-indexes.nix { inherit pkgs; };
      in
      {
        packages = {
          scip = pkgs.buildGoModule {
            pname = "scip";
            inherit version;

            src = ./.;
            vendorHash = "sha256-8HgeG/SXkM7ptOwKSi/PUH3VySxFqqoIpXI7bZtbO4A=";

            subPackages = [ "cmd/scip" ];

            ldflags = [ "-X main.Reproducible=true" ];

            meta = {
              description = "SCIP Code Intelligence Protocol";
              homepage = "https://github.com/sourcegraph/scip";
              inherit license;
              mainProgram = "scip";
            };
          };

          speedtest = pkgs.buildGoModule {
            pname = "scip-speedtest";
            inherit version;

            src = ./.;
            vendorHash = "sha256-8HgeG/SXkM7ptOwKSi/PUH3VySxFqqoIpXI7bZtbO4A=";

            subPackages = [ "bindings/go/scip/speedtest" ];

            nativeBuildInputs = [ pkgs.makeWrapper ];
            postFixup = ''
              wrapProgram $out/bin/speedtest \
                --set SCIP_SAMPLE_INDEXES_DIR ${sampleIndexes}
            '';

            meta = {
              description = "SCIP symbol parser benchmark";
              homepage = "https://github.com/sourcegraph/scip";
              inherit license;
              mainProgram = "speedtest";
            };
          };

          default = self.packages.${system}.scip;
        };

        checks = import ./checks.nix {
          inherit
            pkgs
            version
            license
            sampleIndexes
            ;
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
