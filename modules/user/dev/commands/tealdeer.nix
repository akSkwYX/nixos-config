{ config, pkgs, lib, ... }:
{
  programs.tealdeer = {
    enable = config.components.dev.commands.tealdeer.enable;
    enableAutoUpdates = true;
  };
}
