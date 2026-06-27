{ inputs
, ...
}:
{
  flake.modules.nixos.opensnitch = { pkgs, lib, ... }: {
    environment.systemPackages = with pkgs; [
      opensnitch-ui
    ];

    services.opensnitch = {
      enable = true;

      rules = {
        nix = {
          created = "2026-06-27T14:13:27.903996051+02:00";
          name = "nix";
          enable = true;
          action = "allow";
          duration = "always";
          operator = {
            type ="simple";
            sensitive = false;
            operand = "process.path";
            data = "${lib.getBin pkgs.nix}/bin/nix";
          };
        };

        firefox = {
          created="2026-06-27T18:40:12.000000Z";
          name= "firefox-flatpak";
          enabled =  true;
          action = "allow";
          duration = "always";
          operator = {
            type = "simple";
            sensitive = false;
            operand = "process.path";
            data = "/app/lib/firefox/firefox-bin";
          };
        };

        systemd-timesyncd = {
          created = "2018-04-07T14:13:27.903996051+02:00";
          name = "systemd-timesyncd";
          enabled = true;
          action = "allow";
          duration = "always";
          operator = {
            type ="simple";
            sensitive = false;
            operand = "process.path";
            data = "${lib.getBin pkgs.systemd}/lib/systemd/systemd-timesyncd";
          };
        };

        systemd-resolved = {
          created = "2018-04-07T14:13:27.903996051+02:00";
          name = "systemd-resolved";
          enabled = true;
          action = "allow";
          duration = "always";
          operator = {
            type ="simple";
            sensitive = false;
            operand = "process.path";
            data = "${lib.getBin pkgs.systemd}/lib/systemd/systemd-resolved";
          };
        };

      };
    };
  };
}

