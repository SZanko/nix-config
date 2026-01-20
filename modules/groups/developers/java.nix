{
  flake.modules.nixos.java = { pkgs, ... }: {
    programs.java = {
      enable = true;
      package = pkgs.jdk;
      binfmt = true;
    };

    environment.systemPackages = with pkgs; [
      gradle
      maven
    ];

    services = {
      flatpak = {
        enable = true;

        packages = [
          "com.jetbrains.IntelliJ-IDEA-Ultimate"
          "runtime/org.freedesktop.Sdk.Extension.openjdk25/x86_64/25.08"
          "runtime/org.freedesktop.Sdk.Extension.openjdk21/x86_64/25.08"
          "runtime/org.freedesktop.Sdk.Extension.openjdk17/x86_64/25.08"
          "runtime/org.freedesktop.Sdk.Extension.openjdk11/x86_64/25.08"
          "runtime/org.freedesktop.Sdk.Extension.openjdk8/x86_64/25.08"

          "runtime/org.freedesktop.Sdk.Extension.node24/x86_64/25.08"
        ];

        overrides = {
          "com.jetbrains.IntelliJ-IDEA-Ultimate".Context = {
            filesystems = [
              "xdg-config/git:ro" # Expose user Git config
              "/run/current-system/sw/bin:ro" # Expose NixOS managed software
            ];

            sockets = [
              "gpg-agent" # Expose GPG agent
              "pcsc" # Expose smart cards (i.e. YubiKey)
            ];

            Environment = [
              "FLATPAK_ENABLE_SDK_EXT=openjdk25,node24"
            ];
          };
        };
      };
    };
  };
}
