{pkgs, ...}:
{
    imports = [
         ./nvim/neovim.nix
        ./alacritty.nix
       ./wezterm.nix
         ./hyprland.nix
        #./xremap.nix
    ];
}