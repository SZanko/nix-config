{ inputs
, ...
}:
{
  flake.modules.nixos.gaming = { inputs, pkgs, ...}: {
    programs = { 
      gamemode = {
        enable = true;
        enableRenice = true;
      };

      gamescope = {
        enable = true;
      };

    };

    services.udev.packages = with pkgs; [
      steam-devices-udev-rules
    ];

    services = {
      joycond.enable = true;
    };

    services.flatpak = {
      packages = [
        "com.valvesoftware.Steam"
        "io.github.Foldex.AdwSteamGtk"
        "io.github.philipk.boilr"
      ];
    };
  };
}
