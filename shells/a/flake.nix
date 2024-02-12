{
  description = "A very basic flake";
  inputs = {
      nixpkgs.url = github:nixos/nixpkgs;
  };

  outputs = { self, nixpkgs }: let 
    system = "x86_64-linux";
    pkgs = import nixpkgs {inherit system;};
    in{
        packages.${system}.default = pkgs.callPackage ./. {};
        pakcages.${system}.bash = derivation{
            name = "simple";
            builder = "${inputs.nixpkgs.legacyPackages."x86_64-linux".bash}/bin/bash";
            args = [ "-c" "echo foo > $out" ];
            src = ./src;
           inherit system;
        };
        # packages.${system} = {
        #    myPackage = pkgs.callPackage ./. {};
        #    default = self.${system}.myPackage;
        # };

  };
}
