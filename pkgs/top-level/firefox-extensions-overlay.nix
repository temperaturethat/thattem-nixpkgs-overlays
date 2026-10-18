baseDirectory:

packageListFile:

final: prev:

{

  firefoxAddons =
    prev.lib.pipe packageListFile [
      builtins.readFile
      (prev.lib.splitString "\n")
      (builtins.filter (line: line != ""))
      (map builtins.fromJSON)
      (map (import baseDirectory))
      (map (package: final.callPackage package { }))
      (map (addon: prev.lib.nameValuePair addon.pname addon))
      builtins.listToAttrs
    ]
    // (prev.firefoxAddons or { });
}
