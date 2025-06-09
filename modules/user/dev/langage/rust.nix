{ config, lib, pkgs, ... }:
{
  home.packages = lib.mkIf config.components.dev.langage.rust.enable [
    pkgs.rustc
  ];
}
