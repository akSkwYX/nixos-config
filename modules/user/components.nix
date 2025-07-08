{ config, pkgs, lib, ... }:
{
  options = {
    # Just God
    components.git.enable = lib.mkEnableOption "Enable Git";
    # Second God
    components.nvim.enable = lib.mkEnableOption "Enable neovim configuration";

    # Desktop App
    # File manager
    components.desktop.dolphin.enable = lib.mkEnableOption "Enable Dolphin file manager";
    components.desktop.nautilus.enable = lib.mkEnableOption "Enable Nautilus file manager";
    components.desktop.thunar.enable = lib.mkEnableOption "Enable Thunar file manager";

    # Document viewer
    components.desktop.evince.enable = lib.mkEnableOption "Enable evince";
    components.desktop.gwenview.enable = lib.mkEnableOption "Enable gwenview";

    # Browser
    components.desktop.zen.enable = lib.mkEnableOption "Enable zen browser";

    # Other
    components.desktop.anki.enable = lib.mkEnableOption "Enable Anki";
    components.desktop._1password.enable = lib.mkEnableOption "Enable 1password";
    components.desktop.kdeConnect.enable = lib.mkEnableOption "Enable kdeConnect";

    # Terminal components
    components.term.wezterm.enable = lib.mkEnableOption "Enable Wezterm";
    components.term.ghostty.enable = lib.mkEnableOption "Enable Ghostty";
    components.term.oh-my-posh.enable = lib.mkEnableOption "Enable Oh-my-posh";
    components.term.zsh.enable = lib.mkEnableOption "Enable Zsh";

    # Dev components

    # Commands
    components.dev.commands.tealdeer.enable = lib.mkEnableOption "Enable tealdeer";
    components.dev.commands.fastfetch.enable = lib.mkEnableOption "Enable fastfetch";
    components.dev.commands.neofetch.enable = lib.mkEnableOption "Enable neofetch";
    components.dev.commands.zip.enable = lib.mkEnableOption "Enable zip and unzip";
    components.dev.commands.hyperfine.enable = lib.mkEnableOption "Enable hyperfine";
    components.dev.commands.make.enable = lib.mkEnableOption "Enable make";
    components.dev.commands.tree.enable = lib.mkEnableOption "Enable tree";
    components.dev.commands.xprop.enable = lib.mkEnableOption "Enable xprop";

    # Langage support
    components.dev.language.c.enable = lib.mkEnableOption "Enable C support";
    components.dev.language.css.enable = lib.mkEnableOption "Enable CSS support";
    components.dev.language.haskell.enable = lib.mkEnableOption "Enable Haskell support";
    components.dev.language.latex.enable = lib.mkEnableOption "Enable Latex support";
    components.dev.language.lua.enable = lib.mkEnableOption "Enable Lua support";
    components.dev.language.markdown.enable = lib.mkEnableOption "Enable Markdown support";
    components.dev.language.ocaml.enable = lib.mkEnableOption "Enable Ocaml support";
    components.dev.language.rust.enable = lib.mkEnableOption "Enable Rust support";
    components.dev.language.java.enable = lib.mkEnableOption "Enable Java support";
    components.dev.language.python.enable = lib.mkEnableOption "Enable Python support";
  };
}
