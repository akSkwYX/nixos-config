{ config, pkgs, ... }:
{
  imports = [
    ./git.nix
    ./nvim.nix
    ./rclone.nix
  ];

  home.packages = with pkgs; [
    zip
    unzip
    tree
  ];
}
