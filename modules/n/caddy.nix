{ pkgs, ... }: {
  services.caddy = {
    enable = true;
    package = pkgs.caddy.withPlugins {
      plugins = [ "github.com/WingLim/caddy-webhook@v1.0.8" ];
      hash = "sha256-oMmmKK4HkkNCUQVfMb7FImtkKmf9/oQ51h577W5WTEg=";
    };
    extraConfig = ''
      :8067 {
        @post {
          method POST
        }
        handle @post {
          exec --working-dir /srv/bio git pull
          exec --working-dir /srv/bio npm run compile
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

  systemd.services.caddy.path = [ pkgs.nodejs ];
}

