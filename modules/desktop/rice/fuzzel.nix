{ config, pkgs, lib, ... }: {
  hm.home.packages = with pkgs; [
    bemoji
    rofi-rbw
    wtype # bemoji requires
  ];
  
  hm.programs.rbw = {
    enable = true;
    settings = {
      base_url = "https://pass.cylenia.dev";
      identity_url = "https://pass.cylenia.dev/identity";
      ui_url = "https://pass.cylenia.dev";
      email = "me@cylenia.dev";
      lock_timeout = 3600;
      pinentry = pkgs.pinentry-gnome3;
    };
  };

  hm.programs.rofi = {
    enable = true;
    font = "Hack Nerd Font Mono 8";
    terminal = "${lib.getExe pkgs.kitty}";
    modes = [
      "drun"
      "emoji"
    ];
    theme = let inherit (config.home-manager.users.cylenia.config.lib.formats.rasi) mkLiteral; in {
      "*" = {
        "rosewater" = mkLiteral "#f5e0dc";
        "flamingo" = mkLiteral "#f2cdcd";
        "pink" = mkLiteral "#f5c2e7";
        "mauve" = mkLiteral "#cba6f7";
        "red" = mkLiteral "#f38ba8";
        "maroon" = mkLiteral "#eba0ac";
        "peach" = mkLiteral "#fab387";
        "yellow" = mkLiteral "#f9e2af";
        "green" = mkLiteral "#a6e3a1";
        "teal" = mkLiteral "#94e2d5";
        "sky" = mkLiteral "#89dceb";
        "sapphire" = mkLiteral "#74c7ec";
        "blue" = mkLiteral "#89b4fa";
        "lavender" = mkLiteral "#b4befe";
        "text" = mkLiteral "#cdd6f4";
        "subtext1" = mkLiteral "#bac2de";
        "subtext0" = mkLiteral "#a6adc8";
        "overlay2" = mkLiteral "#9399b2";
        "overlay1" = mkLiteral "#7f849c";
        "overlay0" = mkLiteral "#6c7086";
        "surface2" = mkLiteral "#585b70";
        "surface1" = mkLiteral "#45475a";
        "surface0" = mkLiteral "#313244";
        "base" = mkLiteral "#1e1e2e";
        "mantle" = mkLiteral "#181825";
        "crust" = mkLiteral "#11111b";
      };
    };
  };
  
  hm.programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        terminal = "${lib.getExe pkgs.kitty}";
        font = "Hack Nerd Font Mono:size=8";
        icons-enabled = false;
        width = 100;
        horizontal-pad = 8;
        vertical-pad = 8;
      };
      colors = {
        background = "1e1e2eff";
        text = "cdd6f4ff";
        prompt = "7f849cff";
        placeholder = "6c7086ff";
        input = "cdd6f4ff";
        match = "a6e3a1ff";
        selection = "1e1e2eff";
        selection-text = "cba6f7ff";
        selection-match = "a6e3a1ff";
        counter = "cba6f7ff";
        border = "cba6f7ff";
      };
      border = {
        width = 2;
        radius = 0;
      };
    };
  };
}
