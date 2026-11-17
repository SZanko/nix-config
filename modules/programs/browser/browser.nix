{ inputs
, ...
}:
{
  flake.modules.nixos.browser = { pkgs, ... }: {

    programs = {
      firefox = {
        enable = true;
        languagePacks = [
          "en-GB"
          "de"
          "sv-SE"
        ];
      };

      chromium = {
        enable = true;
      };
    };


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
