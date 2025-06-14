{ config, pkgs, lib, ... }:
{
  imports = [
    # Commands
    ./tealdeer.nix

    # Langage support
    ./langage/c.nix
    ./langage/css.nix
    ./langage/haskell.nix
    ./langage/latex.nix
    ./langage/lua.nix
    ./langage/markdown.nix
    ./langage/ocaml.nix
    ./langage/rust.nix
    ./langage/java.nix
    ./langage/python.nix
  ];

  home.packages = []
    # Commands
    ++ lib.optional config.components.dev.commands.fastfetch.enable pkgs.fastfetch
    ++ lib.optional config.components.dev.commands.neofetch.enable pkgs.neofetch
    ++ lib.optional config.components.dev.commands.zip.enable pkgs.zip
    ++ lib.optional config.components.dev.commands.zip.enable pkgs.unzip
    ++ lib.optional config.components.dev.commands.hyperfine.enable pkgs.hyperfine
    ++ lib.optional config.components.dev.commands.make.enable pkgs.gnumake
    ++ lib.optional config.components.dev.commands.tree.enable pkgs.tree
  ;
}
