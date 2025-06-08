{ config, pkgs, lib, ... }:
{
  home.packages = [
    pkgs.ghc
    pkgs.haskellPackages.haskell-language-server
  ];
}
