{ config, pkgs, lib, inputs, ... }:
{
  imports = [
    ../../modules/user/components.nix
  ];

  components.term.zsh.enable = true;

  users.users.skwyx =  lib.mkIf config.users.skwyx.enable {
    isNormalUser = true;
    description = "SkwYX";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = if config.components.term.zsh.enable then
      pkgs.zsh
    else
      pkgs.bash
    ;
    home = "/home/skwyx";
    ignoreShellProgramCheck = true;
  };

  home-manager.users.skwyx = lib.mkIf config.users.skwyx.enable {
    imports = [
      ../../modules/user/components.nix
      ./home.nix
    ];
  };
}
