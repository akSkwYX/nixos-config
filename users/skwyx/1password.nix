{ config, pkgs, lib, ... }:
{
  programs._1password = {
    enable = config.components.desktop._1password.enable;
  };

  programs._1password-gui = {
    enable = config.components.desktop._1password.enable;
    polkitPolicyOwners = [ "skwyx" ];
  };
}
