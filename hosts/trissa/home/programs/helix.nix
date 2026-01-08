{ config, pkgs, ... }: {
  programs.helix = {
    enable = true;
    defaultEditor = true;
    extraPackages = [ pkgs.marksman ];
    settings.theme = "catppuccin_mocha";
    languages.language = [{
      name = "markdown";
      formatter = { command = "dprint"; args = ["fmt" "--stdin" "md"]; };
    }];
  };
}
