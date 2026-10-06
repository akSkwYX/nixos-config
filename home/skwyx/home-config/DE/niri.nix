{ config, pkgs, ... }:
{
  home.packages = [
    pkgs.niri
    pkgs.xwayland-satellite
  ];

  home.file = {
    ".config/niri" = {
      source = config.lib.file.mkOutOfStoreSymlink "/home/skwyx/.dotfiles/niri";
      recursive = true;
    };
  };
}
