{ inputs
, ...
}:
{
  flake.modules.nixos.browser = {
    services.flatpak = {
      packages = [
        "org.mozilla.firefox"
        "io.gitlab.librewolf-community"
        "com.brave.Browser"
        "io.github.ungoogled_software.ungoogled_chromium"
        "org.chromium.Chromium"
      ];
    };
  };
}
