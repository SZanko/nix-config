{ inputs
, ...
}:
{
  flake.modules.nixos.vmSetup = { inputs, pkgs, ... }: {
    #virtualisation = {
    #  spiceUSBRedirection.enable = true;

    #  libvirtd = {
    #    enable = true;
    #    qemu = {
    #      package = pkgs.qemu_kvm;
    #      runAsRoot = true;
    #      swtpm.enable = true;
    #    };
    #  };
    #};

    services = {
      qemuGuest.enable = true;
      spice-vdagentd.enable = true;
    };
  };

  flake.modules.nixos.vmSetup-desktop = { inputs, pkgs, ... }: {
    services.flatpak = {
      packages = [
        "org.virt_manager.virt-manager"
        "org.gnome.Boxes"
      ];
    };
  };
}
