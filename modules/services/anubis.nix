{
  flake.modules.nixos.anubis = {
    services.anubis = {
      defaultOptions = {
        enable = true;
        settings = {
          OG_PASSTHROUGH = true;
          #BIND_NETWORK = "tcp";
        };
      };
    };
  };
}
