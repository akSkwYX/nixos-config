{ config, lib, pkgs, ... }:
{
  home.packages = lib.mkIf config.components.dev.langage.css.enable [
    pkgs.scss-lint
    pkgs.csslint
    pkgs.css-checker
  ];
}
