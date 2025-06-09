{ config, pkgs, lib, ... }:
{
  home.packages = lib.mkIf config.components.dev.langage.latex.enable [
    pkgs.texliveFull
  ];
}
