{ inputs
, ...
}:
{
  flake.modules.nixos.gnome = { pkgs, lib, ...}: {
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

      opensnitch.rules = {
        gjs = {
          created= "2026-06-27T18=40=29.000000Z";
          name= "gnome-js";
          enabled= true;
          action= "allow";
          duration= "always";
          operator= {
            type= "simple";
            sensitive = false;
            operand= "process.path";
            data= "${lib.getBin pkgs.gjs}/bin/gjs-console";
          };
        };

        gnome-software = {
          created= "2026-06-27T18=40=59.000000Z";
          name= "gnome-software";
          enabled= true;
          action= "allow";
          duration= "always";
          operator= {
            type= "simple";
            operand= "process.path";
            data= "${lib.getBin pkgs.gnome-software}/bin/.gnome-software-wrapped";
          };
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
