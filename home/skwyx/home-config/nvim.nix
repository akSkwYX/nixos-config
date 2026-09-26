{ config, pkgs, ... }:
{
  home.packages = [
    pkgs.gcc
    pkgs.cmake
  ];

	home.file = {
		".config/nvim" = {
			source = config.lib.file.mkOutOfStoreSymlink "/home/skwyx/.dotfiles/nvim";
			recursive = true;
		};
	};
}
