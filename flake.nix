{ description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
           # hyprland.url = "github:hyprwm/hyprland/86be75dd97b5633b8c0aa6bdcb3346fa871a8480";
           hyprland.url = "github:hyprwm/hyprland/";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
     nix-colors.url = "github:misterio77/nix-colors";
     #xremap-flake.url =  "/etc/nixos/my-stuff/xremap-flake";
     xremap-flake.url =  "github:xremap/nix-flake";
   #  nix-index-database.url = "github:Mic92/nix-index-database";
   #  nix-index-database.follows = "nixpkgs";
    #  nixgl.url = "github:guibou/nixGL";

            # hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";

  };

  outputs = inputs@{ nixpkgs, home-manager, hyprland, ... }:
  let 
    # pkgs = nixpkgs;
    system = "x86_64-linux";
  #import nixpkgs {
      #system = "x86_64-linux";
     # overlays = [ nixgl.overlay ];
    #};
    in {

      homeConfigurations = (
        import ./home-conf.nix {
          inherit system nixpkgs home-manager inputs ;
        }
      );
    nixosConfigurations = {
	nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; }; 
        modules = [
          ./root/configuration.nix
        ];
      };
    };
  };
}
