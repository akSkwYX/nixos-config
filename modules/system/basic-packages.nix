{ config, pkgs, lib, inputs, ... }:
{
  imports = [
    ./networking.nix
    ./fonts.nix
    ./grub.nix
    ./1password.nix
  ];

  environment.systemPackages = with pkgs; [
    neovim
    home-manager
  ]
    ++ lib.optional config.components.windowManager.hyprland.enable inputs.hypr-dotfiles.quickshellpkgs
    # ++ lib.optional config.components.windowManager.sway.enable inputs.sway-dotfiles.packages.${pkgs.system}.system
  ;
}
