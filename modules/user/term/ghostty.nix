{ config, pkgs, lib, ... }:
{
  programs.ghostty = {
    enable = true;
    enableZshIntegration = true;
    enableBashIntegration = true;
    settings = {
      background-opacity = 0.8;
      theme = "Pro";
    };
  };
}
