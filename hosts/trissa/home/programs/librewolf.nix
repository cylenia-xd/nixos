{ config, pkgs, inputs, ... }: {
  programs.librewolf = {
    enable = true;
    languagePacks = [ "en-GB" ];
    profiles.default = {
      id = 0;
      isDefault = true;
      name = "default";
      extensions = {
        force = true;
        packages = with inputs.firefox-addons.packages.${pkgs.stdenv.hostPlatform.system}.firefox-addons; [
          ublock-origin
          bitwarden
        ];
      };
      settings = {
        "browser.search.region" = "AU";
        "browser.search.isUS" = false;
        "browser.sessionstore.resume_from_crash" = false;
        "browser.startup.homepage" = "https://online.bonjourr.fr";
        "distribution.searchplugins.defaultLocale" = "en-GB";
        "extensions.autoDisableScopes" = 0;
        "general.useragent.locale" = "en-GB";
        "middlemouse.paste" = false;
      };
      search = {
        force = true;
        default = "searxng";
        engines = {
          bing.metaData.hidden = true;
          google.metaData.hidden = true;

          searxng = {
            name = "SearXNG";
            urls = [{ template = "https://search.cylenia.dev/search?q={searchTerms}"; }];
            iconMapObj."16" = "https://search.cylenia.dev/favicon.ico";
            definedAliases = [ "@searxng" ];
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
