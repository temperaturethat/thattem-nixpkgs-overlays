{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
}:

stdenvNoCC.mkDerivation {

  pname = "rime-thattem-pinyin";
  version = "0-unstable-2026-07-06";

  src = fetchFromGitHub {
    owner = "thattemperature";
    repo = "rime-thattem-pinyin";
    rev = "4af6584c34b147f227fd3fe28c7a95baabcae96a";
    hash = "sha256-vX5w26m0AI01NfrZdwr96TrIT0uIMTvM3t3eRM6YbOM=";
  };

  strictDeps = true;
  __structuredAttrs = true;

  installPhase = ''
    runHook preInstall

    install -D *.yaml -t $out/share/rime-data/
    install -D dicts/basic/*.yaml -t $out/share/rime-data/dicts/basic/
    install -D dicts/japanese/*.yaml -t $out/share/rime-data/dicts/japanese/

    runHook postInstall
  '';

  meta = {
    description = "Thattemperature's Rime Pinyin input schema and dictionaries";
    homepage = "https://github.com/thattemperature/rime-thattem-pinyin";
    license = lib.licenses.gpl3;
    maintainers = with lib.maintainers; [
      thattemperature
    ];
  };

}
