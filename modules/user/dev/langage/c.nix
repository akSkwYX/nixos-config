{ config, pkgs, lib, ... }:
{
  home.packages = [
    pkgs.gccgo14
    pkgs.harper
    pkgs.cppcheck
    pkgs.cling
  ];
}
