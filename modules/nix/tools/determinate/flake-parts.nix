{ inputs
, ...
}:
{
  # Determinate Nix is Determinate Systems' validated and secure downstream distribution of NixOS/nix.
  # https://determinate.systems/nix/
  # https://docs.determinate.systems/guides/nix-darwin/

  flake-file.inputs = {
    # Determinate 3.* module
    determinate = {
      url = "https://flakehub.com/f/DeterminateSystems/determinate/*";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
}
