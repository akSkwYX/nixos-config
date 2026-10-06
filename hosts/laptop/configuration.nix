{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ../../modules/features.nix
      ../../modules/boot.nix
      ../../modules/networking.nix
      ../../modules/nix-settings.nix
			../../modules/agenix.nix
      ../../modules/users.nix
    ];

  my.gameDev.enable = false;

  system.stateVersion = "26.05";
}
