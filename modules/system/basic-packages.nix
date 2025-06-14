{ config, pkgs, lib, inputs, ... }:
{
  imports = [
    ./1password.nix
    ./fonts.nix
  ];

  environment.systemPackages = with pkgs; [
    neovim
    home-manager
  ]
    ++ lib.optional config.components.desktop.zen.enable inputs.zen-browser.packages.${pkgs.system}.default
    ++ lib.optional config.components.windowManager.hyprland.enable inputs.hypr-flake.quickshellpkgs
  ;
}
