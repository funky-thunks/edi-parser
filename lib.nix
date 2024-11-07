{
  mkHaskellOverlay =
    { deps ? []
    , extraDepsRoot ? ./.
    , localPackages ? {}
    , overrides ? (_: _: {})
    }:

    pkgsNew: pkgsOld:
      let extraDep = definition:
            if builtins.isString definition
            then extraDepWithoutNativeDeps definition
            else extraDepWithNativeDeps    definition;
          extraDepWithoutNativeDeps = name: callHaskellPackage name {};
          extraDepWithNativeDeps = { name, nativeDeps }: callHaskellPackage name (nativeDeps pkgsOld);
          callHaskellPackage = name: attrs:
            { "${name}" = pkgsNew.haskellPackages.callPackage (extraDepsRoot + "/${name}.nix") attrs; };
          extraDeps = names: pkgsNew.lib.lists.foldr (a: b: a // b) {} (map extraDep names);

          mkLocal = old: name: def:
            if builtins.isPath def
            then old.callCabal2nix name def {}
            else pkgsOld.haskell.lib.overrideCabal (old.callCabal2nix name def.src {}) (_: {
                   buildDepends = [pkgsOld.makeWrapper];
                   postInstall = ''
                     wrapProgram $out/bin/${name} \
                       --set PATH ${pkgsOld.lib.makeBinPath (def.runtimeInputs pkgsOld)}
                   '';
                 });
          local = old: pkgsNew.lib.attrsets.mapAttrs (mkLocal old);
       in {
            haskellPackages = pkgsOld.haskellPackages.override (_: {
              overrides = final: old: overrides final old // extraDeps deps // local old localPackages;
            });
          };
}
