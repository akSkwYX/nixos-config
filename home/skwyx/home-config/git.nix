{ config, pkgs, ... }:
{
	programs.git = {
		enable = true;
		settings = {
			user = {
				email = "akskwyx@gmail.com";
				name = "akSkwYX";
			};
		};
	};
}
