{ config, pkgs, lib, ... }:
let
  grubTheme = pkgs.stdenv.mkDerivation {
    pname = "skwyx-grub-theme";
    name = "skwyx-grub-theme";
    src = pkgs.fetchFromGitHub {
      owner = "akSkwYX";
      repo = "grub-theme";
      rev = "52d1cd07b1de3382e393395c8c7c1f89e318a334";
      hash = "sha256-7dJ8rvukaPPviUbxgawAB7EICNzHkU4IW5kdrXkudpo=";
    };
    installPhase = "cp -r . $out";
  };
in
{
  boot.loader.grub = {
    enable = true;
    efiSupport = true;
    efiInstallAsRemovable = true;
    device = "nodev";
    theme = grubTheme;
  };

  boot.loader.efi.efiSysMountPoint = "/boot";
}
