{ inputs
, ...
}:
{
  # Experimental nix expression to package all MacOS casks from homebrew automatically
  # https://github.com/BatteredBunny/brew-nix

  flake-file.inputs = {
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
}

