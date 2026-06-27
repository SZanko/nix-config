{
  flake.modules.nixos.printing = { pkgs, lib, ... }: {
    services = {
      printing.enable = true;
      avahi = {
        enable = true;
        nssmdns4 = true;
        openFirewall = true;
      };

      opensnitch.rules = {
        avahi = {
          created= "2026-06-27T19=48=31.000000Z";
          name= "avahi";
          enabled= true;
          action = "allow";
          duration= "always";
          operator = {
            type= "simple";
            sensitive = false;
            operand= "process.path";
            data= "${lib.getBin pkgs.avahi}/bin/avahi-daemon";
          };
        };

      };
    };
  };
}
