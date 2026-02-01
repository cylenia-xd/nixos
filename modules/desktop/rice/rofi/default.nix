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

  hm.programs.rofi = {
    enable = true;
    font = "Hack Nerd Font Mono 8";
    terminal = "${lib.getExe pkgs.kitty}";
    theme = ./theme.rasi;
  };
}
