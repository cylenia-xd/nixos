{ pkgs, ... }: {
  programs.helix = {
    enable = true;
    defaultEditor = true;
    extraPackages = with pkgs; [
      marksman                     # markdown
      nixd                         # nix 
      kotlin-language-server       # kotlin
    ];
    settings.theme = "catppuccin_mocha";
    languages.language = [
      {
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
      }
      {
        name = "qml";
        indent.tab-width = 2;
      }
    ];
  };
}
