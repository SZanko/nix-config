{
  flake.modules.nixos.appimage = { pkgs, ... }: {
    programs.appimage = {
      enable = true;
      binfmt = true;

      package = pkgs.appimage-run.override {
        extraPkgs = pkgs: with pkgs; [ 
          ffmpeg 
          imagemagick 
          fribidi
          libx11
          fontconfig
        ];
      };
    };
  };
}
