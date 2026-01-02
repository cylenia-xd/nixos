{ config, pkgs, ... }: {
  services.vaultwarden = {
    enable = true;
    dbBackend = "sqlite";
    environmentFile = config.sops.secrets.vaultwarden_env.path;
    config = {
      DOMAIN = "https://pass.cylenia.dev";
      DATA_FOLDER = "/opt/vwdata";
      ROCKET_ADDRESS = "0.0.0.0";
      ROCKET_PORT = 8069;
      SIGNUPS_ALLOWED = false;
      IP_HEADER = "X-Real-IP";
    };
  };
}
