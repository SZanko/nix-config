{ inputs
, ... 
}:
{
  flake.modules.nixos.phantom-service = { pkgs, ... }: {

  #imports = [
  #    inputs.nur.modules.nixos.default
    #    inputs.nur.legacyPackages.${pkgs.system}.repos.szanko.modules.phantom
    #];

    #services.phantom = {
    #  enable = true;
    #  cache.enable = true;
    #};
  };
}
