{ inputs
, ...
}:
{

  flake.modules.nixos.gaming = {
    imports = [
      inputs.nix-flatpak.nixosModules.nix-flatpak
    ];
    programs = {
      joycond-cemuhook.enable = true;
    };

    services = {
      ratbagd.enable = true;
      joycond.enable = true;

      flatpak = {
        enable = true;

        packages = [
          "net.lutris.Lutris"
          "com.heroicgameslauncher.hgl"
          "com.modrinth.ModrinthApp"
          "io.github.limo_app.limo"
          "io.github.loot.loot"
          "io.github.spacingbat3.webcord"
        ];
      };
    };
  };
}
