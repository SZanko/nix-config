{ inputs
, ...
}:
{
  flake.modules.nixos.laptop = {
    imports = with inputs.self.modules.nixos; [
      stefan
    ];

    #home-manager.users.stefan = {
    #  ###
    #};
  };
}

