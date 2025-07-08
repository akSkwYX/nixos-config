{ config, pkgs, lib, ... }:
{
  imports = [
    ./hardware-configuration.nix
  ];

  nixpkgs.config.allowUnfree = true;
  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

  system.stateVersion = "25.11";
}
