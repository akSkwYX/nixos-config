{ config, pkgs, ... }:
{
	programs.wezterm = {
		enable = true;
		enableBashIntegration = true;
	};

  home.file = {
    ".config/wezterm" = {
      source = config.lib.file.mkOutOfStoreSymlink "/home/skwyx/.dotfiles/wezterm";
      recursive = true;
    };
  };
}
