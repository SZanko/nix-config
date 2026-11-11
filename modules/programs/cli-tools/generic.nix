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
        direnv
        pulsemixer
        unstable.neovim
        difftastic
        bat
      ];

      programs = {
        direnv = {
          enable = true;
          enableZshIntegration = true;
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
