{ inputs
, ...
}:
{

  flake.modules.nixos.gaming = { inputs, ... }: {
    programs = {
      joycond-cemuhook.enable = true;
    };

    services = {
      ratbagd.enable = true;
      joycond.enable = true;

      flatpak = {
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
