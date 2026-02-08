{
  flake.modules.nixos.guest = { lib, config, pkgs, ... }: {
    users.users.guest = {
      isNormalUser = true;
      shell = pkgs.zsh;
      description = "Guest";
      password = "";
    };
  };

}
