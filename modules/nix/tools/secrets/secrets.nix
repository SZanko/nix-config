{
  inputs,
  self,
  ...
}:
{
  flake.modules.nixos.secrets =
    { pkgs, ... }:
    {
      imports = [
        inputs.sops-nix.nixosModules.sops
      ];
      environment.systemPackages = [ inputs.sops-nix.packages.${pkgs.stdenv.hostPlatform.system}.default ];
    };

  flake.modules.darwin.secrets =
    { pkgs, ... }:
    {
      imports = [
        inputs.sops-nix.darwinModules.default
      ];
      environment.systemPackages = [ inputs.sops-nix.packages.${pkgs.stdenv.hostPlatform.system}.default ];
    };

  #flake.modules.homeManager.secrets =
  #  { pkgs, ... }:
  #  {
  #    imports = [
  #      inputs.sops-nix.homeManagerModules.sops
  #    ];
  #  };

}
