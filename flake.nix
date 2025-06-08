{
  description = "NixOs + HomeManager configuration flake";

  inputs = {
    # Nixpkgs, home manager and flake utils
    nixpkgs.url = "github:NixOs/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    flake-utils.url = "github:numtide/flake-utils";

    # Dotfiles flake
    neovim-flake.url = "github:akSkwYX/neovim-dotfiles";
    hypr-flake.url = "github:akSkwYX/hypr-dotfiles";
  };

  outputs = { self, nixpkgs, home-manager, flake-utils, neovim-flake, hypr-flake, ... }:
    flake-utils.lib.eachDefaultSystem (system:
    let
      pkgs = import nixpkgs { inherit system; };
    in {
      nixosConfigurations.default = pkgs.lib.nixosSystem {
        inherit system;

        modules = [
          # Hardware detection
          ./hosts/hardware-configuration.nix

          # Components selection
          ./hosts/components.nix

          # Core system modules
          ./modules/system/basic-packages.nix
          ./modules/system/networking.nix
          
          # Per-host overrides
          ./hosts/default.nix
          
          # Integrate home-manager
          home-manager.nixosModules.home-manager

          # Configure the user home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.skwyx = import ./hosts/home.nix;
          }
        ];
      };
    }
  );
}
