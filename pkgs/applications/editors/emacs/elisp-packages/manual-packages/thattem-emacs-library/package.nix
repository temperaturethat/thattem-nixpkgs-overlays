{
  # Basic
  lib,
  stdenv,
  fetchFromGitHub,
  # Build system
  cmake,
  pkg-config,
  # Dependencies
  emacs,
  libgtop,
  libsysprof-capture,
  pcre2,
}:

stdenv.mkDerivation {

  pname = "thattem-emacs-library";
  version = "0-unstable-2026-09-21";

  src = fetchFromGitHub {
    owner = "thattemperature";
    repo = "thattem-emacs-library";
    rev = "4e85cc2c014f9e580fe5663b6a7f770cf2e225a0";
    hash = "sha256-vO7SNSLU9P6cbM198jynOzuTZarpXojAahWkS7AbTZQ=";
  };

  strictDeps = true;
  __structuredAttrs = true;

  nativeBuildInputs = [
    cmake
    pkg-config
  ];

  buildInputs = [
    emacs
    libgtop
    libsysprof-capture
    pcre2
  ];

  meta = {
    description = "Native C library for thattemperature's Emacs helper functions";
    homepage = "https://github.com/thattemperature/thattem-emacs-library";
    license = lib.licenses.gpl3;
    maintainers = with lib.maintainers; [
      thattemperature
    ];
  };

}
