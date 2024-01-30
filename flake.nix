{
  description = "General approach to Edifact messages parsing in haskell.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/release-23.11";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    { nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = import nixpkgs { inherit system; overlays = [overlay]; };
          overlay = (import ./lib.nix).mkHaskellOverlay {
            localPackages = {
              edi-parser-core          = ./core;
              edi-parser-specification = ./specification;
              edi-parser-scaffolder    = {
                src = ./scaffolder;
                runtimeInputs = ps: [ ps.stylish-haskell ];
              };
            };
          };

          documentation =
            pkgs.symlinkJoin {
              name = "edi-parser-all-doc";
              paths = with pkgs.haskellPackages; [
                edi-parser-core.doc
                edi-parser-scaffolder.doc
                edi-parser-specification.doc
              ];
            };

          mkApp = name:
            let pkg = pkgs.haskellPackages.${name};
             in {
                  "${name}" = {
                    type = "app";
                    program = "${pkg}/bin/${name}";
                  };
                };

      in {
        apps = mkApp "edi-parser-scaffolder" // mkApp "edi-parser-specification";

        packages = {
          default = pkgs.haskellPackages.edi-parser-core;
          inherit (pkgs.haskellPackages) edi-parser-core edi-parser-scaffolder edi-parser-specification;
          inherit documentation;
        };

        devShells.default = with pkgs; mkShell {
          buildInputs = [ cabal-install ghc hlint zlib ];
        };
      }
    );
}
