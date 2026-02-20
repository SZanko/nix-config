{ inputs
, ...
}:
{
  # expansion of nix-modules-setup system with cli-tools

  flake.modules.nixos.system-server = {
    imports = with inputs.self.modules.nixos; [
      system-cli
      ssh
      redlib
      rimgo
      containers
    ];
  };

  flake.modules.darwin.system-server = {
    imports = with inputs.self.modules.darwin; [
      system-cli
    ];
  };

  #flake.modules.homeManager.system-server = {
  #  imports = with inputs.self.modules.homeManager; [
  #    nix-modules-setup
  #    #shell
  #  ];
  #};
}
