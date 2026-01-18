{
  flake.modules.nixos.multimedia = {

    services.flatpak = {
      enable = true;

      packages = [
        "com.stremio.Stremio"
        "org.signal.Signal"
        "com.ktechpit.whatsie"
        "im.riot.Riot"
      ];

      overrides = {
        "org.signal.Signal".Context = {
          Environment = [
            "SIGNAL_PASSWORD_STORE=gnome-libsecret"
            # TODO flatpak override --env=SIGNAL_PASSWORD_STORE=gnome-libsecret org.signal.Signal
          ];
        };
      };
    };
  };
}


