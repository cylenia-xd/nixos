{ config, pkgs, ... }: {
  programs.helix = {
    enable = true;
    defaultEditor = true;
    extraPackages = [ pkgs.marksman ];
    settings.theme = "catppuccin_mocha";
    languages.language = [{
      name = "markdown";
      auto-format = true;
      formatter = {
        command = "dprint";
        args = [ "fmt" "--stdin" "md" "--config" "~/.config/dprint/dprint.json"];
      };
    }];
  };
}
