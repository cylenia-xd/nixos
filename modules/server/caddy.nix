{ pkgs, ... }:
let
  bioSite = pkgs.callPackage (pkgs.fetchFromGitHub {
    owner = "cylenia-xd";
    repo = "bio";
    rev = "62cf749bbd3fb89f6135b7e0c9050ecc1238738b";
    hash = "sha256-HfLh4vzidgONuBCUagTgcGHsLFexaZyDPDAm7CLBHJc=";
  }) {};
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
