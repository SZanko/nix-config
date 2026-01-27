{ inputs
, ...
}:
{
  flake.modules.nixos.gnome = { pkgs, ...}: {
    #home-manager.sharedModules = [
    #  inputs.self.modules.homeManager.gnome
    #];

    services = {
      displayManager = {
        gdm.enable = true;
      };
      desktopManager = {
        gnome.enable = true;
      };
      xserver = {
        enable = true;
        xkb = {
          layout = "at";
          variant = "";
        };
      };
    };


    programs = {
      dconf.enable = true;
      kdeconnect = {
        enable = true;
        package = pkgs.gnomeExtensions.gsconnect;
      };
    };

    environment = {
      gnome = {
        excludePackages = with pkgs; [
          epiphany
          geary
          gnome-maps
          gnome-calendar
          gnome-characters
          gnome-contacts
          gnome-font-viewer
        ];
      };
    };

  };


  #flake.modules.homeManager.gnome = {
  #  dconf.settings = {
  #    "org/gnome/desktop/interface" = {
  #      enable-hot-corners = true;
  #    };
  #    "org/nemo/preferences" = {
  #      confirm-move-to-trash = true;
  #    };
  #  };
  #};
}
