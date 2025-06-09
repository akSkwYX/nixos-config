{ config, pkgs, lib, ... }:
{
  home.packages = lib.mkIf config.components.dev.langage.lua.enable [
    pkgs.lua-language-server
  ];
}
