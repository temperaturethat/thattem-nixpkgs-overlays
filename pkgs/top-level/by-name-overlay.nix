baseDirectory:

final: prev:

let

  namesForShard =
    shard: type:
    if type != "directory" then
      { }
    else
      prev.lib.mapAttrs (name: _: baseDirectory + "/${shard}/${name}/package.nix") (
        builtins.readDir (baseDirectory + "/${shard}")
      );

  packageFiles = prev.lib.mergeAttrsList (
    prev.lib.mapAttrsToList namesForShard (builtins.readDir baseDirectory)
  );

in

prev.lib.mapAttrs (
  name: file: if builtins.hasAttr name prev then prev."${name}" else final.callPackage file { }
) packageFiles
