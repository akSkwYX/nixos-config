{ config, pkgs, ... }:
{
  home.packages = [ 
    pkgs.qutebrowser 
    pkgs.python314Packages.adblock
    pkgs.mpv
  ];

  home.file = {
    ".config/qutebrowser" = {
			source = config.lib.file.mkOutOfStoreSymlink "/home/skwyx/.dotfiles/qutebrowser";
      recursive = true;
    };
  };
}
