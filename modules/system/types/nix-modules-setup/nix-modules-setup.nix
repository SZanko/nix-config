{ inputs
, ...
}:
{
  # import all essential nix-tools which which are used in all modules of specific class

  flake.modules.nixos.nix-modules-setup = {
    imports =
      with inputs.self.modules.nixos;
      [
        system-barebones
        #home-manager
        #impermanence
        #secrets
        #sops-nix
        firmware
        nur
      ]
      ++ [ inputs.self.modules.generic.systemConstants ];
  };

  flake.modules.darwin.nix-modules-setup = {
    imports =
      with inputs.self.modules.darwin;
      [
        system-barebones
        determinate
        #home-manager
        homebrew
        impermanence
        #secrets
        sops
        nur
      ]
      ++ [ inputs.self.modules.generic.systemConstants ];
  };

  # impermanence is not added by default to home-manager, because of missing Darwin implementation
  # for linux home-manager stand-alone configurations it has to be added manualy

  #flake.modules.homeManager.nix-modules-setup = {
  #  imports =
  #    with inputs.self.modules.homeManager;
  #    [
  #      system-default
  #      secrets
  #    ]
  #    ++ [ inputs.self.modules.generic.systemConstants ];
  #};
}
