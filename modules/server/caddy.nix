{ pkgs, ... }:
let
  bioSite = pkgs.stdenv.mkDerivation {
    name = "bio-site";
    src = pkgs.fetchFromGitHub {
      owner = "cylenia-xd";
      repo = "bio";
      rev = "2f975f0941b7664fa9f7a5c50a49b5c14e473a2e";
    };
    buildInputs = [ pkgs.nodejs ];
    buildPhase = ''
      npx @11ty/eleventy
    '';
    installPhase = ''
      mkdir -p $out
      cp -r _site/* $out/
    '';
  };
in {
  services.caddy = {
    enable = true;
    package = pkgs.caddy;
    virtualHosts = {
      ":8068".extraConfig = ''
        root * ${bioSite}
        file_server
      '';
    };
  };
}
