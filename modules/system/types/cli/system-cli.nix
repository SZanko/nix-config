{ inputs
, ...
}:
{
  # expansion of nix-modules-setup system with cli-tools

  flake.modules.nixos.system-cli = {
    imports = with inputs.self.modules.nixos; [
      nix-modules-setup
      cli-tools
      systemd-resolved
      security
      zsh
    ];
  };

  flake.modules.darwin.system-cli = {
    imports = with inputs.self.modules.darwin; [
      nix-modules-setup
      cli-tools
      zsh
    ];
  };

  #flake.modules.homeManager.system-cli = {
  #  imports = with inputs.self.modules.homeManager; [
  #    nix-modules-setup
  #    #shell
  #  ];
  #};
}
