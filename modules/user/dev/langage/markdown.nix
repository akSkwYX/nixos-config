{ config, pkgs, lib, ... }:
{
  programs.pandoc = lib.mkIf config.components.dev.langage.markdown.enable {
    enable = true;
  };
}
