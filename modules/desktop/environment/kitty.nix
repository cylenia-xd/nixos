{ pkgs, ... }: {
  hm.programs.kitty = {
    enable = true;
    themeFile = "Catppuccin-Mocha";
    font = {
      name = "Hack Nerd Font Mono";
      package = pkgs.nerd-fonts.hack;
      size = 8;
    };
    settings = {
      single_window_margin_width = 2;
    };
  };
}
