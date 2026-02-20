# DO-NOT-EDIT. This file was auto-generated using github:vic/flake-file.
# Use `nix run .#write-flake` to regenerate it.
{

  outputs = inputs: inputs.flake-parts.lib.mkFlake { inherit inputs; } (inputs.import-tree ./modules);

  inputs = {
    authentik-nix = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:nix-community/authentik-nix";
    };
    brew-api = {
      flake = false;
      url = "github:BatteredBunny/brew-api";
    };
    brew-nix = {
      inputs = {
        brew-api.follows = "brew-api";
        nix-darwin.follows = "nix-darwin";
        nixpkgs.follows = "nixpkgs";
      };
      url = "github:BatteredBunny/brew-nix";
    };
    determinate = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "https://flakehub.com/f/DeterminateSystems/determinate/*";
    };
    disko = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:nix-community/disko";
    };
    firefox-addons.url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
    flake-file.url = "github:vic/flake-file";
    flake-parts.url = "github:hercules-ci/flake-parts";
    hyprland.url = "github:hyprwm/Hyprland";
    impermanence.url = "github:nix-community/impermanence";
    import-tree.url = "github:vic/import-tree";
    nix-alien = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:thiagokokada/nix-alien";
    };
    nix-darwin = {
      inputs.nixpkgs.follows = "nixpkgs-darwin";
      url = "github:LnL7/nix-darwin/nix-darwin-25.11";
    };
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";
    nix-minecraft.url = "github:Infinidoge/nix-minecraft";
    nixos-wsl = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:nix-community/NixOS-WSL/main";
    };
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    nixpkgs-darwin.url = "github:nixos/nixpkgs/nixpkgs-25.11-darwin";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nur = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:nix-community/NUR";
    };
    nvidia-patch = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:icewind1991/nvidia-patch-nixos";
    };
    secrets = {
      flake = false;
      url = "path:./secrets";
    };
    sops-nix = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:Mic92/sops-nix";
    };
    winapps = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:winapps-org/winapps";
    };
  };

}
