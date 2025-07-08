{ config, pkgs, lib, ... }:
{
  programs.ghostty = {
    enable = config.components.term.ghostty.enable;
    enableZshIntegration = true;
    enableBashIntegration = true;
    settings = {
      background-opacity = 0.8;
      theme = "Pro";
    };
  };
}
