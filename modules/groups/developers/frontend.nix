{
  flake.modules.nixos.frontend = { inputs, pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      bun
      nodejs_latest
      deno
      prettier
      esbuild
    ];

    services = {
      flatpak = {
        packages = [
          "com.visualstudio.code"
          # TODO make architecture indepentend 
          "com.visualstudio.code.tool.podman/x86_64/25.08"
          #"com.visualstudio.code.tool.git-lfs/x86_64/23.08"
          "runtime/org.freedesktop.Sdk.Extension.node24/x86_64/25.08"
        ];

        overrides = {
          "com.visualstudio.code".Context = {
            filesystems = [
              "xdg-config/git:ro" # Expose user Git config
              "/run/current-system/sw/bin:ro" # Expose NixOS managed software
            ];
            sockets = [
              "gpg-agent" # Expose GPG agent
              "pcsc" # Expose smart cards (i.e. YubiKey)
            ];

            Environment = [
              "FLATPAK_ENABLE_SDK_EXT=node24"
            ];
          };
        };
      };
    };
  };
}
