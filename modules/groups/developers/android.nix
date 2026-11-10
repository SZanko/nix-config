{
  flake.modules.nixos.android = { inputs, pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      android-tools
      unstable.flutter
      unstable.android-studio
    ];

    nixpkgs.config = {
      android_sdk.accept_license = true;
    };

    systemd.tmpfiles.rules = [
      "L+ /opt/flutter - - - - ${pkgs.flutter}"
    ];

    services = {
      flatpak = {
        enable = true;

        packages = [
          "com.google.AndroidStudio"
          "runtime/org.freedesktop.Sdk.Extension.llvm22/x86_64/26.08"
          "runtime/org.freedesktop.Sdk.Extension.openjdk25/x86_64/26.08"
          "runtime/org.freedesktop.Sdk.Extension.openjdk21/x86_64/26.08"
          "runtime/org.freedesktop.Sdk.Extension.openjdk17/x86_64/26.08"
          "runtime/org.freedesktop.Sdk.Extension.openjdk11/x86_64/26.08"
          "runtime/org.freedesktop.Sdk.Extension.openjdk8/x86_64/26.08"
          "runtime/org.freedesktop.Sdk.Extension.node24/x86_64/26.08"

          "runtime/org.freedesktop.Sdk.Extension.node24/x86_64/25.08"
          "runtime/org.freedesktop.Sdk.Extension.openjdk25/x86_64/25.08"
          "runtime/org.freedesktop.Sdk.Extension.openjdk21/x86_64/25.08"
          "runtime/org.freedesktop.Sdk.Extension.openjdk17/x86_64/25.08"
          "runtime/org.freedesktop.Sdk.Extension.openjdk11/x86_64/25.08"
          "runtime/org.freedesktop.Sdk.Extension.openjdk8/x86_64/25.08"

          "runtime/org.freedesktop.Sdk.Extension.node24/x86_64/25.08"
        ];

        overrides = {
          "com.google.AndroidStudio".Context = {
            filesystems = [
              "xdg-config/git:ro" # Expose user Git config
              "/run/current-system/sw/bin:ro" # Expose NixOS managed software
            ];

            sockets = [
              "gpg-agent" # Expose GPG agent
              "pcsc" # Expose smart cards (i.e. YubiKey)
            ];

            Environment = [
              "FLATPAK_ENABLE_SDK_EXT=openjdk25,openjdk21,openjdk17,node24"
            ];
          };
        };

      };
    };

  };
}
