{...}:
{
     security.pam.services.login.enableKwallet = true;
      security.pam.services.login.enableGnomeKeyring = true;
     # services.getty.autologinUser = "sunshine";
     

      boot.kernel.sysctl = { "vm.swappiness" = 70;};
    # boot.loader.systemd-boot.enable = true;

     boot.loader = {
  efi = {
    canTouchEfiVariables = true;
    efiSysMountPoint = "/boot/efi"; # ← use the same mount point here.
    systemd-boot-enable = true;
  };
    }; 
  # grub = { 
     # enable = true;
     # efiSupport = true;
     #efiInstallAsRemovable = true; # in case canTouchEfiVariables doesn't work for your system
            #    device = "/dev/disk/by-id/ata-WDC_WD10JPVX-35JC3T0_WXC1A7792267";
              # device = "nodev";
  # };
# };
    #  boot.loader.systemd-boot.enable = true;
    # boot.loader.grub.useOSProber = true;
      boot.supportedFilesystems = ["ntfs" "exfat"];
}

