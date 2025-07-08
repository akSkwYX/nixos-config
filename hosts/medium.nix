{ config, pkgs, lib, inputs, ... }:
{
  imports = [
    ./common.nix
    ../modules/system/basic-packages.nix
    ../modules/system/networking.nix
    inputs.hypr-dotfiles.systemModules.default
  ];

  networking.hostName = "laptop";

  users = {
    skwyx.enable = true;
  };

  components = {
    windowManager.sway.enable = false;
    windowManager.hyprland.enable = true;
  };

  programs.hyprland = {
    enable = config.components.windowManager.hyprland.enable;
    package = inputs.hypr-dotfiles.hyprpkg;
    xwayland.enable = true;
  };
}
