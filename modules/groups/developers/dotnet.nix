{
  flake.modules.nixos.dotnet-dev = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      dotnet-sdk_10
      msbuild
    ];

    services = {
      flatpak = {
        enable = true;
        packages = [
          "com.jetbrains.IntelliJ-IDEA-Ultimate"
          "runtime/org.freedesktop.Sdk.Extension.dotnet10/x86_64/25.08"
          "runtime/org.freedesktop.Sdk.Extension.dotnet8/x86_64/25.08"
        ];
      };
    };
  };
}
