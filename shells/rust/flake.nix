{
  description = "A very basic flake";
  inputs = {
      nixpkgs.url = github:nixos/nixpkgs;
  };

  outputs = { self, nixpkgs }: let 
    system = "x86_64-linux";
    pkgs = import nixpkgs {inherit system;};
    in{
        devShells."${system}".default = pkgs.mkShell{
           packages = [pkgs.cargo pkgs.rustc 
            pkgs.rust-analyzer-unwrapped pkgs.pkg-config-unwrapped pkgs.libclang 
            pkgs.llvmPackages_rocm.clang-unwrapped pkgs.wayland ];        

           nativeBuildInputs =  [ pkgs.pkg-config pkgs.cargo];
           buildInputs = with pkgs;[
            #openssl_3_1
            openssl_legacy
            dbus
            libxkbcommon
            libGL
            pkgs.cargo
            alsa-lib
            # ocamlPackages.ssl
            # WINIT_UNIX_BACKEND=wayland
            wayland
            # WINIT_UNIX_BACKEND=x11
            xorg.libXcursor
            xorg.libXrandr
            xorg.libXi
            xorg.libX11
          ];
          #CARGO_HOME = "${pkgs.cargo}";
          RUST_SRC_PATH = "${pkgs.rust.packages.stable.rustPlatform.rustLibSrc}";

          #LD_LIBRARY_PATH = "${lib.makeLibraryPath buildInputs}";
        };
       
     };
}

