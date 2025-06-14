{ config, pkgs, lib, ... }:
let python-config = pkgs.python313.withPackages (ps: with ps; [
      matplotlib
      numpy
    ]);
in
{
  home.packages = lib.mkIf (config.components.dev.langage.python.enable && !config.components.windowManager.hyprland.enable) [
    python-config
  ];
}
