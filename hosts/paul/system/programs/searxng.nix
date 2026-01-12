{ config, lib, pkgs, ... }: {
  services.searx = {
    enable = true;
    redisCreateLocally = true;
    settings = {
      server = {
        base_url = "https://search.cylenia.dev";
        bind_address = "127.0.0.1";
        port = 8067;
        secret_key = config.sops.secrets.searxng_secret.path;
      };
      general = {
        debug = false;
        instance_name = "Cute SearXNG";
        donation_url = false;
        contact_url = false;
        privacypolicy_url = false;
        enable_metrics = false;
      };
      ui = {
        static_use_hash = true;
        default_locale = "en";
        query_in_title = true;
        infinite_scroll = false;
        center_alignment = true;
        default_theme = "simple";
        theme_args.simple_style = "auto";
        search_on_category_select = false;
      };
      # stolen from wiki, idk what the lib stuff means
      engines = lib.mapAttrsToList (name: value: { inherit name; } // value) {

        # --- enabled engines (top priority) ---
        "brave" = {
          disabled = false;
          weight = 3;
        };
        
        "duckduckgo" = {
          disabled = false;
          weight = 2;
        };

        "qwant" = {
          disabled = false;
          weight = 1;
        };

        # --- everything else disabled ---
        "startpage".disabled = true;
        "bing".disabled = true;
        "google".disabled = true;
        "mojeek".disabled = true;
        "mwmbl".disabled = true;
        "crowdview".disabled = true;
        "curlie".disabled = true;
        "ddg definitions".disabled = true;

        "wikibooks".disabled = true;
        "wikidata".disabled = true;
        "wikiquote".disabled = true;
        "wikisource".disabled = true;
        "wikispecies".disabled = true;
        "wikiversity".disabled = true;
        "wikivoyage".disabled = true;
        "wikipedia".disabled = true;

        "currency".disabled = true;
        "dictzone".disabled = true;
        "lingva".disabled = true;

        "bing images".disabled = true;
        "brave.images".disabled = true;
        "duckduckgo images".disabled = true;
        "google images".disabled = true;
        "qwant images".disabled = true;

        "1x".disabled = true;
        "artic".disabled = true;
        "deviantart".disabled = true;
        "flickr".disabled = true;
        "imgur".disabled = true;
        "library of congress".disabled = true;
        "material icons".disabled = true;
        "openverse".disabled = true;
        "pinterest".disabled = true;
        "svgrepo".disabled = true;
        "unsplash".disabled = true;
        "wallhaven".disabled = true;
        "wikicommons.images".disabled = true;
        "yacy images".disabled = true;

        "bing videos".disabled = true;
        "brave.videos".disabled = true;
        "duckduckgo videos".disabled = true;
        "google videos".disabled = true;
        "qwant videos".disabled = true;
        "dailymotion".disabled = true;
        "google play movies".disabled = true;
        "invidious".disabled = true;
        "odysee".disabled = true;
        "peertube".disabled = true;
        "piped".disabled = true;
        "rumble".disabled = true;
        "sepiasearch".disabled = true;
        "vimeo".disabled = true;
        "youtube".disabled = true;

        "brave.news".disabled = true;
        "google news".disabled = true;
      };
    };
  };
}
