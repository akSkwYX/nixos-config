{ config, pkgs, lib, ... }:
{
  imports = []
    ++ lib.optional config.components.term.ghostty.enable ./ghostty.nix
    ++ lib.optional config.components.term.wezterm.enable ./wezterm.nix
    ++ lib.optional config.components.term.zsh.enable ./zsh.nix
    ++ lib.optional config.components.term.oh-my-posh.enable ./oh-my-posh.nix
  ;
}
