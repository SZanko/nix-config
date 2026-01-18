{ pkgs
, url
, ...
}:
{ 
  flake.modules.nixos.healthcheck = {

    systemd.timers."ping-healthcheck" = {
      wantedBy = [ "timers.target" ];
      timerConfig = {
        #OnBootSec = "5m";
        #OnUnitActiveSec = "5m";
        OnCalendar = "daily";
        Persistent = true;
        Unit = "ping-healthcheck.service";
      };
    };

    systemd.services."ping-healthcheck" = {
      script = ''
    set -eu
    ${pkgs.curl}/bin/curl -fsS -m 10 --retry 5 -o /dev/null ${url}
      '';
      serviceConfig = {
        Type = "oneshot";
        User = "root";
      };
    };
  };
}

