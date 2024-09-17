{ config, pkgs, inputs, ... }:
{
        
  home.username = "lfs";
  home.homeDirectory = "/home/lfs";
  colorScheme = inputs.nix-colors.colorSchemes.dracula;
   imports = [
    inputs.nix-colors.homeManagerModules.default
    ./modules
    ./../shared/home.nix
  ];

  programs.git = {
    enable = true;
    userName = "lfs";
    userEmail = "maxthedog1200@gmail.com";
  };
  home.packages = with pkgs; [
    firefox
    discord
    bison
  ];

  programs.bash = {
    enable = true;
    enableCompletion = true;
    bashrcExtra = ''
    export PATH="$PATH:$LFS/tools/bin"
    '';
    # TODO add your cusotm bashrc here
  };

  home.sessionVariables = {
        LFS = "/mnt/lfs";
        CONFIG_SITE="/mnt/lfs/usr/share/config.site";
        LFS_TGT = "x86_64-lfs-linux-gnu";
        LC_ALL = "POSIX";
  };
  
  home.stateVersion = "24.05";
  programs.home-manager.enable = true;
}
