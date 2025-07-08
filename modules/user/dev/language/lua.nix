{ config, pkgs, lib, ... }:
{
  home.packages = lib.mkIf config.components.dev.language.lua.enable [
    pkgs.lua
    pkgs.lua-language-server
    pkgs.lua54Packages.luarocks
  ];
}
