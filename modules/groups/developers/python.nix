{
  flake.modules.nixos.python = { pkgs, ... }: {
    
    services = {
      flatpak = {
        enable = true;

        packages = [
          "com.jetbrains.PyCharm-Community"

          "runtime/org.freedesktop.Sdk.Extension.node24/x86_64/26.08"
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
