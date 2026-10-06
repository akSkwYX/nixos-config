{ config, pkgs, ... }:
{
  home.packages = [
    pkgs.gcc
    pkgs.cmake
    pkgs.tree-sitter
  ];

	home.file = {
		".config/nvim" = {
			source = config.lib.file.mkOutOfStoreSymlink "/home/skwyx/.dotfiles/nvim";
			recursive = true;
		};
	};
}
