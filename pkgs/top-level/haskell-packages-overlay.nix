baseDirectory:

topLevelPackages:

self: super:
{

  haskellPackages = super.haskellPackages.extend (
    hself: hsuper:

    let

      thattemPackages = import baseDirectory {
        inherit (self) pkgs;
        inherit (hself) haskellLib;
      } hself hsuper;

    in

    super.lib.mapAttrs (
      name: package: if builtins.hasAttr name hsuper then hsuper."${name}" else package
    ) thattemPackages
  );

}

// super.lib.genAttrs topLevelPackages (
  package:
  super."${package}"
    or (self.haskell.lib.compose.justStaticExecutables self.haskellPackages."${package}")
)
