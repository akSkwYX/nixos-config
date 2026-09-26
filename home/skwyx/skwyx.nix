{ config, pkgs, inputs, ... }:
{
	imports = [
    inputs.agenix.homeManagerModules.default

		./home-config/git.nix
		./home-config/niri.nix
		./home-config/wezterm.nix
		./home-config/qutebrowser.nix
		./home-config/rclone.nix
		./home-config/keepassxc.nix
		./home-config/nvim.nix
    ./home-config/shell.nix
    ./home-config/dev/languages.nix
    ./home-config/apps/apps.nix
	];

	home.username = "skwyx";
	home.homeDirectory = "/home/skwyx";

	home.stateVersion = "26.05";
}
