{
  guid,
  slug,
  version,
  url,
  hash,
  permissions,
  license,
}:

{
  lib,
  stdenvNoCC,
  fetchurl,
  ...
}:

stdenvNoCC.mkDerivation {

  pname = slug;
  inherit version;

  src = fetchurl {
    inherit url;
    sha256 = hash;
  };

  strictDeps = true;
  __structuredAttrs = true;

  dontUnpack = true;

  addonId = guid;
  installPhase = ''
    runHook preInstall

    FIREFOX_ID="{ec8030f7-c20a-464f-9b0e-13a3a9e97384}"
    DEST_DIR=$out/share/mozilla/extensions/$FIREFOX_ID
    install -D "$src" "$DEST_DIR/$addonId.xpi"

    runHook postInstall
  '';

  meta = {
    description = "Firefox extension ${slug}";
    homepage = "https://addons.mozilla.org/firefox/addon/${slug}/";
    mozPermissions = permissions;

    license =
      let
        licenseMap = with lib.licenses; {
          "CC-BY-3.0" = cc-by-30;
          "MIT" = mit;
          "CC-BY-NC-ND-3.0" = cc-by-nc-nd-30;
          "cc-all-rights-reserved" = unfreeRedistributable;
          "CC-BY-SA-3.0" = cc-by-sa-30;
          "MPL-2.0" = mpl20;
          "CC-BY-NC-SA-3.0" = cc-by-nc-sa-30;
          "GPL-3.0-only" = gpl3Only;
          "BSD-2-Clause" = bsd2;
          "all-rights-reserved" = unfree;
          "CC-BY-NC-3.0" = cc-by-nc-30;
          "LGPL-3.0-only" = lgpl3Only;
          "CC-BY-ND-3.0" = cc-by-nd-30;
          "CC-BY-4.0" = cc-by-40;
          "CC-BY-NC-SA-4.0" = cc-by-nc-sa-40;
          "GPL-2.0-only" = gpl2Only;
          "CC-BY-NC-ND-4.0" = cc-by-nc-nd-40;
          "Apache-2.0" = asl20;
          "CC-BY-NC-4.0" = cc-by-nc-40;
          "MPL-1.1" = mpl11;
          "Unlicense" = unlicense;
          "CC-BY-SA-4.0" = cc-by-sa-40;
          "AGPL-3.0-only" = agpl3Only;
          "LGPL-2.1-only" = lgpl21Only;
          "ISC" = isc;
        };
      in
      if license == null then lib.licenses.unfree else licenseMap."${license}" or lib.licenses.unfree;
  };

}
