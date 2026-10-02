{
  flake.modules.nixos.systemd-resolved = {
    services.resolved = {
      enable = true;

      settings.Resolve = {
        DNS = [ 
          "1.1.1.1#one.one.one.one"
          "1.0.0.1#one.one.one.one"
          #"9.9.9.9#dns.quad9.net"
          #"149.112.112.112#dns.quad9.net"
          #"2620:fe::fe#dns.quad9.net"
        ];
        DNSOverTLS = "true";
        DNSSEC = "allow-downgrade";
      };
    };

    networking = {
      networkmanager.dns = "systemd-resolved";
      nameservers = [
        "1.1.1.1"
        "1.0.0.1"
      ];
    };
  };
}

