{
  flake.modules.nixos.nixstore-garbage-collection = {
    nix= {
      optimise = {
        automatic = true;
      };
      gc = {
        automatic = true;
        dates = "weekly";
        options = "--delete-older-than 30d";
        randomizedDelaySec = "45min";
      };
    };

  };

  flake.modules.darwin.nixstore-garbage-collection = {
    nix= {
      optimise = {
        automatic = true;
      };
      gc = {
        automatic = true;
        dates = "weekly";
        options = "--delete-older-than 30d";
        randomizedDelaySec = "45min";
      };
    };

  };
}
