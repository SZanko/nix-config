{ inputs
, ...
}:
{
  flake.modules.nixos.desktop = {
    imports = with inputs.self.modules.nixos; [
      java
      stefan
    ];

    #home-manager.users.stefan = {
    #  ###
    #};
  };
}
