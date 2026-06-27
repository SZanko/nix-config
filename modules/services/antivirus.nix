{ inputs
, ...
}:
{
  flake.modules.nixos.antivirus = { pkgs, lib, ...}: {
    services = {
      clamav = {
        scanner.enable = true;
        updater = {
          enable = true;
        };
        daemon = {
          enable = true;
        };
        fangfrisch = {
          enable = true;
        };
      };

      opensnitch.rules = {
        clamav = {
          created= "2026-06-27T19=00=20.000000Z";
          name= "clamav";
          enabled= true;
          action= "allow";
          duration= "always";
          operator = {
            type= "simple";
            sensitive = false;
            operand= "process.path";
            data= "${lib.getBin pkgs.clamav}/bin/freshclam";
          };
        };
      };
    };
  };
}
