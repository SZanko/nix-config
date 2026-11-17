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
      python
      pentester
      arduino
      android
    ];

    #home-manager.users.stefan = {
    #  ###
    #};
  };
}
