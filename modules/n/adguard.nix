{ ... }: {
  services.adguardhome = {
    enable = true;
    port = 8067; # http page for config and status i think
    mutableSettings = false;
    settings = {
      users = [];
      language = "en";
      theme = "dark";
      dns = {
        bind_hosts = [ "0.0.0.0" ];
        port = 53;
        upstream_dns = [ "https://dns.quad9.net/dns-query" ];
        bootstrap_dns = [ "9.9.9.9" "149.112.112.112" "2620:fe::fe" "2620:fe::9" ];
        upstream_mode = "load_balance";
        use_http3_upstreams = true;
        serve_http3 = true;
        serve_plain_dns = true;
        cache_enabled = false;
        enable_dnssec = true;
        protection_enabled = false;
        filtering_enabled = false;
        dhcp.enabled = false;
      };
    };
  };
}
