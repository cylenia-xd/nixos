{ config, pkgs, lib, ... }: {
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        terminal = "${lib.getExe pkgs.kitty}";
        font = "Hack Nerd Font Mono:size=8";
        layer = "overlay";
      };
      colors.background = "1e1e2eff";
    };
  };
}
