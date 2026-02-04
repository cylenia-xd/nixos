{ lib, config, ... }: {
  sops.defaultSopsFile = ../../secrets/secrets.yaml;
  sops.defaultSopsFormat = "yaml";
  sops.age.keyFile = "/home/cylenia/.config/sops/age/keys.txt";
  sops.secrets = (lib.mkIf (config.networking.hostName == "paul") {
    pangolin_env = {};
    vaultwarden_env = {};
    mistral_api_key.owner = "librechat";
  }) // (lib.mkIf (config.networking.hostName == "jane") {
    email_password.owner = "cylenia";
  });
}
