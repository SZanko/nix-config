{ inputs
, ... 
}:
{
  flake.modules.nixos.caddy = { pkgs, ... }: {
    services.caddy = {
      enable = true;
      package = pkgs.caddy;
      #configFile = ../config/Caddyfile;
    };
  };
}
