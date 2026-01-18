{ inputs
, ...
}:
{
  flake.modules.nixos.rimgo = { pkgs, ... }: {
    imports = with inputs.self.modules.nixos; [
      anubis
    ];

    services = {
      rimgo = {
        enable = true;
        # openFirewall = true;
        package = pkgs.rimgo;
        settings = {
          ADDRESS = "0.0.0.0";
          PORT = 9023;
          FORCE_WEBP = "1";
        };
      };

      anubis.instances = {
        rimgo = {
          enable = true;
          settings = {
            BIND = "/run/anubis/anubis-rimgo/http";
            METRICS_BIND = "/run/anubis/anubis-rimgo/metrics";
            TARGET = "http://localhost:9023";
          };
        };
      };
    };
  };
}

