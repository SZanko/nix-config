{
  flake.modules.nixos.cli-tools =
    { pkgs
    , lib
    , ...
    }:
    {
      environment.systemPackages =
        with pkgs;
        [
          parted
          cryptsetup
          appimage-run
        ]
        #++ lib.optionals (pkgs.stdenv.hostPlatform.system == "x86_64-linux") [ intel-gpu-tools ]
        ;
    };
}
