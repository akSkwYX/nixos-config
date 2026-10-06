{ config, pkgs, ... }:
{
  imports = [
    ./keepassxc.nix
    ./qutebrowser.nix
    ./wezterm.nix
    ./gameDev.nix
  ];

  home.packages = with pkgs; [
    evince
    anki
    typst
    swayimg
  ];
}
