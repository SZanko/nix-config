{ inputs
, self
, ...
}:

let
  username = "stefan";
in
  {
  flake.modules.nixos."${username}" =
    { lib
    , config
    , pkgs
    , ...
    }:
    {

      imports = with inputs.self.modules.nixos; [
        # developmentEnvironment
        java
        containers
      ];

      users.users."${username}" = {
        isNormalUser = true;
        shell = pkgs.zsh;
        description = "Stefan Zanko";
        extraGroups = [ 
          "networkmanager" 
          "wheel" 
          "podman" 
          "docker" 
          "kvm" 
          "adbusers" 
          "libvirtd" 
          "gamemode" 
          "dialout"
          "tss"
          "uucp"
          "plugdev"
          config.services.kubo.group
        ];

        packages = [

        ];
      };
      programs = {
        gnupg.agent = {
          enable = true;
          enableSSHSupport = true;
        };
      };
    };
}
