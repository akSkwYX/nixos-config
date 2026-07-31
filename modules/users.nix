{ config, pkgs, ... }:

{
  users.users."skwyx" = {
    isNormalUser = true;
    description = "SkwYX";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };
}
