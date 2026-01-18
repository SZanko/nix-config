{ config
, pkgs
, inputs
, lib
, outputs
, ... 
}:
{
  flake.modules.nixos.desktop = {
    imports = [
      inputs.disko.nixosModules.default
    ];
    disko.devices = {
      disk = {
        root = {
          type = "disk";
          device = "/dev/disk/by-id/ata-CT1000MX500SSD1_1849E1DC6587"; # current drive
          content = {
            type = "gpt";
            partitions = {
              ESP = {
                size = "512M";
                type = "EF00";
                content = {
                  type = "filesystem";
                  format = "vfat";
                  mountpoint = "/boot";
                  mountOptions = [ "umask=0077" ];
                };
              };
              luksRoot = {
                size = "100%";
                content = {
                  type = "luks";
                  name = "cryptedRoot";
                  # disable settings.keyFile if you want to use interactive password entry
                  #passwordFile = "/tmp/secret.key"; # Interactive
                  settings = {
                    allowDiscards = true;
                    #keyFile = "/tmp/secret.key";
                  };
                  #additionalKeyFiles = [ "/tmp/additionalSecret.key" ];
                  content = {
                    type = "btrfs";
                    extraArgs = [ "-f" ];
                    subvolumes = {
                      "/root" = {
                        mountpoint = "/";
                        mountOptions = [ "compress=zstd" "noatime" ];
                      };
                      #"/home" = {
                      #  mountpoint = "/home";
                      #  mountOptions = [ "compress=zstd" "noatime" ];
                      #};
                      "/nix" = {
                        mountpoint = "/nix";
                        mountOptions = [ "compress=zstd" "noatime" ];
                      };
                      "/swap" = {
                        mountpoint = "/.swapvol";
                        swap.swapfile.size = "20G";
                      };
                    };
                  };
                };
              };
            };
          };
        };
        home = {
          device = "/dev/disk/by-id/nvme-Samsung_SSD_990_PRO_with_Heatsink_4TB_S7HRNJ0X103291H";
          type = "disk";
          content = {
            type = "gpt";
            partitions = {
              home =  {
                size = "100%";
                content = {
                  type = "luks";
                  name = "cryptedHome";
                  # disable settings.keyFile if you want to use interactive password entry
                  #passwordFile = "/tmp/secret.key"; # Interactive
                  settings = {
                    allowDiscards = true;
                    #keyFile = "/tmp/secret.key";
                  };
                  #additionalKeyFiles = [ "/tmp/additionalSecretHome.key" ];
                  content = {
                    type = "btrfs";
                    extraArgs = [ "-f" ];
                    subvolumes = {
                      "/home" = {
                        mountpoint = "/home";
                        mountOptions = [ "compress=zstd" "noatime" ];
                      };
                    };
                  };
                };
              };
            };
          };
        };
        #gamesSSHD = {
        #  device = "/dev/disk/by-id/";
        #  type = "disk";
        #  content = {
        #    type = "gpt";
        #    partitions = {
        #      home =  {
        #        size = "100%";
        #        content = {
        #          type = "ntfs";
        #          name = "gamesSSHD";
        #          format = "ntfs";
        #          mountpoint = "/mnt/gamesSSHD";
        #          mountOptions = [ 
        #            ""
        #          ];
        #        };
        #      };
        #    };
        #  };
        #};
      };
    };
  };
}
