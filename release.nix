let
  haskellNixSrc = builtins.fetchTarball "https://github.com/input-output-hk/haskell.nix/archive/1c2c9cd47f267aacf5472477a9827b18cfe5252a.tar.gz";
  haskellNix = import haskellNixSrc {};
  pkgs = import haskellNix.sources.nixpkgs-unstable haskellNix.nixpkgsArgs;
  nixBundleLib = import ./release-bundle.nix { inherit pkgs; };
  projectName = "edi-parser";
  selfPackagesNames = map (v: "${projectName}-${v}") [ "core" "scaffolder" "specification" ];
  project = pkgs.haskell-nix.project' {
    src = pkgs.haskell-nix.haskellLib.cleanGit {
      name = projectName;
      src = ./.;
    };
  };
  selfPackages = pkgs.lib.genAttrs selfPackagesNames (n: project.hsPkgs.${n});
  extractComponent = type: pkgs.haskell-nix.haskellLib.collectComponents' type selfPackages;
  mapRecursive = action: pkgs.lib.mapAttrsRecursiveCond (as: !(as ? "type" && as.type == "derivation"))
    (n: v: if builtins.isBool v then v else action n v);

  extractDocumentation = mapRecursive (n: v: v.haddock.doc) (extractComponent "library");
  toEnv = derivations: pkgs.buildEnv {
    name = "project-env";
    ignoreCollisions = true;
    paths = pkgs.lib.collect pkgs.lib.isDerivation derivations;
  };
in selfPackages // project // rec {
  inherit selfPackagesNames;
  checks = pkgs.haskell-nix.haskellLib.collectChecks' selfPackages;
  exes = extractComponent "exes";
  library = extractComponent "library";
  documentation = extractDocumentation;
  foreignlibs = extractComponent "foreignlibs";
  sublibs = extractComponent "sublibs";
  benchmarks = extractComponent "benchmarks";
  tests = extractComponent "tests";
  project-env = toEnv exes;
  bundled-dist = nixBundleLib.bundled-dist exes;
  bundled-documentation = nixBundleLib.bundled-documentation documentation;
  bundled-exes = nixBundleLib.bundled-derivations exes;
  bundled-project-env = nixBundleLib.tarball exes;
}
