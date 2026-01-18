{ config, lib, pkgs, modulesPath, ... }:

{

  flake.modules.nixos.linux-desktop = {
    nixpkgs.hostPlatform = "x86_64-linux";
    hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  imports =
    [ 
      (modulesPath + "/installer/scan/not-detected.nix")
    ];

    boot.initrd.availableKernelModules = [ "xhci_pci" "ahci" "uas" "usbhid" "usb_storage" "sd_mod" ];
    boot.initrd.kernelModules = [ ];
    boot.kernelModules = [ "kvm-amd" ];
    boot.extraModulePackages = [ ];
  
    fileSystems."/home".neededForBoot = true;

    networking.useDHCP = lib.mkDefault true;
  };
}
