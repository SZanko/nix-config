{
  flake.modules.nixos.systemd-resolved-nextdns = {
    services.resolved = {
      enable = true;

      settings.Resolve = {
        DNS = [
          "45.90.28.0#c5eb51.dns.nextdns.io"
          "2a07:a8c0::#c5eb51.dns.nextdns.io"
          "45.90.30.0#c5eb51.dns.nextdns.io"
          "2a07:a8c1::#c5eb51.dns.nextdns.io"
        ];
        DNSOverTLS = "true";
        DNSSEC = "allow-downgrade";
      };
    };

    networking.nameservers = [
      "45.90.28.0"
      "45.90.30.0"
      "2a07:a8c0::"
      "2a07:a8c1::"
    ];

    networking.networkmanager.dns = "systemd-resolved";
  };
}
