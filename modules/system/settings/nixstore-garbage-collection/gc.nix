{
  flake.modules.nixos.nixstore-garbage-collection = {
    nix.gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
      randomizedDelaySec = "45min";
    };
  };
}
