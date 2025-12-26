{ config, pkgs, lib, ... }: {
  programs.nushell = {
    enable = true;
    environmentVariables = {
      EDITOR = "hx";
      MANPAGER = "less";
      PAGER = "less";
    };
  };
}
