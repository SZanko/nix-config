{ inputs
, ...
}:
{
  flake.modules.nixos.laptop = {
    imports = with inputs.self.modules.nixos; [
      stefan
      rust
    ];

    #home-manager.users.stefan = {
    #  ###
    #};
  };
}

