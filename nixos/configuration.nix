{ config, pkgs, inputs, ... }:
{

  imports =
    [ 
      ./hardware-configuration.nix
      inputs.hyprland.nixosModules.default
    ];
   programs.hyprland =  {
     enable = true;
     xwayland.enable = true;
};
    hardware.uinput.enable =true;
    users.groups.uinput.members = ["sunshine"];
    users.groups.input.members = ["sunshine"];
    
    services.input-remapper.enable = true;
  boot.kernel.sysctl = { "vm.swappiness" = 10;};
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  virtualisation.docker.enable = true;
 # security.pam.services.login.enableKwallet = true;

  networking.hostName = "sunny"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  networking.networkmanager.enable = true;

  time.timeZone = "America/Recife";

  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pt_BR.UTF-8";
    LC_IDENTIFICATION = "pt_BR.UTF-8";
    LC_MEASUREMENT = "pt_BR.UTF-8";
    LC_MONETARY = "pt_BR.UTF-8";
    LC_NAME = "pt_BR.UTF-8";
    LC_NUMERIC = "pt_BR.UTF-8";
    LC_PAPER = "pt_BR.UTF-8";
    LC_TELEPHONE = "pt_BR.UTF-8";
    LC_TIME = "pt_BR.UTF-8";
  };
  programs.java = {enable = true;};

   services.xserver.enable = true;

  # services.xserver.displayManager.sddm.enable = true;
  # services.xserver.desktopManager.plasma5.enable = true;


  programs.dconf.enable = true;
   services.gnome = {
    gnome-keyring.enable = true;
  };
  security.pam.services.login.enableGnomeKeyring = true;
  
  xdg.portal = {
    enable = true;
    config = {
      common = {
        default = [ "xdph" "gtk" ];
        "org.freedesktop.impl.portal.Secret" = [ "gnome-keyring" ];
        "org.freedesktop.portal.FileChooser" = [ "xdg-desktop-portal-gtk" ];
      };
    };
    extraPortals = with pkgs; [ xdg-desktop-portal-gtk ];
  };
environment.sessionVariables = {
  WLR_NO_HARDWARE_CURSORS = "1";
  NIXOS_OZONE_WL = "1";
};

  services.xserver = {
    layout = "br";
   xkbVariant = "nodeadkeys";
  };
  console.keyMap = "br-abnt2";


  # Enable CUPS to print documents.
  services.printing.enable = true;
  programs.bash = {
     interactiveShellInit = "source ./.dotfiles/scripts/alias.sh";
     #loginShellInit = "source ~/scripts/alias.sh";
     #shellInit = "source ~/scripts/alias.sh";
    };

    

  sound.enable = false;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = false;
    alsa.enable = true;
    alsa.support32Bit = false;
    pulse.enable = true;
    #jack.enable = true;
    #media-session.enable = true;
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  users.users.sunshine = {
    isNormalUser = true;
    description = "happy sunshine";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  services.xserver.displayManager.autoLogin.enable = true;
  services.xserver.displayManager.autoLogin.user = "sunshine";
  
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
 # xdg.portal.enable = true;
 # xdg.portal.extraPortals = [pkgs.xdg-desktop-portal-gtk];

 fonts.packages = with pkgs; [
  (nerdfonts.override { fonts = [ "FiraCode" "DroidSansMono" "Hack" "JetBrainsMono" ]; })
];

fonts.fontconfig.defaultFonts= {
  monospace = ["FiraCode"];
};
  environment.systemPackages = with pkgs; [
   #WAYLAND AND HYPRLAND
   (pkgs.waybar.overrideAttrs (oldAttrs: {
    mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
  }))
   mako
   libnotify
   hyprpaper
   swaybg
   wpaperd
   mpvpaper
   swww
   rofi-wayland
   kitty

    #LSPS
    rnix-lsp
    nixd
    glibc
    clang-tools_16
    luajitPackages.lua-lsp

    #Utils
    git
    zsh
    wget
    curl
    wineWowPackages.full
    rust-analyzer-unwrapped
    clang-tools_16
     gparted
  ];
  

  # programs.sway.enable = true;
 # security.polkit.enable = true;
  security.sudo.configFile = "sunshine ALL=(ALL:ALL) ALL";
  hardware.opengl.enable = true;
 # hardware.nvidia.modesetting.enable = true;
  # environment.etc."vicksy.jpg".source = ./vicksy.jpg;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  networking.firewall.allowedTCPPorts = [ 80 3000 3001 ];
  networking.firewall.allowedUDPPorts = [ 80 3000 3001 ];
  networking.firewall.enable = true;
  system.stateVersion = "24.05"; 
  boot.supportedFilesystems = ["ntfs"];
}
