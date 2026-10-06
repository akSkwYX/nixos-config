{ config, pkgs, inputs, ... }:
{
	imports = [
    inputs.agenix.homeManagerModules.default

    ./home-config/Apps/apps.nix
    ./home-config/DE/de.nix
    ./home-config/Shell/shell.nix
    ./home-config/Tools/tools.nix
	];

  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;

	home.username = "skwyx";
	home.homeDirectory = "/home/skwyx";

	home.stateVersion = "26.05";
}
