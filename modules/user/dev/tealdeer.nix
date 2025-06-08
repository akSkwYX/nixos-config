{ config, pkgs, lib, ... }:
{
  programs.tealdeer = {
    enable = true;
    enableAutoUpdates = true;
  };
}
