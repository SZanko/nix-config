{ config
, pkgs
, lib
, ...
}:
{
  flake.modules.nixos.fail2ban = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      fail2ban
    ];

    environment.etc = {
      # Define an action that will trigger a Ntfy push notification upon the issue of every new ban
      "fail2ban/action.d/ntfy.local".text = pkgs.lib.mkDefault (pkgs.lib.mkAfter ''
      [Definition]
      norestored = true # Needed to avoid receiving a new notification after every restart
      actionban = curl -H "Title: <ip> has been banned" -d "<name> jail has banned <ip> from accessing $(hostname) after <failures> attempts of hacking the system." https://ntfy.sh/Fail2banNotifications
      '');
      # Defines a filter that detects URL probing by reading the Nginx access log
      "fail2ban/filter.d/nginx-url-probe.local".text = pkgs.lib.mkDefault (pkgs.lib.mkAfter ''
      [Definition]
      failregex = ^<HOST>.*(GET /(wp-|admin|boaform|phpmyadmin|\.env|\.git)|\.(dll|so|cfm|asp)|(\?|&)(=PHPB8B5F2A0-3C92-11d3-A3A9-4C7B08C10000|=PHPE9568F36-D428-11d2-A769-00AA001ACF42|=PHPE9568F35-D428-11d2-A769-00AA001ACF42|=PHPE9568F34-D428-11d2-A769-00AA001ACF42)|\\x[0-9a-zA-Z]{2})
      '');

      # Filter
      # https://www.redlib.szanko.xyz/r/selfhosted/comments/1jys0tn/suffering_from_amazon_google_facebook_crawl_bots/
      "fail2ban/filter.d/anubis-redlib.conf".text = pkgs.lib.mkDefault (pkgs.lib.mkAfter ''
      [Definition]
      failregex = ^.*anubis\[\d+\]: .*"msg":"explicit deny".*"x-forwarded-for":"<HOST>"

      # Only look for logs with explicit deny and x-forwarded-for IPs
      journalmatch = _SYSTEMD_UNIT=anubis-redlib.service

      datepattern = %%Y-%%m-%%dT%%H:%%M:%%S
      '');
    };

    services.fail2ban = {
      enable = true;
      bantime-increment = {
        enable = true;
      };
      jails = {
        anubis-redlib = {
          settings = {
            backend = "systemd";
            logencoding = "utf-8";
            filter = "anubis-redlib";
            action = "iptables[type=allports]";
            bantime = 2592000;
            findtime = 43200;
            maxretry = 1;
          };
        };
      };
    };
  };
}

