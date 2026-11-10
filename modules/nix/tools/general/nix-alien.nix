{ inputs
, ...
}:
{

  flake.modules.nixos.nix-alien = { pkgs, ... }: {

    environment.systemPackages = with inputs.nix-alien.packages.${pkgs.stdenv.hostPlatform.system}; [
      nix-alien
    ] ++ [
      pkgs.gdb
    ]
    ;

    programs.nix-ld.enable = true;
  };
}
