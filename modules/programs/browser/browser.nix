{ inputs
, ...
}:
{
  flake.modules.nixos.browser = { pkgs, ... }: {
    environment.systemPackages = with pkgs.unstable; [
      firefox
      #brave
      chromium
    ];

    services.flatpak = {
      packages = [
      # https://librewolf.net/installation/linux/#security
      #  "org.mozilla.firefox"
      #  "io.gitlab.librewolf-community"
        "com.brave.Browser"
      #  "io.github.ungoogled_software.ungoogled_chromium"
      #  "org.chromium.Chromium"
      ];
    };
  };
}
