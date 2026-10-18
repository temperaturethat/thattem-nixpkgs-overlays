{ lib, pkgs }:

final:

let

  inherit (final) callPackage;

in

lib.packagesFromDirectoryRecursive {
  inherit callPackage;
  directory = ./manual-packages;
}
// { }
