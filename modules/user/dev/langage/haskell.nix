{ config, pkgs, lib, ... }:
{
  home.packages = lib.mkIf config.components.dev.langage.haskell.enable [
    pkgs.ghc
    pkgs.haskellPackages.hls
  ];
}
