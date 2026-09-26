{
	description = "Laptop NixOS configuration";

	inputs = {
		agenix.url = "github:ryantm/agenix";

		nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = { self, nixpkgs, home-manager, agenix, ... }@inputs: {
		nixosConfigurations.laptop = nixpkgs.lib.nixosSystem {
			system = "x86_64-linux";
			specialArgs = { inherit inputs; };
			modules = [
				./hosts/laptop/configuration.nix

				agenix.nixosModules.default

				home-manager.nixosModules.home-manager {
					home-manager.useGlobalPkgs = true;
					home-manager.extraSpecialArgs = { inherit inputs; };
					home-manager.users.skwyx = import ./home/skwyx/skwyx.nix;
				}
			];
		};
	};
}

