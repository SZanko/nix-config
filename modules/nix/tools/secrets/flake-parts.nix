{ inputs
, ...
}:
{
  # age-encrypted secrets for NixOS / Darwin and Home Manager
  # https://github.com/Mic92/sops-nix

  flake-file.inputs = {
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
      #inputs.home-manager.follows = "home-manager";
    };
    secrets = {
      url = "path:./secrets";
      flake = false;
      # It's also possible to directly depend on a local Git repository.
      # git-directory-example.url = "git+file:/path/to/repo?shallow=1";
    };
  };
}
