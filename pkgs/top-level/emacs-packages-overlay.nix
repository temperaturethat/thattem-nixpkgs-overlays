baseDirectory:

final: prev: {

  emacsPackagesFor =
    emacs:
    ((prev.emacsPackagesFor emacs).overrideScope (
      efinal: eprev:

      let

        thattemPackages = import baseDirectory {
          inherit (prev) lib;
          inherit (final) pkgs;
        } efinal;

      in

      prev.lib.mapAttrs (
        name: package: if builtins.hasAttr name eprev then eprev."${name}" else package
      ) thattemPackages
      // {
        inherit thattemPackages;
      }
    ));

}
