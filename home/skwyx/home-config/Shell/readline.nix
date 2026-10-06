{ config, pkgs, ... }:
{
  programs.readline = {
    enable = true;
    extraConfig = ''
      set completion-ignore-case on
      set show-all-if-ambiguous on
      set menu-complete-display-prefix on
      set colored-stats on

      "\e[A": history-search-backward
      "\e[B": history-search-forward
    '';
  };
}
