{ system, nixpkgs, home-manager, inputs, hyprland, ... }:
let
  username = "nick";
  pkgs = import nixpkgs {
    inherit system;
    config.allowUnfree = true;
  };
    inherit inputs;
in{
    nick = home-manager.lib.homeManagerConfiguration {
    inherit pkgs;
     extraSpecialArgs = { inherit inputs; inherit username; inherit hyprland; }; 
    modules = [ ./users/sunshine/home.nix];
  };
}

