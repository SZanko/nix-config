{ pkgs
, ...
}:
{

  flake.modules.nixos.zsh = { pkgs, ...}:
    {
      environment.shells = with pkgs; [ zsh dash ];
      users.defaultUserShell = pkgs.zsh;
      programs.zsh = {
        enable = true;
        autosuggestions.enable = true;
        enableBashCompletion = true;
        enableCompletion = true;
        autosuggestions.async = true;
        syntaxHighlighting.enable = true;
      };
    };

  flake.modules.darwin.zsh = {
    environment.shells = with pkgs; [ zsh dash ];
  };
}
