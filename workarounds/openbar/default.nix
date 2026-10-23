# Workaround: GNOME 50 compatibility for openbar@neuromorph

final: prev:

{
  gnomeExtensions = prev.gnomeExtensions // {
    "open-bar" = prev.gnomeExtensions."open-bar".overrideAttrs {

      version = "50-unstable-2026-10-24";

      src = final.fetchFromGitHub {
        owner = "thattemperature-fork";
        repo = "openbar";
        rev = "c143f9b61f7536c8ac15fc5827d3e86f35fe5848";
        hash = "sha256-d9/DJTRUWSqlQ6MhGMRCOhoYApoMUYGQObbwejlIpe4=";
      };

      sourceRoot = "source/openbar@neuromorph";
    };
  };
}
