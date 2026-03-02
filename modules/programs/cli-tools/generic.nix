let
  genericPackages =
    { pkgs, ... }:
    {
      environment.systemPackages = with pkgs; [
        git
        git-lfs
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
        neovim
        difftastic
        bat
      ];

      programs = {
        direnv = {
          enable = true;
          enableZshIntegration = true;
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
