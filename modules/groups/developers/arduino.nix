{
  flake.modules.nixos.arduino = { inputs, pkgs, ... }: {
    environment.systemPackages = with pkgs; [
      arduino-cli
      arduino-mk
      arduino-ci
      arduino-ide
    ];
  };
}
