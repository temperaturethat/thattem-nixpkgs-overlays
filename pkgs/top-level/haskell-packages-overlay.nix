baseDirectory:

topLevelPackages:

final: prev:
{

  haskellPackages = prev.haskellPackages.extend (
    hfinal: hprev:

    let

      thattemPackages = import baseDirectory {
        inherit (final) pkgs;
        inherit (hfinal) haskellLib;
      } hfinal hprev;

    in

    prev.lib.mapAttrs (
      name: package: if builtins.hasAttr name hprev then hprev."${name}" else package
    ) thattemPackages
  );

}

// prev.lib.genAttrs topLevelPackages (
  package:
  prev."${package}"
    or (final.haskell.lib.compose.justStaticExecutables final.haskellPackages."${package}")
)
