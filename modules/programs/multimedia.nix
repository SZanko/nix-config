{
  flake.modules.nixos.multimedia = { inputs, ... }: {

    services.flatpak = {
      packages = [
        "com.stremio.Stremio"
        "org.signal.Signal"
        "io.github.tobagin.karere"
        "im.riot.Riot"
        "app.grayjay.Grayjay"
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


