{ config, lib, pkgs, ... }:
{
  programs.zsh = {
    enable = config.components.term.zsh.enable;
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
      nixosrebuild = "nix flake update --flake ~/\.nixos/nixos-config && \ 
        sudo nixos-rebuild switch --flake ~/\.nixos/nixos-config#default";
      hyprconfig = "cd ~/.nixos/dotfiles/hypr && nvim";
      nvimconfig = "cd ~/.nixos/dotfiles/neovim && nvim";
      systemconfig = "cd ~/.nixos/nixos-config && nvim";
      quicktest = "qs -p ~/.test/quickshell";
    };

    initContent = ''
      config_test() {
        if [ $# -eq 0 ]; then
          echo "Usage: hyprtest <command> [args…]" >&2
          return 1
        fi
        XDG_CONFIG_HOME="$HOME/.test" "$@"
      }
    '';
  };
}
