baseDirectory:

final: prev:

let

  extensionRenames = { };

  mapReadableNames =
    extensionsList:
    prev.lib.trivial.pipe extensionsList [
      (prev.lib.filter (
        extension:
        !(
          (builtins.hasAttr extension.extensionUuid extensionRenames)
          && ((builtins.getAttr extension.extensionUuid extensionRenames) == null)
        )
      ))
      (map (
        extension:
        prev.lib.nameValuePair (extensionRenames.${extension.extensionUuid} or extension.extensionPortalSlug
        ) extension
      ))
      builtins.listToAttrs
    ];

in

{

  gnomeExtensions = prev.lib.trivial.pipe { } [
    (extensions: extensions // (import baseDirectory { inherit (final) callPackage; }))
    (prev.lib.attrValues)
    mapReadableNames
    (extensions: extensions // prev.gnomeExtensions)
  ];

}
