{
	description = "Laptop NixOS configuration";

	inputs = {
		nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

		agenix.url = "github:ryantm/agenix";

    silentSDDM = {
      url = "github:uiriansan/SilentSDDM";
      inputs.nixpkgs.follows = "nixpkgs";
    };

		home-manager = {
			url = "github:nix-community/home-manager";
			inputs.nixpkgs.follows = "nixpkgs";
		};
	};

	outputs = { self, nixpkgs, home-manager, agenix, silentSDDM, ... }@inputs: {
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

    nixosConfigurations.pc = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = { inherit inputs; };
      modules = [
        ./hosts/pc/configuration.nix

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

