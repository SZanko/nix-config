{ inputs, ... }:
{
  flake.modules.nixos.esp-idf = { pkgs, lib, ... }:
  let
    esp-dev = inputs.nixpkgs-esp-dev.packages.${pkgs.stdenv.hostPlatform.system};
  in
  {
    nixpkgs.config.permittedInsecurePackages = [
      "python3.13-ecdsa-0.19.2"
    ];

    environment.systemPackages = with pkgs; [
      esp-dev.esp-idf-full
      esptool
      minicom
    ];

    # USB-serial adapters used by ESP dev boards (CH340, CP2102, FTDI)
    services.udev.extraRules = ''
      SUBSYSTEM=="tty", ATTRS{idVendor}=="1a86", ATTRS{idProduct}=="7523", MODE="0666", GROUP="dialout"
      SUBSYSTEM=="tty", ATTRS{idVendor}=="10c4", ATTRS{idProduct}=="ea60", MODE="0666", GROUP="dialout"
      SUBSYSTEM=="tty", ATTRS{idVendor}=="0403", ATTRS{idProduct}=="6001", MODE="0666", GROUP="dialout"
    '';

    users.groups.dialout = {};

    services.flatpak = {
      packages = [
        "com.jetbrains.CLion"
      ];

      overrides = {
        "com.jetbrains.CLion".Context = {
          filesystems = [
            "xdg-config/git:ro"
            "/run/current-system/sw/bin:ro"
          ];

          sockets = [
            "gpg-agent"
          ];
        };
      };
    };
  };
}
