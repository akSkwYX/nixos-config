{ config, pkgs, lib, ... }:
{
  home.packages = lib.mkIf config.components.dev.langage.haskell.enable [
    pkgs.ghc
    pkgs.haskell-language-server
  ];
}
