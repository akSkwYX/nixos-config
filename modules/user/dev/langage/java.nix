{ config, pkgs, lib, ... }:
{
  home.packages = lib.mkIf config.components.dev.langage.java.enable [
    pkgs.zulu24
    pkgs.gradle
    pkgs.java-language-server
  ];
}
