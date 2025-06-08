{ config, pkgs, lib, ... }:
{
  home.packages = [
    pkgs.lua-language-server
  ];
}
