{ config, pkgs, inputs, ... }:

{
        
  # TODO please change the username & home direcotry to your own
  home.username = "sunshine";
  home.homeDirectory = "/home/sunshine";
   imports = [
    inputs.nix-colors.homeManagerModules.default
    ./modules
    ./nvim/neovim.nix

      inputs.xremap-flake.homeManagerModules.default
  ];


  colorScheme = inputs.nix-colors.colorSchemes.dracula;

  # link the configuration file in current directory to the specified location in home directory
  # home.file.".config/i3/wallpaper.jpg".source = ./wallpaper.jpg;

  # link all files in `./scripts` to `~/.config/i3/scripts`
  # home.file.".config/i3/scripts" = {
  #   source = ./scripts;
  #   recursive = true;   # link recursively
  #   executable = true;  # make all files executable
  # };
  # encode the file content in nix configuration file directly
  # home.file.".xxx".text = ''
  #     xxx
  # '';
  # set cursor size and dpi for 4k monitor
  xresources.properties = {
    "Xcursor.size" = 16;
    "Xft.dpi" = 172;
  };

  # basic configuration of git, please change to your own
  programs.git = {
    enable = true;
    userName = "Happy sunshine";
    userEmail = "maxthedog1200@gmail.com";
  };

   wayland.windowManager.sway = {
    enable = true;
    config = rec {
      modifier = "Mod4"; # Super key
      output = {
        "Virtual-1" = {
          mode = "1600x900@60Hz";
        };
      };
    };
    extraConfig = ''
    bindsym Print               exec shotman -c output
    bindsym Print+Shift         exec shotman -c region
    bindsym Print+Shift+Control exec shotman -c window

    output "*" bg /etc/vicksy.jpg fill
  '';
  };

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [
    #HYPRLAND
    dolphin
    wofi
    inputs.xremap-flake.packages.${system}.default
            #notify

  jdk17
  appimage-run
  openshot-qt

  wmctrl

    fishnet
	  stockfish
  	pavucontrol
  	firewalld
  	xclip
	imagemagick
  	vlc
  	android-tools
	wireshark
  	tcpdump
  	# lapce
  	xorg.xmodmap
	xorg.setxkbmap
	# xdotool
	input-remapper
#	xorg.xev
	dbus
      #sway 
   thunderbird

  keepassxc
# WAYLANDDDDDDDD
  mako
  wl-clipboard
  shotman
    # here is some command line tools I use frequently
    # feel free to add your own or remove some of them
    
    neofetch
  #  nnn # terminal file manager

    # archives
    zip
    xz
    unzip
    p7zip

    # utils
    ripgrep # recursively searches directories for 
    jq # A lightweight and flexible command-line JSON processor
    yq-go # yaml processer https://github.com/mikefarah/yq
 #   exa # A modern replacement for ‘ls’
    fzf # A command-line fuzzy finder

    # networking tools
    mtr # A network diagnostic tool
    iperf3
    dnsutils  # `dig` + `nslookup`
    ldns # replacement of `dig`, it provide the command `drill`
    aria2 # A lightweight multi-protocol & multi-source command-line download utility
    socat # replacement of openbsd-netcat
    nmap # A utility for network discovery and security auditing
    ipcalc  # it is a calculator for the IPv4/v6 addresses

    # misc
    cowsay
    file
    which
    tree
    gnused
    gnutar
    gawk
    zstd
    gnupg

    # nix related
    #
    # it provides the command `nom` works just like `nix`
    # with more details log output
    nix-output-monitor

    # productivity
    hugo # static site generator
    glow # markdown previewer in terminal

    btop  # replacement of htop/nmon
    iotop # io monitoring
    iftop # network monitoring

    # system call monitoring
    strace # system call monitoring
    ltrace # library call monitoring
    lsof # list open files

    # system tools
    sysstat
    lm_sensors # for `sensors` command
    ethtool
    pciutils # lspci
    usbutils # lsusb

    #gui
    firefox
    #kate
    discord
    obs-studio
    #bottles
    lutris
    godot_4
    #nomacs
    qbittorrent
    gimp
    #blender
   # krita
    steam
    #gnome-multi-writer
    q4wine
    android-studio
    #unityhub
    #	input-remapper
  ];

  


 # programs.steam = {
  #	enable = true;
  #	remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
  #	dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
  #};
# a regex pattern

  # starship - an customizable prompt for any shell
  programs.starship = {
    enable = true;
    # custom settings
    settings = {
      add_newline = false;
      aws.disabled = true;
      gcloud.disabled = true;
      line_break.disabled = true;
    };
  };


  programs.bash = {
    enable = true;
    enableCompletion = true;
    # TODO add your cusotm bashrc here
    bashrcExtra = ''
      export PATH="$PATH:$HOME/bin:$HOME/.local/bin:$HOME/go/bin"
    '';

    # set some aliases, feel free to add more or remove some
    shellAliases = {
      k = "kubectl";
      urldecode = "python3 -c 'import sys, urllib.parse as ul; print(ul.unquote_plus(sys.stdin.read()))'";
      urlencode = "python3 -c 'import sys, urllib.parse as ul; print(ul.quote_plus(sys.stdin.read()))'";
    };
  };

  # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "24.05";

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}
