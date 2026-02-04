{ ... }: {
  sops.defaultSopsFile = ../../secrets/secrets.yaml;
  sops.defaultSopsFormat = "yaml";
  sops.age.keyFile = "/home/cylenia/.config/sops/age/keys.txt";
  sops.secrets = {
    pangolin_env = {};
    vaultwarden_env = {};
    mistral_api_key.owner = "librechat";
    email_password.owner = "cylenia";
  };
}
