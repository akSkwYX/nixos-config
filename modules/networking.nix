{ config, pkgs, ... }:

{
	networking.hostName = "sk";

	networking.networkmanager.enable = true;
}
