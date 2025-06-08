{ config, pkgs, lib, ... }:
{
  options = {
    # System-level components

    # Window manager
    components.windowManager.hyprland.enable = lib.mkEnableOption "Enable hyprland + Wayland session";


    # User-level components

    # Just God
    components.git.enable = lib.mkEnableOption "Enable Git";

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
    componenets.dev.commands.make.enable = lib.mkEnableOption "Enable make";

    # Langage support
    components.dev.langage.c.enable = lib.mkEnableOption "Enable C support";
    components.dev.langage.css.enable = lib.mkEnableOption "Enable CSS support";
    components.dev.langage.haskell.enable = lib.mkEnableOption "Enable Haskell support";
    components.dev.langage.latex.enable = lib.mkEnableOption "Enable Latex support";
    components.dev.langage.lua.enable = lib.mkEnableOption "Enable Lua support";
    components.dev.langage.markdown.enable = lib.mkEnableOption "Enable Markdown support";
    components.dev.langage.ocaml.enable = lib.mkEnableOption "Enable Ocaml support";
    components.dev.langage.rust.enable = lib.mkEnableOption "Enable Rust support";
  };

  config = {
    # System-level components

    # Window manager
    components.windowManager.hyprland.enable = true;


    # User-level components

    # Just God
    components.git.enable = true;

    # Desktop App
    # File manager
    components.desktop.dolphin.enable = false;
    components.desktop.nautilus.enable = true;
    components.desktop.thunar.enable = false;

    # Document viewer
    components.desktop.evince.enable = true;
    components.desktop.gwenview.enable = true;

    # Browser
    components.desktop.zen.enable = true;

    # Other
    components.desktop.anki.enable = true;
    components.desktop._1password.enable = true;

    # Terminal components
    components.term.wezterm.enable = true;
    components.term.ghostty.enable = false;
    components.term.oh-my-posh.enable = true;
    components.term.zsh.enable = true;

    # Dev components

    # Commands
    components.dev.commands.tealdeer.enable = true;
    components.dev.commands.fastfetch.enable = false;
    components.dev.commands.neofetch.enable = true;
    components.dev.commands.zip.enable = true;
    components.dev.commands.hyperfine.enable = true;
    componenets.dev.commands.make.enable = true;

    # Langage support
    components.dev.langage.c.enable = true;
    components.dev.langage.css.enable = true;
    components.dev.langage.haskell.enable = true;
    components.dev.langage.latex.enable = true;
    components.dev.langage.lua.enable = true;
    components.dev.langage.markdown.enable = true;
    components.dev.langage.ocaml.enable = true;
    components.dev.langage.rust.enable = true;
  };
}
