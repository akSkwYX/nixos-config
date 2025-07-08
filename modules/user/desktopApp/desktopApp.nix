{ config, pkgs, lib, inputs, ... }:
{
  home.packages = []
    # Browser
    ++ lib.optional config.components.desktop.zen.enable inputs.zen-browser.packages.${pkgs.system}.default
    # File manager
    ++ lib.optional config.components.desktop.dolphin.enable pkgs.kdePackages.dolphin
    ++ lib.optional config.components.desktop.nautilus.enable pkgs.nautilus
    ++ lib.optional config.components.desktop.thunar.enable pkgs.xfce.thunar

    # Document viewer
    ++ lib.optional config.components.desktop.evince.enable pkgs.evince
    ++ lib.optional config.components.desktop.gwenview.enable pkgs.libsForQt5.gwenview

    # Other
    ++ lib.optional config.components.desktop.anki.enable pkgs.anki
    ++ lib.optional config.components.desktop.kdeConnect.enable pkgs.libsForQt5.kdeconnect-kde
  ;
}
