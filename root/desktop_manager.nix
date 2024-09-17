{pkgs, inputs, ...}:

{
 
 #     services.xserver.displayManager.autoLogin.user = "sunshine";
      #services.xserver.displayManager.autoLogin.enable = true;
       security.pam.services.login.enableGnomeKeyring = true;
	services.xserver.enable =true;
#	services.xserver.displayManager.gdm.enable = true;
	services.xserver.desktopManager.gnome.enable = true;

	systemd.services."getty@tty1".enable = true;
	systemd.services."autovt@tty1".enable = true;
      programs.hyprland =  {
        enable = true;
    #    xwayland.enable = true;
        # package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    };

      # services.xserver.desktopManager.plasma5.enable = true;
        services.xserver.displayManager.sddm.enable = true;
}
