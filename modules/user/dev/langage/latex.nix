{ config, pkgs, lib, ... }:
{
  home.packages = [
    pkgs.texliveFull
  ];
}
