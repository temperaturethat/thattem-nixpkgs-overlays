{
  # Basic
  lib,
  melpaBuild,
  fetchFromGitHub,
  # Dependencies
  flymake,
  nerd-icons,
  projectile,
}:

melpaBuild {

  pname = "thattem-mode-line";
  version = "0-unstable-2026-10-28";

  src = fetchFromGitHub {
    owner = "thattemperature";
    repo = "thattem-mode-line";
    rev = "4bf04de861a4cc3a55353b58e7fbfc755ae07c50";
    hash = "sha256-lBoD+x38mwEc57PkzSr80FXIep/4umd0bfTqHj+f1Ms=";
  };

  packageRequires = [
    flymake
    nerd-icons
    projectile
  ];

  meta = {
    description = "Custom Emacs mode-line with project-aware segments and nerd-icons";
    homepage = "https://github.com/thattemperature/thattem-mode-line";
    license = lib.licenses.gpl3;
    maintainers = with lib.maintainers; [
      thattemperature
    ];
  };

}
