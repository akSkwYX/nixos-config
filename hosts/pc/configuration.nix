{ config, pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
      ../../modules/boot.nix
      ../../modules/networking.nix
      ../../modules/nix-settings.nix
			../../modules/agenix.nix
      ../../modules/users.nix
    ];

  system.stateVersion = "26.05";
}
