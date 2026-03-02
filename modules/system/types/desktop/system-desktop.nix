{ inputs
, ...
}:
{
  # expansion of cli system for desktop use

  flake.modules.nixos.system-desktop = { pkgs, ... }: {

    imports = with inputs.self.modules.nixos; [
      system-cli
      browser
      printing
      gnome
      office
      pipewire
      fonts
      flatpak
      plymouth
      antivirus
    ];

    environment.systemPackages = with pkgs; [
      wl-clipboard
    ];

    zramSwap = {
      enable = true;
    };
    services = {
      openssh.enable = true;
      earlyoom = {
        enable = true;
        freeSwapThreshold = 5;
      };
      udev.extraRules = ''
      ACTION=="add", SUBSYSTEM=="usb", ATTR{idVendor}=="22d4", ATTR{idProduct}=="1503", TEST=="power/control", ATTR{power/control}="on"
      '';
    };
  };

  flake.modules.darwin.system-desktop = {
    imports = with inputs.self.modules.darwin; [
      system-cli
    ];
  };

  #flake.modules.homeManager.system-desktop = {
  #  imports = with inputs.self.modules.homeManager; [
  #    system-cli
  #    browser
  #    office
  #  ];
  #};
}
