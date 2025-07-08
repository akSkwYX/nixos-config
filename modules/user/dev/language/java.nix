{ config, pkgs, lib, ... }:
{
  home.packages = lib.mkIf config.components.dev.language.java.enable [
    pkgs.zulu24
    pkgs.gradle
    pkgs.java-language-server
  ];
}
