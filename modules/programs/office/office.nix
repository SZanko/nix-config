{
  flake.modules.nixos.office = { inputs, ... }: {
    services.flatpak = {
      packages = [
        "org.libreoffice.LibreOffice"
        "org.gimp.GIMP"
        "org.inkscape.Inkscape"
        "eu.betterbird.Betterbird"
        "com.github.vladimiry.ElectronMail"

        "us.zoom.Zoom"
        "com.bitwarden.desktop"
        "com.rustdesk.RustDesk"
        "org.fedoraproject.MediaWriter"
        "com.github.jeromerobert.pdfarranger"
        "org.zotero.Zotero"

        "io.github.linx_systems.ClamUI"
      ];
    };
  };
}

