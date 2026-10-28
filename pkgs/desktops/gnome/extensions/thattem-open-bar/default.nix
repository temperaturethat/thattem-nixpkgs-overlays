{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
  glib,
}:

stdenvNoCC.mkDerivation {
  pname = "gnome-shell-extension-thattem-open-bar";
  version = "42-unstable-2026-10-24";

  src = fetchFromGitHub {
    owner = "thattemperature-fork";
    repo = "openbar";
    rev = "c143f9b61f7536c8ac15fc5827d3e86f35fe5848";
    hash = "sha256-d9/DJTRUWSqlQ6MhGMRCOhoYApoMUYGQObbwejlIpe4=";
  };

  sourceRoot = "source/openbar@neuromorph";

  strictDeps = true;
  __structuredAttrs = true;

  nativeBuildInputs = [ glib ];

  buildPhase = ''
    runHook preBuild

    glib-compile-schemas --strict schemas

    runHook postBuild
  '';

  installPhase = ''
    runHook preInstall

    mkdir -p "$out/share/gnome-shell/extensions"
    cp -r -T . "$out/share/gnome-shell/extensions/openbar@neuromorph"

    runHook postInstall
  '';

  passthru = {
    extensionUuid = "openbar@neuromorph";
    extensionPortalSlug = "thattem-open-bar";
  };

  meta = {
    description = "Open Bar fork with GNOME Shell 50 support and styling fixes";
    homepage = "https://github.com/thattemperature-fork/openbar";
    license = lib.licenses.gpl2Plus;
    platforms = lib.platforms.linux;
  };
}
