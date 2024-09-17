{ pkgs, lib,  ... }: 
{
    programs.wezterm={
        enable = true;
        extraConfig=lib.readFile ./wezterm/config.lua;
        package = pkgs.wezterm;
    };
    

}
