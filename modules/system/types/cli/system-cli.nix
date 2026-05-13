{ inputs
, ...
}:
{
  # expansion of nix-modules-setup system with cli-tools

  flake.modules.nixos.system-cli = { pkgs, lib, ... }: {
    imports = with inputs.self.modules.nixos; [
      nix-modules-setup
      cli-tools
      graphics
      security
      zsh
      nixstore-garbage-collection
    ];

    boot.kernelPackages = lib.mkIf (lib.versionOlder pkgs.linux.version "6.18.22") (
      lib.mkDefault pkgs.linuxPackages_6_18
    );

  };

  flake.modules.darwin.system-cli = {
    imports = with inputs.self.modules.darwin; [
      nix-modules-setup
      cli-tools
      zsh
      nixstore-garbage-collection
    ];
  };

  #flake.modules.homeManager.system-cli = {
  #  imports = with inputs.self.modules.homeManager; [
  #    nix-modules-setup
  #    #shell
  #  ];
  #};
}
