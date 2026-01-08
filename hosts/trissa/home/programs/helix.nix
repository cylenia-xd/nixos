{ config, pkgs, ... }: {
  programs.helix = {
    enable = true;
    defaultEditor = true;
    extraPackages = [ pkgs.marksman ];
    settings = {
      theme = "catppuccin_mocha";
    };
  };
}
