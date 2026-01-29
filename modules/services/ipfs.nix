{
  flake.modules.nixos.ipfs = { pkgs, ... }: {
    services.kubo = {
      enable = true;
      package = pkgs.unstable.kubo;
    };
  };
}
