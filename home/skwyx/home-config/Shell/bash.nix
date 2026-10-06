{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    blesh
    bash-completion

    eza
    bat
  ];

  programs.bash = {
    enable = true;
    enableCompletion = true;

    historyControl = [ "erasedups" "ignoredups" "ignorespace" ];
    historyIgnore = [ "ls" "cd" "exit" "clear"];

    initExtra = ''
      PROMPT_COMMAND="history -a; history -n; $PROMPT_COMMAND"

      if [[ $- == *i* ]]; then
        source ${pkgs.blesh}/share/blesh/ble.sh
      fi
    '';

    shellAliases = {
      "nrpc" = "nixos-rebuild switch --sudo --flake=/home/skwyx/.nixos-config#pc";
      "nrlap" = "nixos-rebuild switch --sudo --flake=/home/skwyx/.nixos-config#laptop";
      "ls" = "eza --icons --git --group-directories-first";
      "ll" = "eza --icons --git -l --group-directories-first";
      "la" = "eza --icons --git -la --group-directories-first";
      "cat" = "bat --style=plain";
    };
  };
}
