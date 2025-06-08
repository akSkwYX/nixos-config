{ config, lib, pkgs, ... }:
{
  home.packages = [
    pkgs.scss-lint
    pkgs.csslint
    pkgs.css-checker
  ];
}
