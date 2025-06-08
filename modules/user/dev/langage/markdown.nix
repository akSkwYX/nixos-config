{ config, pkgs, lib, ... }:
{
  programs.pandoc = {
    enable = true;
  };
}
