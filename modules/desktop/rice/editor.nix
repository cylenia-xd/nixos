{ pkgs, ... }: {
  hm.programs.helix = {
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
        indent = {
          tab-width = 2;
          unit = "  ";
        };
      }
    ];
  };

  hm.home.packages = [
    pkgs.dprint
  ];
  
  hm.home.file.dprint_config = {
    executable = true;
    force = true;
    target = ".config/dprint/dprint.json";
    text = builtins.toJSON {
      markdown = {
        emphasisKind = "asterisks";
        strongKind = "asterisks";
      };

      excludes = [
        "**/*-lock.json"
      ];

      plugins = [
        "https://plugins.dprint.dev/json-0.21.1.wasm"
        "https://plugins.dprint.dev/markdown-0.20.0.wasm"
        "https://plugins.dprint.dev/toml-0.7.0.wasm"
        "https://plugins.dprint.dev/g-plane/markup_fmt-v0.25.3.wasm"
        "https://plugins.dprint.dev/g-plane/pretty_yaml-v0.5.1.wasm"
      ];
    };
  };
}
