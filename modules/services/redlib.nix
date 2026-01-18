{ inputs
, ...
}:
{
  flake.modules.nixos.redlib = { unstable, ... }: {
    imports = with inputs.self.modules.nixos; [
      anubis
    ];

    services={
      redlib = {
        enable = true;
        openFirewall = false;
        package = unstable.redlib;
        port = 9020;
        address = "0.0.0.0";
        settings = {
          REDLIB_DEFAULT_SHOW_NSFW = "on";
          REDLIB_DEFAULT_USE_HLS = "on";
          REDLIB_DEFAULT_HIDE_HLS_NOTIFICATION = "on";
        };
      };

      anubis.instances = {
        redlib = {
          enable = true;
          settings = {
            BIND = "/run/anubis/anubis-redlib/http";
            METRICS_BIND = "/run/anubis/anubis-redlib/metrics";
            TARGET = "http://localhost:9020";
          };
        };
      };
    };

  };
}


