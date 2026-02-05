{ pkgs, ... }: {
  hm.programs.kitty = {
    enable = true;
    themeFile = "Catppuccin-Mocha";
    font = {
      name = "Monocraft";
      package = pkgs.monocraft;
      size = 12;
    };
    settings = {
      single_window_margin_width = 2;
    };
  };
}
