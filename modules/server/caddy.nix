{ pkgs, ... }:
let
  bioSite = pkgs.stdenv.mkDerivation {
    name = "bio-site";
    src = fetchGit {
      url = "https://github.com/cylenia-xd/bio.git";
      ref = "master";
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
