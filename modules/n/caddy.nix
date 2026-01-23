{ pkgs, ... }: {
  services.caddy = {
    enable = true;
    package = pkgs.caddy.withPlugins {
      plugins = [ "github.com/greenpau/caddy-git@v1.0.9" ];
      hash = "sha256-nh+Oq0M3xjRVlBH/QtYtbQ126CUSzQY5QvCuSrTKvlg=";
    };
    extraConfig = ''
      :8067 {
        route {
          git /github/cylenia-xd/bio {
            path /srv/bio
            then sh -c "cd /srv/bio && npm run compile"
            hook /webhooks
            hook_type github
            clone_args --recursive
            pull_args --recurse-submodules
          }
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

