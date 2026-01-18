{ inputs
, ...
}:
{
  flake.modules.nixos.browser = {
    imports = [
      inputs.nix-flatpak.nixosModules.nix-flatpak
    ];

    services.flatpak = {
      enable = true;

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
