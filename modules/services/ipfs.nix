{
  flake.modules.nixos.ipfs = { pkgs, ... }: {
    services.kubo = {
      enable = true;
      package = pkgs.unstable.kubo;
      settings = {
        Addresses = {
          Gateway = "/ip4/127.0.0.1/tcp/9053";
        };
      };
    };
  };
}
