{ inputs
, ...
}:
{
  flake.modules.nixos.nur = {
    imports = [
      inputs.nur.modules.nixos.default
    ];
  };

  flake.modules.darwin.nur = {
    imports = [
      inputs.nur.modules.darwin.default
    ];
  };
}
