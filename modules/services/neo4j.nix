{
  flake.modules.nixos.neo4j = { pkgs, ... }: {
    services.neo4j= {
      enable = true;
    };
  };
}

