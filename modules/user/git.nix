{ config, pkgs, lib, ... }:
{
  programs.git = {
    enable = true;
    userName = "akSkwYX";
    userEmail = "akskwyx@gmail.com";
    signing = {
      key = null;
      format = "ssh";
    };
    extraConfig = {
      gpg = {
        format = "ssh";
      };
      "gpg \"ssh\"" = {
        program = "${lib.getExe' pkgs._1password-gui "op-ssh-sign"}";
      };
    };
    ignores = [
      "_build"
      "test"
    ];
  };

  programs.ssh = {
    enable = true;
    extraConfig = ''
      Host *
          IdentityAgent "~/.1password/agent.sock"
    '';
  };

  home.sessionVariables.SSH_AUTH_SOCK = "${config.home.homeDirectory}/.1password/agent.sock";
}
