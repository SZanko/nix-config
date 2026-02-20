{ inputs
, ... 
}:
{
  flake.modules.nixos.vpsfree = { lib, ... }: {
    imports = with inputs.self.modules.nixos; [
      system-server
      redlib
      german
    ];

    time.timeZone = lib.mkDefault "Europe/Vienna";


    networking = {
      hostName = "vpsfree";
    };

    systemd.settings.Manager = {
      DefaultTimeoutStartSec="900s";
    };

    # List services that you want to enable:
    users.users.root.openssh.authorizedKeys.keys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAICbMQFo6T0D+4tdmnY0aAx6lOU99sFSBhy6jbIycU3yr szanko@protonmail.com"
    ];

    fileSystems."/mnt/export2076" = {
      device = "172.16.130.54:/nas/5940";
      fsType = "nfs";
      options = [ 
        "defaults"
        #"nofail" 
        "hard"
        "rw"
        "timeo=600"
        "retrans=2"
        "fg"
        "rsize=8192"
        "wsize=8192"
        "noatime"
        #"acregmin=0"
        #"acregmax=0"
        #"acdirmin=0"
        #"acdirmax=0"
      ];
    };

  };
}
