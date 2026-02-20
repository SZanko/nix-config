{
  flake.modules.nixos.guest = { lib, config, pkgs, ... }: {
    users.users.guest = {
      isNormalUser = true;
      shell = pkgs.zsh;
      description = "Guest";
      password = "";
    };

    systemd.tmpfiles.rules = [
      "D! /home/guest 0700 guest users"
    ];
  };

}
