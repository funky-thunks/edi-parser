{ pkgs, toExeName ? (e: if pkgs.lib.hasInfix "/" e.exeName then e.exeName else "bin/${e.exeName}") }:
let
  nix-bundle = import (builtins.fetchTarball "https://github.com/matthewbauer/nix-bundle/archive/master.tar.gz") {};
  toNixBundle = e: if pkgs.lib.isDerivation e then
    nix-bundle.nix-bootstrap {
      target = e;
      run = "/${toExeName e}";
      nixUserChrootFlags = "-m /builds:/builds";
    } else e;
in
  {
    # This function takes an (possibly deep) attrset of derivations and
    # turns those derivations into bundles, returning the same attrset
    bundled-derivations = pkgs.lib.mapAttrsRecursiveCond
      (f: !builtins.isBool f && !(pkgs.lib.isDerivation f))
      (_: toNixBundle);
    # This function collects all the derivations of an attrset, and
    # turns them into a directory of executable bundles.
    bundled-dist = derivations: pkgs.runCommand "dist" {} ''
      mkdir -p $out/bin
      ${builtins.concatStringsSep "\n"
      (map
        (b: "cp ${toNixBundle b} $out/${toExeName b}")
        (pkgs.lib.collect pkgs.lib.isDerivation derivations)
      )}
    '';
    bundled-documentation = derivations: pkgs.runCommand "documentation" {} ''
      mkdir -p $out/share/doc
      ${builtins.concatStringsSep "\n"
      (map
        (b: ''
          for f in ${b}/share/doc/*; do
            cp -a "$f/html" $out/share/doc/$(basename "$f")
          done
        '')
        (pkgs.lib.collect pkgs.lib.isDerivation derivations)
      )}
    '';
    # This function collects all the derivations of an attrset, and
    # turns them into a tarball of executable bundles.
    tarball = derivations: pkgs.runCommand "bundled.tar.gz" {} ''
    tar -Pczf $out ${builtins.concatStringsSep " "
      (map
        (b: "--transform=s@${toNixBundle b}@${toExeName b}@ ${toNixBundle b}")
        (pkgs.lib.collect pkgs.lib.isDerivation derivations)
      )}
    '';
  }
