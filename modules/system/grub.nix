{ config, pkgs, lib, ... }:
{
  fileSystems."/boot" = {
    device = "/dev/nvme0n1p1";
    fsType = "vfat";
  };

  fileSystems."/" = {
    device = "/dev/nvme0n1p2";
    fsType = "ext4";
  };

  swapDevices =  [
    { device = "/dev/nvme0n1p3"; }
  ];

  boot.loader.grub = {
    enable = true;
    version = 2;
    efiSupport = true;
    efiInstallAsRemovable = true;
    device = "nodev";
  };

  boot.loader.efi.efiSysMountPoint = "/boot";
}
