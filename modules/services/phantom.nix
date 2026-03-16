{ inputs
, ... 
}:
{

  flake.modules.nixos.phantom-service = { ... }: {

    imports = [
      inputs.nur.modules.nixos.default
      #inputs.nur.legacyPackages.${pkgs.stdenv.hostPlatform.system}.repos.szanko.modules.phantom
      #inputs.nur.legacyPackages.x86_64-linux.repos.szanko.modules.phantom
    ];

    #services.phantom = {
    #  enable = true;
    #  cache.enable = true;
    #};
  };
}
