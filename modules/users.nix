{ config, pkgs, ... }:

{
	imports = [
		../home/skwyx/skwyx-config.nix
	];

  users.users."skwyx" = {
    isNormalUser = true;
    description = "SkwYX";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  services.displayManager.sddm = {
		enable = true;
		autoNumlock = true;
		wayland.enable = true;
	};
	services.displayManager.defaultSession = "niri";
}
