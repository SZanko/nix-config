{ inputs
, ...
}:
{
  flake.modules.nixos.radicle = { pkgs, ... }: {
    services.radicle = {
      enable = true;
      httpd.listenPort = 9053;
      ci = {
        broker = {
          enable = true;
        };
      };
    };

    environment.systemPackages = with pkgs; [
      radicle-tui
      radicle-desktop
      radicle-node
    ];
  };
}
