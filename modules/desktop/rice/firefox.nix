{ pkgs, inputs, ... }: {
  hm.textfox = {
    enable = true;
    profiles = [ "default" ];
    config = {
      background = {
        color = "#1e1e2e";
      };
      border = {
        color = "#cba6f7";
        width = "2px";
        transition = "1.0s ease";
        radius = "0px";
      };
      displayWindowControls = false;
      displayNavButtons = true;
      displayUrlbarIcons = true;
      displaySidebarTools = false;
      displayTitles = false;
      font = {
        family = "Hack Nerd Font Mono";
        size = "12px";
        accent = "#cdd6f4";
      };
      tabs = {
        horizontal.enable = true;
        vertical.enable = true;
        vertical.margin = "1.0rem";
      };
      navbar = {
        margin = "8px 8px 2px";
        padding = "4px";
      };
      bookmarks = {
        alignment = "left";
      };
      icons = {
        toolbar.extensions.enable = true;
        context.extensions.enable = true;
        context.firefox.enable = true;
      };
      textTransform = "uppercase";
    };
  };
  
  hm.programs.firefox = {
    enable = true;
    languagePacks = [ "en-GB" ];
    extensions = {
      force = true;
      packages = with inputs.firefox-addons.packages.${pkgs.stdenv.hostPlatform.system}; [
        ublock-origin
      ];
    };
    arkenfox = {
      enable = true;
      version = "140.0";
    };
    policies = {
      Cookies = {
        Allow = [
          "https://github.com"
          "https://discord.com"
        ];
      };
    };
    profiles.default = {
      id = 0;
      isDefault = true;
      name = "default";
      arkenfox = {
        enable = true;
        enableAllSections = true;
        "0700"."0712"."network.trr.uri".value = "https://dns.quad9.net/dns-query";
        "0700"."0712"."network.trr.custom_uri".value = "https://dns.quad9.net/dns-query";
        "0800"."0830"."browser.search.separatePrivateDefault".value = false;
        "0800"."0830"."browser.search.separatePrivateDefault.ui.enabled".value = false;
      };
      search = {
        force = true;
        default = "ddg-no-ai";
        engines = {
          bing.metaData.hidden = true;
          perplexity.metaData.hidden = true;
          eBay.metaData.hidden = true;
          google.metaData.hidden = true;
          ddg.metaData.hidden = true;
          wikipedia.metadata.hidden = true;

          ddg-no-ai = {
            name = "DuckDuckGo No AI";
            urls = [{ template = "https://noai.duckduckgo.com/search?q={searchTerms}"; }];
            iconMapObj."16" = "https://duckduckgo.com/favicon.ico";
            definedAliases = [ "@ddg" ];
          };

          my-nixos = {
            name = "MyNixOS";
            urls = [{ template = "https://mynixos.com/search?q={searchTerms}"; }];
            iconMapObj."16" = "https://mynixos.com/favicon.ico";
            definedAliases = [ "@mno" ];
          };

          nixos-wiki = {
            name = "NixOS Wiki";
            urls = [{ template = "https://wiki.nixos.org/w/index.php?search={searchTerms}"; }];
            iconMapObj."16" = "https://nixos.org/favicon.ico";
            definedAliases = [ "@nw" ];
          };
        };
      };
    };
  };
}
