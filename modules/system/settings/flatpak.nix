{ inputs
, ...
}:
{
  flake.modules.nixos.flatpak = { ... }: {
    imports = [
      inputs.nix-flatpak.nixosModules.nix-flatpak
    ];


    xdg = {
      portal.enable = true;

      mime = {

      };
    };

    services.flatpak = {
      enable = true;
      overrides = {
        global = {
          # Force Wayland by default
          #Context.sockets = ["wayland" "!x11" "!fallback-x11"];

          Environment = {
            # Fix un-themed cursor in some Wayland apps
            #XCURSOR_PATH = "/run/host/user-share/icons:/run/host/share/icons";

            # Force correct theme for some GTK apps
            GTK_THEME = "Adwaita:dark";
          };
        };
      };
    };

  };
}
