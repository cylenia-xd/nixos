{ pkgs, ... }:
let
  bioSite = pkgs.callPackage (pkgs.fetchFromGitHub {
    owner = "cylenia-xd";
    repo = "bio";
    rev = "7f04f2f558a3220cc6ee092efa43fced172df5ae";
    hash = "sha256-CdmfDI7coV+ySQg2MPBUqzo9HV+6Cv68Q6kYZHatf6s=";
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
