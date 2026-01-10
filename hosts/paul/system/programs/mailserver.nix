{ config, pkgs, ... }: {
  imports = [
    (builtins.fetchTarball {
      url = "https://gitlab.com/simple-nixos-mailserver/nixos-mailserver/-/archive/nixos-25.11/nixos-mailserver-nixos-25.11.tar.gz";
      sha256 = "";
    })
  ];

  security.acme = {
    acceptTerms = true;
    defaults.email = "me@cylenia.dev";
    certs.${config.mailserver.fqdn} = {
      domain = "mail.cylenia.dev";
      dnsProvider = "rfc2136";
      environmentFile = "/var/lib/secrets/certs.secret";
      dnsPropagationCheck = false;
    };
  };

  mailserver = {
    enable = true;
    stateVersion = 3;
    fqdn = "mail.cylenia.dev";
    domains = [ "cylenia.dev" ];

    x509.useACMEHost = config.mailserver.fqdn;

    loginAccounts = {
      "me@cylenia.dev" = {
        hashedPasswordFile = builtins.toString config.sops.secrets.email_password_hash.path;
        aliases = [ "hi@cylenia.dev" "hello@cylenia.dev" "cylenia@cylenia.dev" ];
      };
    };
  };
}
