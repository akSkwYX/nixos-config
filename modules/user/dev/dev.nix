{ config, pkgs, lib, ... }:
{
  imports = [
    # Commands
    ./commands/tealdeer.nix

    # Language support
    ./language/c.nix
    ./language/css.nix
    ./language/haskell.nix
    ./language/latex.nix
    ./language/lua.nix
    ./language/markdown.nix
    ./language/ocaml.nix
    ./language/rust.nix
    ./language/java.nix
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
    ++ lib.optional config.components.dev.commands.xprop.enable pkgs.xorg.xprop
  ;
}
