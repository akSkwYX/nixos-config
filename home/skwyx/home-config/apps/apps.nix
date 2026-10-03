{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    evince
    anki
    typst
    swaybg
    swayimg
  ];
}
