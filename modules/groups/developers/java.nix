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
        ];
      };
    };
  };
}
