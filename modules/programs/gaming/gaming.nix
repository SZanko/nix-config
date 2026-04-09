{ inputs
, ...
}:
{

  flake.modules.nixos.gaming = { inputs, pkgs, ... }: {
    programs = {
      joycond-cemuhook.enable = true;
    };

    environment.systemPackages =  with pkgs.unstable; [
      #heroic
    ];

    services = {
      ratbagd.enable = true;
      joycond.enable = true;

      flatpak = {
        packages = [
          "net.lutris.Lutris"
          "com.heroicgameslauncher.hgl"
          "com.modrinth.ModrinthApp"
          "com.jaquadro.NBTExplorer"
          "io.github.limo_app.limo"
          "io.github.loot.loot"
          "io.github.spacingbat3.webcord"
        ];
      };
    };
  };
}
