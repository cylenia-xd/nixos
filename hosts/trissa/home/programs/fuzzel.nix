{ config, pkgs, lib, ... }: {
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        terminal = "${lib.getExe pkgs.kitty}";
        layer = "overlay";
      };
      colors.background = "ff1e1e2e";
    };
  };
}
