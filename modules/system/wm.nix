{ config, pkgs, lib, ... }:
{
  programs.hyprland = {
    enable = config.components.windowManager.hyprland.enable;
    package = pkgs.hyprland;
    xwayland.enable = true;
  };
  
  nixpkgs.config.allowUnfree = true;
}
