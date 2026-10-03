{ config, pkgs, inputs, ... }:

{
	imports = [
    inputs.silentSDDM.nixosModules.default
		../home/skwyx/skwyx-config.nix
	];

  users.users."skwyx" = {
    isNormalUser = true;
    description = "SkwYX";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  systemd.tmpfiles.rules = let
    user = "skwyx";
    iconPath = "/home/skwyx/.config/pp/current";
  in [
    "f+ /var/lib/AccountsService/users/${user} 0600 root root -  [User]\\nIcon=/var/lib/AccountsService/icons/${user}\\n"
    "L+ /var/lib/AccountsService/icons/${user} -    -    -    -  ${iconPath}"
  ];
  programs.silentSDDM = {
    enable = true;
    theme = "default";
  };
}
