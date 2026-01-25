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
    ];

    # Enable networking
    networking = {
      networkmanager.enable = true;
      hostName = "stefan-laptop"; # Define your hostname.
      #wireless.enable = true;  # Enables wireless support via wpa_supplicant.
    };

    time.timeZone = "Europe/Lisbon";

    # Select internationalisation properties.
    i18n.defaultLocale = "de_AT.UTF-8";

    i18n.extraLocaleSettings = {
      LC_ADDRESS = "de_AT.UTF-8";
      LC_IDENTIFICATION = "de_AT.UTF-8";
      LC_MEASUREMENT = "de_AT.UTF-8";
      LC_MONETARY = "de_AT.UTF-8";
      LC_NAME = "de_AT.UTF-8";
      LC_NUMERIC = "de_AT.UTF-8";
      LC_PAPER = "de_AT.UTF-8";
      LC_TELEPHONE = "de_AT.UTF-8";
      LC_TIME = "de_AT.UTF-8";
    };
    console.keyMap = "de";

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

