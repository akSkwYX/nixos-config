{ config, pkgs, lib, ... }:
{
  programs.pandoc = lib.mkIf config.components.dev.language.markdown.enable {
    enable = true;
  };
}
