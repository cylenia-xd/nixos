{ pkgs, ... }:
let
  bioSite = pkgs.callPackage (pkgs.fetchFromGitHub {
    owner = "cylenia-xd";
    repo = "bio";
    rev = "c2803cd7bafa31518818ebe0d9770a6007bb4c59";
    hash = "sha256-bskx2uu2GGJ7aNbQ00OH8qDT9FMrjENDINZ3sH444/c=";
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
