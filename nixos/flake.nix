{ description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
     hyprland.url = "github:hyprwm/hyprland";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
     nix-colors.url = "github:misterio77/nix-colors";
     xremap-flake.url =  "github:xremap/nix-flake";
     nix-index-database.url = "github:Mic92/nix-index-database";
     nix-index-database.follows = "nixpkgs";

  };

  outputs = inputs@{ nixpkgs, home-manager, hyprland, nix-index-database, ... }: let pkgs = nixpkgs; in {
    nixosConfigurations = {
	sunny = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; }; 
        modules = [
          ./configuration.nix
           home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.sunshine = import ./home.nix;
            home-manager.extraSpecialArgs = { inherit inputs; };
          }
         # nix-index-database.nixosModules.nix-index
        ];
      };
    };
  };
}
