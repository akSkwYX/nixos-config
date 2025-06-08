{ config, pkgs, lib, ... }:
{
  imports = [
    ./hardware-configuration.nix
  ];

  # Choose window manager (currently only hyprland, who need something else ?)
  hyprland.enable = true;

  # Bootloader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # User account
  users.users.skwyx = {
    isNormalUser = true;
    description = "SkwYX";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
    useDefaultShell = true;
  };

  users.defaultUserShell = pkgs.zsh;

  # Initial system state version
  # Don't touch ! This will not upgrade your system if you update it 
  # instead it will break your system
  system.stateVersion = "24.11";

}
