{ config, pkgs, lib, ... }:
{
  options = {
    components.windowManager.hyprland.enable = lib.mkEnableOption "Enable hyprland windowManager";
    components.windowManager.sway.enable = lib.mkEnableOption "Enable sway windowManager";
  };
}
