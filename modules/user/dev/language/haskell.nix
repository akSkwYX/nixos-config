{ config, pkgs, lib, ... }:
{
  home.packages = lib.mkIf config.components.dev.language.haskell.enable [
    pkgs.ghc
    pkgs.haskell-language-server
  ];
}
