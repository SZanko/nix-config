{ inputs
, ...
}:
{
  flake.modules.nixos.desktop = { pkgs, ... }: {
    imports = with inputs.self.modules.nixos; [
      system-desktop
      systemd-boot
      bluetooth
      nvidia-closed
      gaming
      multimedia
      redlib
      ipfs
      german
      phantom-service
    ];

    # Enable networking
    networking = {
      networkmanager.enable = true;
      hostName = "stefan-pc"; # Define your hostname.
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

      systemPackages =  [
        pkgs.nur.repos.szanko.samloader
      ];
    };


  };
}
