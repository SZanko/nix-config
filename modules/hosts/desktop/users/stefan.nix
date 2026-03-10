{ inputs
, ...
}:
{
  flake.modules.nixos.desktop = {
    imports = with inputs.self.modules.nixos; [
      rust
      stefan
      guest
      dotnet-dev
      pentester
    ];

    #home-manager.users.stefan = {
    #  ###
    #};
  };
}
