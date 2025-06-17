{
  description = "NixOs + HomeManager configuration flake";

  inputs = {
    # Nixpkgs, home manager and flake utils
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    flake-utils.url = "github:numtide/flake-utils";

    # Dotfiles flake
    neovim-flake.url = "github:akSkwYX/neovim-dotfiles";
    hypr-flake.url = "github:akSkwYX/hypr-dotfiles";

    # External flake
    zen-browser.url = "github:youwen5/zen-browser-flake";
  };

  outputs = { self, nixpkgs, home-manager, flake-utils, neovim-flake, hypr-flake, zen-browser, ... }@inputs: {
    nixosConfigurations.default = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";

      specialArgs = {
        inherit inputs;
      };

      modules = [
        # Hardware detection
        ./hosts/hardware-configuration.nix

        # Components
        ./hosts/components.nix

        # Core system modules
        ./modules/system/basic-packages.nix
        ./modules/system/networking.nix
        ./modules/system/wm.nix
        hypr-flake.systemModules.default
        
        # Per-host overrides
        ./hosts/default.nix
        
        # Integrate home-manager
        home-manager.nixosModules.home-manager

        # Configure the user home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.extraSpecialArgs = { inherit inputs; };
          home-manager.users.skwyx = {
            imports = [
              ./hosts/components.nix
              ./hosts/home.nix
              neovim-flake.homeModules.default
              hypr-flake.homeModules.default
            ];
          };
        }
      ];
    };
  };
}
