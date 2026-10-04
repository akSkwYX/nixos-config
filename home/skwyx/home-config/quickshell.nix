{ config, pkgs, ... }:
{
  home.packages = [
    pkgs.quickshell
  ];

  home.file = {
    ".config/quickshell" = {
      source = config.lib.file.mkOutOfStoreSymlink "/home/skwyx/.dotfiles/quickshell";
      recursive = true;
    };
  };
}
