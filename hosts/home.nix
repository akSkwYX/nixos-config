{ config, pkgs, lib, ... }:

{
  imports = [
    ../modules/user/desktopApp/desktopApp.nix
    ../modules/user/dev/dev.nix
    ../modules/user/term/term.nix
    ../modules/user/git.nix 
  ];

  home.sessionVariables = {
    TERMINAL = "wezterm";
    BROWSER = "zen";
    FILEMANAGER = "nautilus";
    WALLPAPER = "~/Pictures/wallpapers/Sabo.jpg";
  };

  home.username = "skwyx";
  home.homeDirectory = "/home/skwyx";

  home.stateVersion = "24.11";

  programs.home-manager.enable = true;
}
