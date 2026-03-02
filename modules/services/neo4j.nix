{
  flake.modules.nixos.neo4j-dev = { pkgs, ... }: {
    services.neo4j= {
      enable = true;
      bolt = {
        tlsLevel = "DISABLED";
      };
      https = {
        enable = false;
      };
    };

    environment.systemPackages = with pkgs; [
      neo4j-desktop
    ];
  };
}

