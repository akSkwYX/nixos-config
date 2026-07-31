{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ../../modules/boot.nix
      ../../modules/networking.nix
      ../../modules/users.nix
      ../../modules/nix-settings.nix
    ];

  system.stateVersion = "26.05";
}
