{ config, pkgs, lib, ... }:
{
  options = {
    users.skwyx.enable = lib.mkEnableOption "Enable skwyx user";
  };
}
