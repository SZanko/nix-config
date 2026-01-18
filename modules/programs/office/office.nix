{
  flake.modules.nixos.office = {

    services.flatpak = {
      enable = true;

      packages = [
        "org.libreoffice.LibreOffice"
        "org.gimp.GIMP"
        "org.inkscape.Inkscape"
        "eu.betterbird.Betterbird"

        "us.zoom.Zoom"
        "com.bitwarden.desktop"
        "com.rustdesk.RustDesk"
        "org.fedoraproject.MediaWriter"
        "com.github.jeromerobert.pdfarranger"
        "org.zotero.Zotero"
      ];
    };
  };
}

