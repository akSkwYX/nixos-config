{ config, pkgs, lib, ... }:
{
  imports = [
    ./ghostty.nix
    ./wezterm.nix
    ./zsh.nix
    ./oh-my-posh.nix
  ];
}
