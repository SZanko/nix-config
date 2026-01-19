{
inputs,
...
}:
{
  flake.modules.nixos.desktop = {
    imports = with inputs.self.modules.nixos; [
      system-desktop
      systemd-boot
      bluetooth
      nvidia-closed
      gaming
      multimedia
      redlib
    ];

    # Enable networking
    networking = {
      networkmanager.enable = true;
      hostName = "stefan-pc"; # Define your hostname.
      nameservers = [ 
        "9.9.9.9#dns.quad9.net"
        "149.112.112.112#dns.quad9.net"
        "2620:fe::10#dns.quad9.net"
        "2620:fe::fe:10#dns.quad9.net"
        "1.1.1.1#one.one.one.one"
        "1.0.0.1#one.one.one.one"
      ];
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


  };
}
