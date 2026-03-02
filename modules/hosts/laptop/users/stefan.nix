{ inputs
, ...
}:
{
  flake.modules.nixos.laptop = {
    imports = with inputs.self.modules.nixos; [
      stefan
      rust
      dotnet-dev
    ];

    #home-manager.users.stefan = {
    #  ###
    #};
  };
}

