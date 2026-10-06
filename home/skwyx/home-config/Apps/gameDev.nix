{ config, pkgs, lib, osConfig, ... }:
{
  config = lib.mkIf osConfig.my.gameDev.enable {
    home.packages = with pkgs; [
      blockbench
      godot
    ];
  };
}
