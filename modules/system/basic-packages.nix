{ config, pkgs, lib, ... }:
{
  import = []
    ++ lib.optional config.desktop._1password.enable ./1password.nix
  ;

  environment.systemPackages = with pkgs; [
    neovim
    home-manager
  ];
}
