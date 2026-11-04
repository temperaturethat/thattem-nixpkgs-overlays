{
  # Basic
  lib,
  melpaBuild,
  fetchFromGitHub,
  # Emacs dependencies
  nerd-icons,
  # Other dependencies
  thattem-emacs-library,
}:

melpaBuild {

  pname = "thattem-tab-bar";
  version = "0-unstable-2026-11-05";

  src = fetchFromGitHub {
    owner = "thattemperature";
    repo = "thattem-tab-bar";
    rev = "06ad78d3a69164102822bcfbaf4745c4252f15b2";
    hash = "sha256-YE2Zv1M/Ja1123DRSYTSZPOSpz9eVZuvnWNzROMGMAU=";
  };

  packageRequires = [
    nerd-icons
  ];

  postPatch = ''
    substituteInPlace thattem-tab-bar-special-items.el \
      --replace-fail "(file-name-directory (locate-library \"thattem-tab-bar\"))" \
                     "\"${lib.getLib thattem-emacs-library}/lib/\""
  '';

  meta = {
    description = "Enhanced Emacs tab-bar with workspace management";
    homepage = "https://github.com/thattemperature/thattem-tab-bar";
    license = lib.licenses.gpl3;
    maintainers = with lib.maintainers; [
      thattemperature
    ];
  };

}
