{
  flake.modules.nixos.security = { pkgs, ... }: {
    security = {
      sudo.enable = false; # use run0 instead
      tpm2 = {
        enable = true;
        pkcs11.enable = true;
        tctiEnvironment.enable = true;
      };
      chromiumSuidSandbox.enable = false; # use flatpak chromium instead
      unprivilegedUsernsClone = false;
      apparmor = {
        enable = true;
        enableCache = true;
      };
    };
  };
}
