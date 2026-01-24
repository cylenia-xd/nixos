{ config, ... }: {
  services.vaultwarden = {
    enable = true;
    environmentFile = config.sops.secrets.vaultwarden_env.path;
    config = {
      DOMAIN = "https://pass.cylenia.dev";
      ROCKET_ADDRESS = "127.0.0.1";
      ROCKET_PORT = 8070;
    };
  };
}
