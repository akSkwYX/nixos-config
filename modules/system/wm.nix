{ config, pkgs, lib, inputs, ... }:
{
  programs.hyprland = {
    enable = config.components.windowManager.hyprland.enable;
    package = inputs.hypr-flake.hyprpkg;
    xwayland.enable = true;
  };
}
