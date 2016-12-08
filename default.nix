{ pkgs ? import <nixpkgs> { overlays = []; } }:

with pkgs;
let
  stack = stdenv.mkDerivation rec {
    name = "stack-${version}";
    version = "2.3.3";
    src = fetchurl {
      url = "https://github.com/commercialhaskell/stack/releases/download/v${version}/stack-${version}-linux-x86_64.tar.gz";
      sha256 = "1gm2llfwhal5ds6s21066mpr0lg4090rbaicn671dsn7v5srqcp7";
    };
    nativeBuildInputs = [ autoPatchelfHook ];
    buildInputs = [
      gmp
      zlib
    ];
    dontFixup = true;
    unpackPhase = ''
      tar -xf $src
    '';
    installPhase = ''
      mkdir -p $out/bin
      cp -r stack-${version}-linux-x86_64/stack $out/bin
    '';
  };
  stylish-haskell = stdenv.mkDerivation rec {
    name = "stylish-haskell-${version}";
    version = "0.12.2.0";
    nativeBuildInputs = [ autoPatchelfHook ];
    buildInputs = [];
    src = fetchurl {
      url = "https://github.com/jaspervdj/stylish-haskell/releases/download/v${version}/stylish-haskell-v${version}-linux-x86_64.tar.gz";
      sha256 = "1v7r2vm3q9xn9xdwmmx2b9yl0a9x0101mni1ipd2k3ph5x3pf3gm";
    };
    unpackPhase = ''
      tar -xzf $src
    '';
    installPhase = ''
      mkdir -p $out/bin
      cp -r stylish-haskell-v${version}-linux-x86_64/stylish-haskell $out/bin
    '';
  };
  hlint = stdenv.mkDerivation rec {
      name = "hlint-${version}";
      version = "2.2.1";
      nativeBuildInputs = [ autoPatchelfHook ];
      buildInputs = [ gmp ncurses5 ];
      src = fetchurl {
        url = "https://github.com/ndmitchell/hlint/releases/download/v${version}/hlint-${version}-x86_64-linux.tar.gz";
        sha256 = "03ipgynd4vkcm89nzgzd10m6k4rr5fsnk93zgv7d7d9lhy6y7vhg";
      };
      unpackPhase = ''
        tar -xf $src
      '';
      installPhase = ''
        mkdir -p $out/bin
        cp -r hlint-${version}/* $out/bin/
      '';
    };
in
{
  inherit shellcheck git stack stylish-haskell hlint;
}
