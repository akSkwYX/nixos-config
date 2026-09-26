{ config, pkgs, lib, inputs, ... }:
{
	environment.systemPackages = [
		inputs.agenix.packages."x86_64-linux".default
	];

  age.secrets.rclone_client_id= {
    file = ../secrets/rclone_client_id.age;
    owner = "skwyx";
  };
  age.secrets.rclone_client_secret = {
    file = ../secrets/rclone_client_secret.age;
    owner = "skwyx";
  };
  age.secrets.rclone_token = {
    file = ../secrets/rclone_token.age;
    owner = "skwyx";
  };
}
