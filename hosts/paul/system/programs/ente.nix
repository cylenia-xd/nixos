{ config, pkgs, ... }: {
  services.ente = {
    api = {
      enable = true;
      domain = "museum.cylenia.dev";
      enableLocalDB = true;
      settings = {
        http.port = 8071;
        http.use-tls = false;
        key.encryption = builtins.readFile config.sops.secrets.ente_encryption.path
        key.hash = builtins.readFile config.sops.secrets.ente_hash.path
        jwt.secret = builtins.readFile config.sops.secrets.ente_jwt.path
      };
    };
  };
}
