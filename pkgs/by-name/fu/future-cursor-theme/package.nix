{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
}:

stdenvNoCC.mkDerivation {

  pname = "future-cursor-theme";
  version = "0-unstable-2021-07-16";

  src = fetchFromGitHub {
    owner = "yeyushengfan258";
    repo = "Future-cursors";
    rev = "587c14d2f5bd2dc34095a4efbb1a729eb72a1d36";
    hash = "sha256-ziEgMasNVhfzqeURjYJK1l5BeIHk8GK6C4ONHQR7FyY=";
  };

  strictDeps = true;
  __structuredAttrs = true;

  installPhase = ''
    runHook preInstall

    DEST_DIR=$out/share/icons/Future-cursors
    install -D dist/index.theme -t $DEST_DIR/
    install -D dist/cursors/* -t $DEST_DIR/cursors/

    runHook postInstall
  '';

  meta = {
    description = "Cursor theme inspired by macOS and based on capitaine-cursors";
    homepage = "https://github.com/yeyushengfan258/Future-cursors";
    license = lib.licenses.gpl3;
    maintainers = with lib.maintainers; [
      thattemperature
    ];
  };

}
