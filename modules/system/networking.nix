{ config, pkgs, lib, ... }:
{
  networking.networkmanager.enable = true;

  networking.firewall = {
    enable = true;
    allowedTCPPortRanges = [{from = 1714; to = 1764;}]
      # ++ lib.optional config.components.desktop.kdeConnect.enable { from = 1714; to = 1764; }
    ;
    allowedUDPPortRanges = [{from = 1714; to = 1764;}]
      # ++ lib.optional config.components.desktop.kdeConnect.enable { from = 1714; to = 1764; }
    ;
  };

  hardware.bluetooth.enable = true;

  time.timeZone = "Europe/Paris";

  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADRESS = "fr_FR.UTF-8";
    LC_IDENTIFICATION = "fr_FR.UTF-8";
    LC_MEASUREMENT = "fr_FR.UTF-8";
    LC_MONETARY = "fr_FR.UTF-8";
    LC_NAME = "fr_FR.UTF-8";
    LC_NUMERIC = "fr_FR.UTF-8";
    LC_PAPER = "fr_FR.UTF-8";
    LC_TELEPHONE = "fr_FR.UTF-8";
    LC_TIME = "fr_FR.UTF-8";
  };

  services.xserver.xkb = {
    layout = "fr";
    variant = "";
  };
  console.useXkbConfig = true;
}
