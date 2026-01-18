{
  flake.modules.nixos.ssh = {
    services.openssh = {
      enable = true;
      settings = {
        PermitRootLogin = "yes";
        LogLevel = "VERBOSE";
        PasswordAuthentication = false;
        KbdInteractiveAuthentication = false;
      };
    };

    # TODO use something like nix-mineral
    systemd.services.sshd.serviceConfig = {
      #NoNewPrivileges = true;
      #ProtectSystem = "strict";
      #ProtectHome = "read-only";
      ProtectClock = true; 
      ProtectHostname = true;
      ProtectKernelTunables = true;
      ProtectKernelModules = true;
      ProtectKernelLogs = true;
      ProtectControlGroups = true; 
      ProtectProc = "invisible";
      PrivateTmp = true;
      PrivateMounts = true;
      PrivateDevices = true;
      RestrictNamespaces = true;
      RestrictRealtime = true;
      RestrictSUIDSGID = true;
      MemoryDenyWriteExecute = true;
      LockPersonality = true;
      DevicePolicy = "closed";
      SystemCallFilter = [
        "~@keyring"
        "~@swap"
        "~@clock"         
        "~@module"
        "~@obsolete"
        "~@cpu-emulation"
      ];
      SystemCallArchitectures = "native";
    };
  };

  flake.modules.darwin.ssh = {
    services.openssh = {
      enable = true;
    };
  };
}
