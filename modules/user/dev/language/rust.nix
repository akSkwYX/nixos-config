{ config, lib, pkgs, ... }:
{
  home.packages = lib.mkIf config.components.dev.language.rust.enable [
    pkgs.rustc
  ];
}
