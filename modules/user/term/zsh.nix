{ config, lib, pkgs, ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableVteIntegration = true;
    autocd = true;
    autosuggestion = {
      enable = true;
      strategy = ["completion" "history"  "match_prev_cmd"];
    };

    oh-my-zsh = {
      enable = true;
      theme = "af-magic";
    };
    syntaxHighlighting = {
      enable = true;
    };

    shellAliases = {
      nixosrebuild = "nixos-rebuild switch --use-remote-sudo --flake /home/skwyx/.nixos#default --update";
    };
  };
}
