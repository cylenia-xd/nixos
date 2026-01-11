{ pkgs, ... }: {
  programs.helix = {
    enable = true;
    defaultEditor = true;
    extraPackages = [
      pkgs.marksman
      pkgs.nixd
      pkgs.kotlin-language-server
      pkgs.vscode-css-languageserver
      pkgs.vscode-html-languageserver
      pkgs.typescript-language-server
    ];
    settings.theme = "catppuccin_mocha";
    languages.language = [{
      name = "markdown";
      auto-format = true;
      soft-wrap = {
        enable = true;
        max-wrap = 25;
        wrap-indicator = "↪ ";
      };
      formatter = {
        command = "dprint";
        args = [ "fmt" "--stdin" "md" "--config" "~/.config/dprint/dprint.json"];
      };
    }];
  };
}
