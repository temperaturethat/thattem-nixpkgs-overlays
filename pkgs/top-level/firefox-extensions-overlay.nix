baseDirectory:

packageListFile:

self: super:

{

  firefoxAddons =
    super.lib.pipe packageListFile [
      builtins.readFile
      (super.lib.splitString "\n")
      (builtins.filter (line: line != ""))
      (map builtins.fromJSON)
      (map (import baseDirectory))
      (map (package: self.callPackage package { }))
      (map (addon: super.lib.nameValuePair addon.pname addon))
      builtins.listToAttrs
    ]
    // (super.firefoxAddons or { });
}
