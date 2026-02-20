{
  flake.modules.nixos.ntp = {
    services.localtimed.enable = true;
    #services.automatic-timezoned.enable = true;
    services.geoclue2 = {
      enable = true;
    };
  };
}
