{ config, pkgs, ... }: {
  services.ente.api = {
    enable = true;
    domain = "ente.cylenia.dev";
    enableLocalDB = true;
    settings = {
      http.port = 8071;
      http.use-tls = false;
      key.encryption._secret = config.sops.secrets.ente_encryption.path;
      key.hash._secret = config.sops.secrets.ente_hash.path;
      jwt.secret._secret = config.sops.secrets.ente_jwt.path;
    };
  };
}
