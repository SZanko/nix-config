{ inputs
, ...
}:
{
  flake.modules.nixos.desktop = {
    imports = with inputs.self.modules.nixos; [
      rust
      stefan
      guest
    ];

    #home-manager.users.stefan = {
    #  ###
    #};
  };
}
