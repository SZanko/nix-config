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


    services = {
      flatpak = {
        packages = [
          "io.github.spacingbat3.webcord"
        ];
      };
    };

    #home-manager.users.stefan = {
    #  ###
    #};
  };
}

