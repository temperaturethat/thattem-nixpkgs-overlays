{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
}:

stdenvNoCC.mkDerivation {

  pname = "gnome-shell-extension-thattem-gnome-extension";
  version = "0-unstable-2026-07-31";

  src = fetchFromGitHub {
    owner = "thattemperature";
    repo = "thattem-gnome-extension";
    rev = "0dab7ebfa3cea903974d6da32cce603f24be65ed";
    hash = "sha256-kGYo5EfFeCcx/7LyQI5WLrXIbAfQD3H0UMc7s6pYQ9g=";
  };

  strictDeps = true;
  __structuredAttrs = true;

  installPhase = ''
    runHook preInstall

    DEST_DIR=$out/share/gnome-shell/extensions/thattem-gnome-extension@thattemperature
    install -D *.json -t $DEST_DIR/
    install -D *.xml -t $DEST_DIR/
    install -D *.js -t $DEST_DIR/

    runHook postInstall
  '';

  passthru = {
    extensionUuid = "thattem-gnome-extension@thattemperature";
    extensionPortalSlug = "thattem-gnome-extension";
  };

}
