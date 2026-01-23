{ pkgs, ... }: {
  services.caddy = {
    enable = true;
    package = pkgs.xcaddy;
    extraConfig = ''
      :8067 {
        webhook {
          repo https://github.com/cylenia/bio.git
          path /srv/bio
          branch master
          command nix-shell --command npm run compile
        }
      }
      
      :8068 {
        root * /srv/bio/_site
        file_server
      }

      :8071 {
        root * /srv/countdown
        file_server
      }
    '';
  };
}

