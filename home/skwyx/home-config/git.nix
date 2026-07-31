{ config, pkgs, ... }:
{
	programs.git = {
		enable = true;
		includes = [
			{
				contents = {
					user = {
						email = "akskwyx@gmail.com";
						name = "akSkwYX";
					};
				};
			}
		];
	};
}
