{ config, pkgs, lib, inputs, ... }:

{
  imports = [
    ../modules/user/desktopApp/desktopApp.nix
    ../modules/user/dev/dev.nix
    ../modules/user/term/term.nix
    ../modules/user/git.nix
  ]
    ++ lib.optional config.neovim.enable inputs.neovim-flake.homeModules.default
    ++ lib.optional config.hypr.enable inputs.hypr-flake.homeModules.default
  ;
}
