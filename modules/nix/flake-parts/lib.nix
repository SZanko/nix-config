{
  inputs,
  lib,
  ...
}:
{
  # Helper functions for creating system / home-manager configurations

  options.flake.lib = lib.mkOption {
    type = lib.types.attrsOf lib.types.unspecified;
    default = { };
  };

  config.flake.lib = {

    mkNixos = hostSystem: name: {
      ${name} = inputs.nixpkgs.lib.nixosSystem {
        modules = [
          inputs.self.modules.nixos.${name}
          { nixpkgs.hostPlatform = lib.mkDefault hostSystem; }
        ];
      };
    };

    mkDarwin = hostSystem: name: {
      ${name} = inputs.nix-darwin.lib.darwinSystem {
        modules = [
          inputs.self.modules.darwin.${name}
          { nixpkgs.hostPlatform = lib.mkDefault hostSystem; }
        ];
      };
    };

    #mkHomeManager = system: name: {
    #  ${name} = inputs.home-manager.lib.homeManagerConfiguration {
    #    pkgs = inputs.nixpkgs.legacyPackages.${system};
    #    modules = [
    #      inputs.self.modules.homeManager.${name}
    #    ];
    #  };
    #};

  };
}
