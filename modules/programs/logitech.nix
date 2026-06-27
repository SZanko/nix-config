{ inputs
, ...
}: 
{
  flake.modules.nixos.logitech = { pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      solaar
      gnomeExtensions.solaar-extension
      logitech-udev-rules
    ];
  };
}
