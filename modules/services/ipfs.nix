{
  flake.modules.nixos.ipfs = { pkgs, lib, ... }:
    let
      kuboPkg = pkgs.unstable.kubo;
    in
    {
      services = {
        kubo = {
          enable = true;
          package = kuboPkg;
          settings = {
            Addresses = {
              Gateway = "/ip4/127.0.0.1/tcp/9053";
            };
          };
        };

        opensnitch.rules.ipfs = {
          created = "2026-06-27T19:37:37.000000Z";
          name = "ipfs";
          enabled = true;
          action = "allow";
          duration = "always";
          operator = {
            type = "simple";
            sensitive = false;
            operand = "process.path";
            data = "${lib.getBin kuboPkg}/bin/ipfs";
          };
        };
      };
    };
}
