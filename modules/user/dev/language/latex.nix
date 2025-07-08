{ config, pkgs, lib, ... }:
{
  home.packages = lib.mkIf config.components.dev.language.latex.enable [
    pkgs.texliveFull
  ];
}
