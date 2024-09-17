{
  description = "blender 3.6";
  inputs = {
      nixpkgs.url = https://github.com/NixOS/nixpkgs/archive/50a7139fbd1acd4a3d4cfa695e694c529dd26f3a.tar.gz;
  };
  outputs = { self, nixpkgs}: let 
    system = "x86_64-linux";
    pkgs = import nixpkgs {inherit system;};
    in{
        devShells."${system}".default = pkgs.mkShell{
           packages = with pkgs; [blender];        
           buildInputs = with pkgs;[
                    wayland
                   libGLU
                   libglvnd
                   egl-wayland
                   libGL
                   eglexternalplatform
          ];
        };
         # packages.x86_64-linux.default = pkgs.mkShell{
         #     packages = [pkgs.blender];
         # };

     };
}

