{ inputs
, ...
}:
{
  flake.modules.nixos.laptop = { pkgs, ... }: {
    imports = with inputs.self.modules.nixos; [
      system-desktop
      systemd-boot
      systemd-resolved
      bluetooth
      multimedia
      german
      logitech
      #neo4j-dev
#spark-dev
    ];

    # Enable networking
    networking = {
      networkmanager.enable = true;
      hostName = "stefan-laptop"; # Define your hostname.
      #wireless.enable = true;  # Enables wireless support via wpa_supplicant.
    };

    time.timeZone = "Europe/Vienna";

    environment = {
      etc = {
        "modprobe.d/iwlwifi.conf".text = ''
      options iwlwifi 11n_disable=1
        '';
      };
      sessionVariables = {
        QT_QPA_PLATFORM = "wayland";
      };

      systemPackages = with pkgs; [
        jetbrains.pycharm
      ];
    };

    boot.kernelParams = [
      "psmouse.synaptics_intertouch=1"
    ];



  };
}

