{ config, pkgs, lib, ... }:
{
  imports = []
    # Commands
    ++ lib.optional config.components.dev.commands.tealdeer.enable ./tealdeer.nix

    # Langage support
    ++ lib.optional config.components.dev.langage.c.enable ./c.nix
    ++ lib.optional config.components.dev.langage.css.enable ./css.nix
    ++ lib.optional config.components.dev.langage.haskell.enable ./haskell.nix
    ++ lib.optional config.components.dev.langage.latex.enable ./latex.nix
    ++ lib.optional config.components.dev.langage.lua.enable ./lua.nix
    ++ lib.optional config.components.dev.langage.markdown.enable ./markdown.nix
    ++ lib.optional config.components.dev.langage.ocaml.enable ./ocaml.nix
    ++ lib.optional config.components.dev.langage.rust.enable ./rust.nix
  ;

  home.packages = []
    # Commands
    ++ lib.optional config.components.dev.commands.fastfetch.enable pkgs.fastfetch
    ++ lib.optional config.components.dev.commands.neofetch.enable pkgs.neofetch
    ++ lib.optional config.components.dev.commands.zip.enable pkgs.zip
    ++ lib.optional config.components.dev.commands.zip.enable pkgs.unzip
    ++ lib.optional config.components.dev.commands.hyperfine.enable pkgs.hyperfine
    ++ lib.optional config.components.dev.commands.make.enable pkgs.gnumake
  ;
}
