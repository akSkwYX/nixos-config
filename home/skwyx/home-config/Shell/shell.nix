{ config, pkgs, ... }:
{
  imports = [
    ./bash.nix
    ./fzf.nix
    ./readline.nix
    ./starship.nix
  ];
}
