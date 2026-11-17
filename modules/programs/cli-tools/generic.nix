let
  genericPackages =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        github-cli
        ncdu
        tmux
        tree
        usbutils
        pciutils
        htop
        wget
        curl
        inetutils
        unzip
        fd
        ripgrep-all
        ripgrep
        yazi
        pulsemixer
        difftastic
        bat
      ];

      programs = {
        neovim = {
          enable = true;
          #package = pkgs.unstable.neovim;
          defaultEditor = true;
          viAlias = true;
          vimAlias = true;
          withPython3 = true;
          withNodeJs = true;
        };

        direnv = {
          enable = true;
          enableZshIntegration = true;
          enableBashIntegration = true;
          enableFishIntegration = true;
          angrr = {
            enable = true;
          };
          nix-direnv = {
            enable = true;
          };
        };

        git = {
          enable = true;
          lfs = {
            enable = true;
          };
          config = {
              init = {
                defaultBranch = "master";
              };
              url = {
                "https://github.com/" = {
                  insteadOf = [
                    "gh:"
                    "github:"
                  ];
                };
              };
          };

        };
        git-worktree-switcher = {
          enable = true;
        };
      };
    };
in
  {
  flake.modules.nixos.cli-tools = {
    imports = [
      genericPackages
    ];
  };

  flake.modules.darwin.cli-tools = {
    imports = [
      genericPackages
    ];
  };
}
