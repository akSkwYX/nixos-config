{ config, lib, pkgs, ... }:
{
  home.packages = lib.mkIf config.components.dev.language.css.enable [
    pkgs.scss-lint
    pkgs.csslint
    pkgs.css-checker
  ];
}
