{
  flake.modules.nixos.neo4j-dev = { pkgs, ... }: {
    services.neo4j= {
      enable = true;
      bolt = {
        tlsLevel = "DISABLED";
      };
    };
  };
}

