{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    typst
    gnumake
    gcc
  ];
}
