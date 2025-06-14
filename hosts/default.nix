{ config, pkgs, lib, ... }:
{
  imports = [
    ./hardware-configuration.nix
  ];  

  # Bootloader
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.systemd-boot.enable = true;

  # Add experimental features
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

  nixpkgs.config.allowUnfree = true;

  # User account
  users.users.skwyx = {
    isNormalUser = true;
    description = "SkwYX";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = if config.components.term.zsh.enable then
      pkgs.zsh
    else
      pkgs.bash
    ;
    useDefaultShell = true;
    ignoreShellProgramCheck = true;
  };

  # Initial system state version
  # Don't touch ! This will not upgrade your system if you update it 
  # instead it will break your system
  system.stateVersion = "24.11";
}
