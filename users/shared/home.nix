{ config, pkgs, inputs, lib, ... }:
{
        
   imports = [
    inputs.nix-colors.homeManagerModules.default
    ./modules

  ];

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
 # xresources.properties = {
 #   "Xcursor.size" = 16;
 #   "Xft.dpi" = 172;
 # };

   wayland.windowManager.sway = {
    enable = false;
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
   # dolphin
   # wofi
   # wmctrl
   # mako
    wl-clipboard
   # shotman


    zoxide
    floorp
    jdk17
    appimage-run
    openshot-qt
 #   fishnet
#	stockfish
#  	pavucontrol
  	firewalld
  	xclip
	imagemagick
  	vlc
  #	android-tools
#	wireshark
  	tcpdump
  	xorg.xmodmap
	xorg.setxkbmap
#	input-remapper
	xorg.xev
	dbus
   thunderbird

    radare2
 #  keepassxc
    neofetch
    yazi
  #  nnn # terminal file manager
    # archives
    zip
    xz
    unzip
    p7zip

    # utils
    ripgrep 
    jq # A lightweight and flexible command-line JSON processor
    yq-go # yaml processer https://github.com/mikefarah/yq
    eza # A modern replacement for ‘ls’
    fzf # A command-line fuzzy finder

    # networking tools
    mtr # A network diagnostic tool
 #   iperf3
  #  dnsutils  # `dig` + `nslookup`
  #  ldns # replacement of `dig`, it provide the command `drill`
    aria2 # A lightweight multi-protocol & multi-source command-line download utility
    socat # replacement of openbsd-netcat
    nmap # A utility for network discovery and security auditing
   # ipcalc  # it is a calculator for the IPv4/v6 addresses

    # misc
    cowsay
    file
    which
    tree
 #   gnused
#    gnutar
  #  gawk
  #  zstd
  #  gnupg

    # it provides the command `nom` works just like `nix`
    # with more details log output
    nix-output-monitor

    # hugo # static site generator
    # glow # markdown previewer in terminal

    btop  
  #  iotop # io monitoring
   iftop # network monitoring

    # system call monitoring
    strace # system call monitoring
    ltrace # library call monitoring
    lsof # list open files

    # system tools
    # sysstat
    lm_sensors # for `sensors` command
   # ethtool
   # pciutils # lspci
   # usbutils # lsusb
  ];

  


# a regex pattern

  # starship - an customizable prompt for any shell
  programs.starship = {
    enable = false;
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
    profileExtra= ''
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
  home.stateVersion = "24.11";
  programs.home-manager.enable = true;
}
