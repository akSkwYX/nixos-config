{ config, pkgs, ... }:
{
  home.packages = [
    pkgs.quickshell
    pkgs.libnotify
  ];

  home.file = {
    ".config/quickshell" = {
      source = config.lib.file.mkOutOfStoreSymlink "/home/skwyx/.dotfiles/quickshell";
      recursive = true;
    };
  };
}
