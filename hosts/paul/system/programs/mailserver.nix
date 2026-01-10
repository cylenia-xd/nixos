{ config, pkgs, ... }: {
  imports = [
    (builtins.fetchTarball {
      url = "https://gitlab.com/simple-nixos-mailserver/nixos-mailserver/-/archive/nixos-25.11/nixos-mailserver-nixos-25.11.tar.gz";
      sha256 = "0pqc7bay9v360x2b7irqaz4ly63gp4z859cgg5c04imknv0pwjqw";
    })
  ];

  security.acme = {
    acceptTerms = true;
    defaults.email = "me@cylenia.dev";
    certs.${config.mailserver.fqdn} = {
      domain = "*.cylenia.dev";
      dnsProvider = "rfc2136";
      environmentFile = "/var/lib/secrets/certs.secret";
      dnsPropagationCheck = false;
    };
  };

  systemd.services.dns-rfc2136-conf = {
    requiredBy = [
      "acme-cylenia.dev.service"
      "bind.service"
    ];
    before = [
      "acme-cylenia.dev.service"
      "bind.service"
    ];
    unitConfig = {
      ConditionPathExists = "!/var/lib/secrets/dnskeys.conf";
    };
    serviceConfig = {
      Type = "oneshot";
      UMask = 77;
    };
    path = [ pkgs.bind ];
    script = ''
      mkdir -p /var/lib/secrets
      chmod 755 /var/lib/secrets
      tsig-keygen rfc2136key.cylenia.dev > /var/lib/secrets/dnskeys.conf
      chown named:root /var/lib/secrets/dnskeys.conf
      chmod 400 /var/lib/secrets/dnskeys.conf

      # extract secret value from the dnskeys.conf
      while read x y; do if [ "$x" = "secret" ]; then secret="''${y:1:''${#y}-3}"; fi; done < /var/lib/secrets/dnskeys.conf

      cat > /var/lib/secrets/certs.secret << EOF
      RFC2136_NAMESERVER='127.0.0.1:53'
      RFC2136_TSIG_ALGORITHM='hmac-sha256.'
      RFC2136_TSIG_KEY='rfc2136key.cylenia.dev'
      RFC2136_TSIG_SECRET='$secret'
      EOF
      chmod 400 /var/lib/secrets/certs.secret
    '';
  };

  mailserver = {
    enable = true;
    stateVersion = 3;
    fqdn = "cylenia.dev";
    domains = [ "cylenia.dev" ];

    loginAccounts = {
      "me@cylenia.dev" = {
        hashedPasswordFile = builtins.toString config.sops.secrets.email_password_hash.path;
        aliases = [ "hi@cylenia.dev" "hello@cylenia.dev" "cylenia@cylenia.dev" ];
      };
    };
  };
}
