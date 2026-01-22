{
  flake.modules.nixos.rust = { pkgs, ... }: {

    security.wrappers = {
      # Low-level unprivileged sandboxing tool, see <https://github.com/containers/bubblewrap>.
      bwrap = {
        owner = "root";
        group = "root";
        source = "${pkgs.bubblewrap}/bin/bwrap";
        setuid = true;
      };
    };

    users.groups.plugdev = {};

    services.udev.packages = [
      pkgs.unstable.probe-rs-tools
    ];


    environment.systemPackages = with pkgs; [
      rustup
      cargo-generate
      sccache
      avrdude
      avrdudess
      ravedude
      esptool
      espup
      espflash
      unstable.esp-generate
      unstable.probe-rs-tools
    ];

    services = {
      flatpak = {
        enable = true;

        packages = [
          "com.jetbrains.RustRover"
          "runtime/org.freedesktop.Sdk.Extension.llvm21/x86_64/25.08"
          "runtime/org.freedesktop.Sdk.Extension.mingw-w64/x86_64/25.08"
          "runtime/org.freedesktop.Sdk.Extension.rust-stable/x86_64/25.08"
        ];

        overrides = {
          "com.jetbrains.RustRover".Context = {
            filesystems = [
              "xdg-config/git:ro" # Expose user Git config
              "/run/current-system/sw/bin:ro" # Expose NixOS managed software
            ];

            sockets = [
              "gpg-agent" # Expose GPG agent
              "pcsc" # Expose smart cards (i.e. YubiKey)
            ];

            Environment = [
              "FLATPAK_ENABLE_SDK_EXT=mingw-w64,llvm21,rust-stable"
            ];
          };
        };
      };
    };
  };
}
