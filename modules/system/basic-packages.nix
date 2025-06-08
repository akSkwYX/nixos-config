{ config, pkgs, lib, inputs, system, ... }:
{
  import = []
    ++ lib.optional config.desktop._1password.enable ./1password.nix
  ;

  environment.systemPackages = with pkgs; [
    neovim
    home-manager
  ]
    ++ lib.optional config.desktop.zen.enable inputs.zen-browser.packages."${system}".default
  ;
}
