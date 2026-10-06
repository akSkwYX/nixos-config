{ config, pkgs, ... }:
{
  imports = [
    ./niri.nix
    ./quickshell.nix
  ];

  home.packages = with pkgs; [
    swaybg
  ];
}
