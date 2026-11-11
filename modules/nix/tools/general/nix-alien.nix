{ inputs
, ...
}:
{

  flake.modules.nixos.nix-alien = { pkgs, lib, ... }: {

    environment.systemPackages = with inputs.nix-alien.packages.${pkgs.stdenv.hostPlatform.system}; [
      nix-alien
    ] ++ (with pkgs;[
      gdb
      nix-ld
    ]);

    programs.nix-ld = {
      enable = true;
      libraries = lib.mkAfter (with pkgs; [
        SDL2
        fontconfig
      ]);
    };
  };
}
