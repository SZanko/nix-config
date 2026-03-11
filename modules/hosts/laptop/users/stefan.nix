{ inputs
, ...
}:
{
  flake.modules.nixos.laptop = {
    imports = with inputs.self.modules.nixos; [
      stefan
      rust
      dotnet-dev
      arduino
    ];

    #home-manager.users.stefan = {
    #  ###
    #};
  };
}

