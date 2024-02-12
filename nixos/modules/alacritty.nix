{ pkgs, config, ... }:

{
  programs.alacritty.enable = true;
  programs.alacritty.settings = {
      env.TERM = "xterm-256color";
      font = {
       # size = 12;
 #       normal.family = "JetBrainsMono";
  #      normal.style = "regular";
       # draw_bold_text_with_bright_colors = true;
      };
      scrolling.multiplier = 5;
      selection.save_to_clipboard = true;
      windw.opacity = 0.7;

      beel.animation = "Ease";
      beel.duration = 2000;
      beel.color = config.colorScheme.palette.base0D;

      keyboard.binding= [
      {
          key = "v";
          mods = "Control";
          action = "paste";
      }
      ];
    

    colors = with config.colorScheme.palette; {
      bright = {
        black = "0x${base00}";
        blue = "0x${base0D}";
        cyan = "0x${base0C}";
        green = "0x${base0B}";
        magenta = "0x${base0E}";
        red = "0x${base08}";
        white = "0x${base06}";
        yellow = "0x${base09}";
      };
      cursor = {
        cursor = "0x${base06}";
        text = "0x${base06}";
      };
      normal = {
        black = "0x${base00}";
        blue = "0x${base0D}";
        cyan = "0x${base0C}";
        green = "0x${base0B}";
        magenta = "0x${base0E}";
        red = "0x${base08}";
        white = "0x${base06}";
        yellow = "0x${base0A}";
      };
      primary = {
        background = "0x${base00}";
        foreground = "0x${base06}";
      };
    };
  };
}
