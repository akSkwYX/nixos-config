{ config, pkgs, lib, ... }:
{
  home.packages = lib.mkIf config.components.dev.language.c.enable [
    pkgs.gccgo14
    pkgs.harper
    pkgs.cppcheck
    pkgs.cling
  ];
}
