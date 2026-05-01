{
  flake.modules.nixos.spark-dev = { pkgs, ... }: {
    services.spark = {
      worker.enable = true;
      master.enable = true;
    };
  };
}
