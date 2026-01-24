{ pkgs, lib, ... }: {
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
