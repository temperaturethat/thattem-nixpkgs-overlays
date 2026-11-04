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
  version = "0-unstable-2026-11-06";

  src = fetchFromGitHub {
    owner = "thattemperature";
    repo = "thattem-tab-bar";
    rev = "453584270389a72d1a2da770c11d137ba5322d81";
    hash = "sha256-lOUjVSCGwgD4BSZrrfE4spJG1rs69gzY54/hhACWfbs=";
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
