{ config, lib, pkgs, inputs, ...  }:
{
  imports = [
    ../../modules/user/users_modules.nix
    inputs.hypr-dotfiles.homeModules.default
    inputs.nvim-dotfiles.homeModules.default
    ./git.nix
    # ./1password.nix
  ];

  components = {
    git.enable = true;
    nvim.enable = true;

    # Desktop App
    # File manager
    desktop.dolphin.enable = false;
    desktop.nautilus.enable = true;
    desktop.thunar.enable = false;

    # Document viewer
    desktop.evince.enable = true;
    desktop.gwenview.enable = true;

    # Browser
    desktop.zen.enable = true;

    # Other
    desktop.anki.enable = true;
    desktop._1password.enable = true;
    desktop.kdeConnect.enable = false;

    # Terminal components
    term.wezterm.enable = true;
    term.ghostty.enable = false;
    term.oh-my-posh.enable = true;
    term.zsh.enable = true;

    # Dev components
    dev.commands.tealdeer.enable = true;
    dev.commands.fastfetch.enable = true;
    dev.commands.neofetch.enable = false;
    dev.commands.zip.enable = true;
    dev.commands.hyperfine.enable = true;
    dev.commands.make.enable = true;
    dev.commands.tree.enable = true;
    dev.commands.xprop.enable = false;

    # Language support
    dev.language.c.enable = true;
    dev.language.css.enable = false;
    dev.language.haskell.enable = true;
    dev.language.latex.enable = true;
    dev.language.lua.enable = true;
    dev.language.markdown.enable = true;
    dev.language.ocaml.enable = true;
    dev.language.rust.enable = false;
    dev.language.java.enable = false;
    dev.language.python.enable = false;
  };

  home.username = "skwyx";
  home.homeDirectory = lib.mkDefault "/home/skwyx";
  
  home.stateVersion = "25.11";

  programs.home-manager.enable = true;
}
