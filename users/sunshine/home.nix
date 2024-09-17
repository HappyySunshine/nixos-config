{config, pkgs, inputs, lib, ... }:
let 
    nixos_path = "/etc/nixos";
in
{
        
  # config.colorScheme = inputs.nix-colors.colorSchemes.dracula;
  home.username = "sunshine";
  home.homeDirectory = "/home/sunshine";
  home.stateVersion = "24.05";
   imports = [
   # inputs.nix-colors.homeManagerModules.default
         ./modules
        # ./../shared/home.nix

      #inputs.xremap-flake.homeManagerModules.default
  ];
  programs.git = {
    enable = true;
    userName = "Happy sunshine";
    userEmail = "maxthedog1200@gmail.com";
  };

  home.packages = with pkgs; [
   # inputs.xremap-flake.packages.${system}.default
    kitty
    grimblast
   spotify
   mako 
   waybar
   eww
   swayimg
   xorg.xrandr
   brightnessctl
    zoxide
    thunderbird
    radare2

    broot
    nnn

steam-run
    #gui
    firefox
    discord
   # obs-studio
    lutris
    godot_4
    qbittorrent
    floorp
    gimp
    blender
    krita
    android-studio 
    android-tools
    google-chrome
    brave
    # mysql
   # steam
   # q4wine
   # android-studio
  ];

  programs.zsh={
      enable = true;
      enableAutosuggestions = true;
      defaultKeymap = "vicmd";
      dirHashes= {
                 docs  = "$HOME/Documents";
                 vids  = "$HOME/Videos";
                 dl    = "$HOME/Downloads";
                 imgs = "$HOME/images";
               };
        dotDir = ".config/zsh";
        envExtra = ""; #.zshenv
        historySubstringSearch={
            enable = true;
        };
        initExtra= ''
         dev(){
                nix develop /etc/nixos/root/shells/$1
                echo "ready to code $1!"
            }
        \builtin alias cd=__zoxide_z
        \builtin alias zi=__zoxide_zi

         eval "$(zoxide init zsh)"
         clear
         neofetch
            ''; #.zshrc
        oh-my-zsh={
            enable = false;
        };
        shellAliases= {
            ".." = "cd ..";
            s = "sudo nixos-rebuild switch --flake /etc/nixos/";
            h = ''
                nix build ${nixos_path}/#homeConfigurations."sunshine".activationPackage -o ${nixos_path}/result
                ${nixos_path}/result/activate
                '';
        };
        profileExtra ='''';
        
  };

  

  programs.bash = {
    enable = true;
    enableCompletion = true;
    initExtra= ''
     dev(){
            nix develop /etc/nixos/root/shells/$1
            echo "ready to code $1!"
            }
        '';

    bashrcExtra = lib.mkDefault ''
      export PATH="$PATH:$HOME/bin:$HOME/.local/bin:$HOME/go/bin"
    '';
    # loginShellInit = "source ./scripts/alias.sh";

    # set some aliases, feel free to add more or remove some
    shellAliases = {
      s = "sudo nixos-rebuild switch --flake /etc/nixos/";
      k = "kubectl";
      urldecode = "python3 -c 'import sys, urllib.parse as ul; print(ul.unquote_plus(sys.stdin.read()))'";
      urlencode = "python3 -c 'import sys, urllib.parse as ul; print(ul.quote_plus(sys.stdin.read()))'";
    };
  };


 # programs.steam = {
  #	enable = true;
  #	remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
  #	dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
  #};
# a regex pattern

  # starship - an customizable prompt for any shell
}
