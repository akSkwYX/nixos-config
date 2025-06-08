{ config, lib, pkgs, ... }:
{
  home.packages = [
    pkgs.rustc
  ];
}
