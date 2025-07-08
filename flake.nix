{
  description = "NixOs main flake";

  inputs = {
    # Nixpkgs, home manager and flake utils
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";

    # External flake
    zen-browser.url = "github:youwen5/zen-browser-flake";

    # Dotfiles
    nvim-dotfiles.url = "github:akSkwYX/neovim-dotfiles";
    # sway-dotfiles.url = "github:akSkwYX/sway-dotfiles";
    hypr-dotfiles.url = "github:akSkwYX/hypr-dotfiles";
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs: {
    nixosConfigurations = {
      medium = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";

        specialArgs = {
          inherit inputs;
        };

        modules = [
          ./modules/system/components.nix
          ./users/users_declaration.nix
          ./hosts/medium.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.extraSpecialArgs = { inherit inputs; };
          }
          ./users/users_activation.nix
        ];
      };
    };
  };
}
