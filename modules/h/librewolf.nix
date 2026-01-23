{ pkgs, inputs, ... }: {
  programs.librewolf = {
    enable = true;
    languagePacks = [ "en-GB" ];
    profiles.default = {
      id = 0;
      isDefault = true;
      name = "default";
      extensions = {
        force = true;
        packages = with inputs.firefox-addons.packages.${pkgs.stdenv.hostPlatform.system}; [
          ublock-origin
          bitwarden
          catppuccin-mocha-mauve
        ];
      };
      settings = { # here be dragons.. browser settings configuration is weird
        "browser.display.background_color.dark" = "#1E1E2E";
        "browser.display.foreground_color.dark" = "#CDD6F4";
        "browser.download.lastDir" = "/home/cylenia/downloads";
        "browser.search.region" = "AU";
        "browser.search.isUS" = false;
        "browser.sessionstore.resume_from_crash" = false;
        "browser.startup.homepage" = "https://dash.cylenia.dev";
        "browser.tabs.inTitlebar" = 0; # hide window decorations
        "browser.uiCustomization.state" = ''{"placements":{"widget-overflow-fixed-list":[],"unified-extensions-area":["addon_darkreader_org-browser-action"],"nav-bar":["back-button","forward-button","stop-reload-button","vertical-spacer","urlbar-container","downloads-button","fxa-toolbar-menu-button","ublock0_raymondhill_net-browser-action","_446900e4-71c2-419f-a6a7-df9c091e268b_-browser-action","unified-extensions-button"],"toolbar-menubar":["menubar-items"],"TabsToolbar":["tabbrowser-tabs","new-tab-button"],"vertical-tabs":[],"PersonalToolbar":[]},"seen":["ublock0_raymondhill_net-browser-action","_446900e4-71c2-419f-a6a7-df9c091e268b_-browser-action","developer-button","screenshot-button","addon_darkreader_org-browser-action"],"dirtyAreaCache":["unified-extensions-area","nav-bar","vertical-tabs","toolbar-menubar","TabsToolbar","PersonalToolbar"],"currentVersion":23,"newElementCount":4}'';
        # maybe don't edit this manually ^
        "distribution.searchplugins.defaultLocale" = "en-GB";
        "extensions.activeThemeID" = "{76aabc99-c1a8-4c1e-832b-d4f2941d5a7a}"; # catpuccin-mocha-mauve
        "extensions.autoDisableScopes" = 0; # make sure all extensions are enabled
        "general.useragent.locale" = "en-GB";
        "layout.css.prefers-color-scheme.content-override" = 0;
        "middlemouse.paste" = false;
        "places.history.enabled" = false; # dont save history
        "privacy.resistFingerprinting" = false;
      };
      search = {
        force = true;
        default = "duckduckgo";
        engines = {
          bing.metaData.hidden = true;
          perplexity.metaData.hidden = true;
          ebay.metaData.hidden = true;

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
