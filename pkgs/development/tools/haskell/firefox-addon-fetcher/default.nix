{
  # Basic
  lib,
  mkDerivation,
  fetchFromGitHub,
  # Dependencies
  aeson,
  base,
  bytestring,
  containers,
  directory,
  filepath,
  http-client,
  http-conduit,
  network,
  tasty,
  tasty-hunit,
  tasty-quickcheck,
  temporary,
  text,
  time,
  transformers,
}:

mkDerivation {

  pname = "firefox-addon-fetcher";
  version = "0.1.0.0-unstable-2026-10-16";

  src = fetchFromGitHub {
    owner = "thattemperature";
    repo = "firefox-addon-fetcher";
    rev = "82b9cf66c46c998e7fb5476bf57fe46f37fb8cf7";
    hash = "sha256-uFDskMpJg8YyPL72NGvFAUx0L2sC2tfbVQK5RzK/JSU=";
  };

  isLibrary = true;
  isExecutable = true;
  enableSeparateDataOutput = true;

  libraryHaskellDepends = [
    aeson
    base
    bytestring
    containers
    directory
    filepath
    http-client
    http-conduit
    text
    time
    transformers
  ];

  executableHaskellDepends = [
    aeson
    base
    text
  ];

  testHaskellDepends = [
    aeson
    base
    bytestring
    directory
    filepath
    http-client
    network
    tasty
    tasty-hunit
    tasty-quickcheck
    temporary
    text
    time
  ];

  homepage = "https://github.com/thattemperature/firefox-addon-fetcher";
  description = "Generate Firefox extension metadata as JSON Lines";
  license = lib.licenses.gpl3Only;
  mainProgram = "addon-fetcher";
}
