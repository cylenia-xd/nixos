{ ... }: {
  sops.defaultSopsFile = ../../secrets/secrets.yaml;
  sops.defaultSopsFormat = "yaml";
  sops.age.keyFile = "/home/cylenia/.config/sops/age/keys.txt";
}
