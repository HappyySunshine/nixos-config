# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
    
      ./hardware-configuration.nix
      inputs.hyprland.nixosModules.default
    ];
   programs.hyprland =  {
     enable = true;
  #nvidiaPatches = true;
   xwayland.enable = true;
};
    hardware.uinput.enable =true;
    users.groups.uinput.members = ["sunshine"];
    users.groups.input.members = ["sunshine"];
    
    services.input-remapper.enable = true;
  boot.kernel.sysctl = { "vm.swappiness" = 10;};
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  virtualisation.docker.enable = true;
 # security.pam.services.login.enableKwallet = true;

  networking.hostName = "sunny"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Recife";

  # Select internationalisation properties.
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

  # Enable the X11 windowing system.
   services.xserver.enable = true;

  # Enable the KDE Plasma Desktop Environment.
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
 # If your cursor becomes invisible
  WLR_NO_HARDWARE_CURSORS = "1";
 # Hint electron apps to use wayland
  NIXOS_OZONE_WL = "1";
};

#hardware.opengl.enabe = true;



  # Configure keymap in X11
  services.xserver = {
    layout = "br";
   xkbVariant = "nodeadkeys";
  };

  # Configure console keymap

  console.keyMap = "br-abnt2";
  # Enable CUPS to print documents.
  services.printing.enable = true;
  programs.bash = {
     interactiveShellInit = "source ./.dotfiles/scripts/alias.sh";
     #loginShellInit = "source ~/scripts/alias.sh";
     #shellInit = "source ~/scripts/alias.sh";
    };

    

  # Enable sound with pipewire.
  sound.enable = false;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = false;
    alsa.enable = true;
    alsa.support32Bit = false;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.sunshine = {
    isNormalUser = true;
    description = "happy sunshine";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  # Enable automatic login for the user.
  services.xserver.displayManager.autoLogin.enable = true;
  services.xserver.displayManager.autoLogin.user = "sunshine";

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget

 # xdg.portal.enable = true;
 # xdg.portal.extraPortals = [pkgs.xdg-desktop-portal-gtk];
  
  environment.systemPackages = with pkgs; [
   #WAYLAND AND HYPRLAND
   (pkgs.waybar.overrideAttrs (oldAttrs: {
    mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];
  })
)
   mako
   libnotify
   hyprpaper
   swaybg
   wpaperd
   mpvpaper
   swww
   rofi-wayland
   kitty

  rnix-lsp
  nixd
 # soundwireserver
 # yazi
  
  glibc
  #mlocate
  radare2
  #iaito
 # samsung-unified-linux-driver
     luajitPackages.lua-lsp
    # llvmPackages_rocm.clang-unwrapped
     git
     zsh
     wget
     curl
    # samba4Full
     wineWowPackages.full
     #nodePackages.typescript
     rust-analyzer-unwrapped
#     rnix-lsp
  #   llvmPackages_16.clang-unwrapped
  # libclang
  clang-tools_16
     #gccgo13
     #cmake 
     #gnumake
    # bear
     gparted
     #nodePackages_latest.typescript-language-server
  #   (python39.withPackages(ps: with ps; [pip evdev]))
  #  vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  #  wget
  ];
#  inputs.nixneovimplugins.url = github:jooooscha/nixpkgs-vim-extra-plugins
#  nixpkgs.overlays = [
#	inputs.nixneovimplugins.overlays.default
#];
  
  #programs.yazi.enable = true;
 # programs.steam = {
 # enable = true;
 # remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
 # dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
#};

 #services.yazi = { enable = true;};

  # programs.sway.enable = true;
 # security.polkit.enable = true;
  security.sudo.configFile = "sunshine ALL=(ALL:ALL) ALL";
  hardware.opengl.enable = true;
 # hardware.nvidia.modesetting.enable = true;
  # environment.etc."vicksy.jpg".source = ./vicksy.jpg;

  # services.input-remapper.enable = true;


  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  networking.firewall.allowedTCPPorts = [ 80 3000 3001 ];
  networking.firewall.allowedUDPPorts = [ 80 3000 3001 ];
  # Or disable the firewall altogether.
  networking.firewall.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
      system.stateVersion = "23.11"; # Did you read the comment?
  boot.supportedFilesystems = ["ntfs"];
}
