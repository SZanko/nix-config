{
  flake.modules.nixos.antivirus = {
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
    };
  };
}
