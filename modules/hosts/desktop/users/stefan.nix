{ inputs
, ...
}:
{
  flake.modules.nixos.desktop = {
    imports = with inputs.self.modules.nixos; [
      stefan
    ];

    #home-manager.users.stefan = {
    #  ###
    #};
  };
}
