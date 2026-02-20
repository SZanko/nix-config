{ config
, pkgs
, lib
, ...
}:
{

  flake.modules.nixos.redis = { pkgs, ... }: {
    services.redis = {
      # openFirewall = true;
      package = pkgs.keydb;
      #package = pkgs.redis;
      servers = {
        default = {
          enable = true;
          port = 6379;
        };
      };
    };

  };
}
