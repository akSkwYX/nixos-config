{ config, pkgs, osConfig, ... }:
{
	programs.rclone = {
		enable = true;
		remotes."gdrive" = {
			config = {
				type = "drive";
				scope = "drive";
			};
			mounts."gdrive" = {
				enable = true;
				autoMount = true;
				mountPoint = "/home/skwyx/SharedMedia/GDrive";
			};
			secrets = {
				client_id = osConfig.age.secrets.rclone_client_id.path;
				client_secret = osConfig.age.secrets.rclone_client_secret.path;
        token = osConfig.age.secrets.rclone_token.path;
			};
		};
	};
}
