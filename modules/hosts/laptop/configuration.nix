{ inputs
, ...
}:
{
  flake.modules.nixos.laptop = {
    imports = with inputs.self.modules.nixos; [
      system-desktop
      systemd-boot
      bluetooth
      multimedia
      german
    ];

    # Enable networking
    networking = {
      networkmanager.enable = true;
      hostName = "stefan-laptop"; # Define your hostname.
      #wireless.enable = true;  # Enables wireless support via wpa_supplicant.
    };

    time.timeZone = "Europe/Lisbon";

    environment = {
      etc = {
        "modprobe.d/iwlwifi.conf".text = ''
      options iwlwifi 11n_disable=1
        '';
      };
      sessionVariables = {
        QT_QPA_PLATFORM = "wayland";
      };
    };

    boot.kernelParams = [
      "psmouse.synaptics_intertouch=1"
    ];



  };
}

