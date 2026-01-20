{ inputs
, ...
}:
{
  flake.modules.nixos.containers = { pkgs, ... }: {
    imports = [
      inputs.nix-flatpak.nixosModules.nix-flatpak
    ];

    virtualisation = {
      podman = {
        enable = true;
        #  dockerSocket.enable = true;
        #  # Create a `docker` alias for podman, to use it as a drop-in replacement
        #  dockerCompat = true;

        #  # Required for containers under podman-compose to be able to talk to each other.
        defaultNetwork.settings.dns_enabled = true;
      };

      docker = {
        enable = true;
        listenOptions = [
          "/run/docker.sock"
          "/var/run/docker.sock"
        ];
      };
    };

    environment.systemPackages = [ 
      pkgs.unstable.helmfile-wrapped
      pkgs.unstable.kubectl
      (pkgs.unstable.wrapHelm pkgs.unstable.kubernetes-helm {
        plugins = with pkgs.unstable.kubernetes-helmPlugins; [
          helm-secrets
          helm-diff
          helm-s3
          helm-git
        ];
      })
    ];

    services.flatpak = {
      enable = true;

      packages = [
        "io.podman_desktop.PodmanDesktop"
      ];
    };
  };
}

