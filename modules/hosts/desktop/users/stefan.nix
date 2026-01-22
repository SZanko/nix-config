{ inputs
, ...
}:
{
  flake.modules.nixos.desktop = {
    imports = with inputs.self.modules.nixos; [
      rust
      stefan
    ];

    #home-manager.users.stefan = {
    #  ###
    #};
  };
}
