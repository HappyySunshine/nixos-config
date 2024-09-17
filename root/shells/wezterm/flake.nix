{
  description = "Flake used for linux from scratch  12.1-rc";
  inputs = {
      # nixpkgs.url = github:nixos/nixpkgs;
      nixpkgs = {
          # url = "https://github.com/NixOS/nixpkgs/archive/a5c9c6373aa35597cd5a17bc5c013ed0ca462cf0.tar.gz";
          url = "github:nixos/nixpkgs/05bbf675397d5366259409139039af8077d695ce";
           flake = false;
      };

     # bison = pkgs.bison2;

  };

  outputs = { self, nixpkgs, ... }@inputs: let 
    system = "x86_64-linux";
    pkgs = import nixpkgs {inherit system;};
    wezterm =pkgs.wezterm;
    in{
        devShells."${system}".default = pkgs.mkShell{
            hardeningDisable = [  ];
           packages = [
                wezterm

           ];        
           nativeBuildInputs =  [  ];
           buildInputs = with pkgs;[

            
            ];

        };
       
     };
}

