
{ 

    description = "Home manager config";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
     nix-colors.url = "github:misterio77/nix-colors";
    };


   outputs = inputs@{ self, nixpkgs, home-manager, ... }: 
    let
      system = "x86_64-linux";
    in
    {
      homeConfigurations = (
        import ./home-conf.nix {
          inherit system nixpkgs home-manager inputs ;
        }
      );
    };
  #   homeConfigurations = {
  #     "sunshine@nixos" = homeManager.lib.homeManagerConfiguration {
  #       configuration = {pkgs, ...}: {
  #         programs.home-manager.enable = true;
  #         home.packages = [ pkgs.hello ];
  #       };
  #
  #       system = "x86_64-linux";
  #       homeDirectory = "/home/sunshine";
  #       username = "sunshine";
  #       stateVersion = "24.11";
  #     };
  #   };
  # };

}
