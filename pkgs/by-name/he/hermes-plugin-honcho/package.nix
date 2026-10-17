{
  lib,
  stdenvNoCC,
  fetchFromGitHub,
}:

stdenvNoCC.mkDerivation rec {

  pname = "hermes-plugin-honcho";
  version = "3.2.2";

  src = fetchFromGitHub {
    owner = "plastic-labs";
    repo = "honcho";
    rev = "v${version}";
    hash = "sha256-g7RO8gMNZYSoEyw4Py+ORB/PYibwTIonHghmSO7Ms3c=";
  };

  strictDeps = true;
  __structuredAttrs = true;

  sourceRoot = "source/hermes-plugin-honcho";

  installPhase = ''
    runHook preInstall

    mkdir -p $out
    cp -r . "$out"/

    runHook postInstall
  '';

  meta = with lib; {
    description = "Honcho AI-native memory provider plugin for Hermes Agent";
    homepage = "https://github.com/plastic-labs/honcho";
    license = licenses.mit;
  };

}
