{ config, pkgs, ... }:
{
	imports = [
		./home-config/git.nix
	];

	home.username = "skwyx";
	home.homeDirectory = "/home/skwyx";

	home.stateVersion = "26.05";
}
