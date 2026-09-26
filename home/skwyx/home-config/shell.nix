{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    blesh
    bash-completion
    ripgrep
    fd
    eza
    bat
  ];

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
      "nr" = "nixos-rebuild switch --sudo --flake=/home/skwyx/.nixos-config#laptop";
      "ls" = "eza --icons --git --group-directories-first";
      "ll" = "eza --icons --git -l --group-directories-first";
      "la" = "eza --icons --git -la --group-directories-first";
      "cat" = "bat --style=plain";
    };
  };

  programs.fzf = {
    enable = true;
    enableBashIntegration = true;
    defaultCommand = "fd --type f --strip-cwd-prefix --hidden --exclude .git";
    fileWidget.command = "fd --type f --strip-cwd-prefix --hidden --exclude .git";
    changeDirWidget.command = "fd --type d --strip-cwd-prefix --hidden --exclude .git";
  };

  programs.starship = {
    enable = true;
    enableBashIntegration = true;
    settings = {
      add_newline = false;
      format =
        "($nix_shell$container$fill$git_metrics\n)" +
        "$cmd_duration" +
        "$hostname" +
        "$localip" +
        "$shlvl" +
        "$shell" +
        "$env_var" +
        "$jobs" +
        "$sudo" +
        "$username" +
        "$character";
      right_format = 
        "$directory" +
        "$git_branch" +
        "$git_commit" +
        "$git_state" +
        "$git_status" +
        "$c" +
        "$haskell" +
        "$java" +
        "$lua" +
        "$ocaml" +
        "$python" +
        "$rust" +
        "$meson" +
        "$spack" +
        "$memory_usage" +
        "$custom" +
        "$status" +
        "$os" +
        "$battery" +
        "$time";
      fill = {
        symbol = " ";
      };
      character = {
        format = "$symbol ";
        success_symbol = "[◎](bold purple)";
        error_symbol = "[○](bold bright-purple)";
      };
      sudo = {
        format = "[$symbol]($style)";
        style = "bold italic bright-purple";
        symbol = "⋈┈";
        disabled = false;
      };
      username = {
        style_user = "purple bold italic";
        style_root = "bright-purple bold italic";
        format = "[⭘ $user]($style) ";
        disabled = false;
        show_always = false;
      };
      directory = {
        home_symbol = "⌂";
        truncation_length = 2;
        truncation_symbol = "□ ";
        read_only = " ◈";
        use_os_path_sep = true;
        style = "italic purple";
        format = "[$path]($style)[$read_only]($read_only_style)";
        repo_root_style = "bold purple";
        repo_root_format =
          "[$before_root_path]($before_repo_root_style)[$repo_root]($repo_root_style)";
      };
      cmd_duration = {
        format = "[◄ $duration ](italic white)";
      };
      jobs = {
        format = "[$symbol$number]($style) ";
        style = "white";
        symbol = "[▶](purple italic)";
      };
      localip = {
        ssh_only = true;
        format = " ◯[$localipv4](bold magenta)";
        disabled = false;
      };
      time = {
        disabled = false;
        format = "[ $time]($style)";
        time_format = "%R";
        utc_time_offset = "local";
        style = "italic dimmed white";
      };
      battery = {
        format = "[ $percentage $symbol]($style)";
        full_symbol = "█";
        charging_symbol = "[↑](italic bold green)";
        discharging_symbol = "↓";
        empty_symbol = "▃";
      };
      git_branch = {
        format = " [$branch(:$remote_branch)]($style)";
        symbol = "[△](bold italic bright-purple)";
        style = "italic bright-purple";
        truncation_symbol = "⋯";
        truncation_length = 11;
        ignore_branches = [ "main" "master" ];
        only_attached = true;
      };
      git_metrics = {
        format = "([▴$added]($added_style))([▿$deleted]($deleted_style))";
        added_style = "italic dimmed green";
        deleted_style = "italic dimmed red";
        ignore_submodules = true;
        disabled = false;
      };
      git_status = {
        style = "bold italic bright-purple";
        format =
        "([⎪$ahead_behind$staged$modified$untracked$renamed$deleted$conflicted$stashed⎥]($style))";
        conflicted = "[◪◦](italic bright-magenta)";
        ahead = "[▴│[$\{count\}](bold white)│](italic green)";
        behind = "[▿│[$\{count\}](bold white)│](italic red)";
        diverged = 
        "[◇ ▴┤[$\{ahead_count\}](regular white)│▿┤[$\{behind_count\}](regular white)│](italic bright-magenta)";
        untracked = "[◌◦](italic bright-yellow)";
        stashed = "[◃◈](italic white)";
        modified = "[●◦](italic yellow)";
        staged = "[▪┤[$count](bold white)│](italic bright-cyan)";
        renamed = "[◎◦](italic bright-blue)";
        deleted = "[✕](italic red)";
      };
      lua = {
        format = " [lua](italic) [$\{symbol\}$\{version\}]($style)";
        version_format = "$\{raw\}";
        symbol = "⨀ ";
        style = "bold bright-purple";
      };
      python = {
        format = " [py](italic) [$\{symbol\}$\{version\}]($style)";
        symbol = "[⌉](bold bright-blue)⌊ ";
        version_format = "$\{raw\}";
        style = "bold bright-purple";
      };
      rust = {
        format = " [rs](italic) [$symbol$version]($style)";
        symbol = "⊃ ";
        version_format = "$\{raw\}";
        style = "bold purple";
      };
      c = {
        symbol = "ℂ ";
        format = " [$symbol($version(-$name))]($style)";
      };
      haskell = {
        symbol = "λ ";
        format = " hs [$symbol($version )]($style)";
      };
      java = {
        symbol = "∪ ";
        format = " java [$symbol($version )]($style)";
      };
      memory_usage = {
        symbol = "▪▫▪ ";
        format = " mem [$\{ram\}( $\{swap\})]($style)";
      };
      nix_shell = {
        style = "bold italic dimmed blue";
        symbol = "✶";
        format = "[$symbol nix⎪$state⎪]($style) [$name](italic dimmed white)";
        impure_msg = "[⌽](bold dimmed red)";
        pure_msg = "[⌾](bold dimmed green)";
        unknown_msg = "[◌](bold dimmed yellow)";
      };
    };
  };
}
