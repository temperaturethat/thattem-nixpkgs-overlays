# Workaround: update dconf2nix temporarily

final: prev:

{

  haskellPackages = prev.haskellPackages.extend (
    hfinal: hprev: {

      dconf2nix = prev.haskell.lib.overrideCabal hprev.dconf2nix (old: {

        version = "0.1.1-unstable-2026-05-21";

        src = final.fetchFromGitHub {
          owner = "thattemperature";
          repo = "dconf2nix";
          rev = "dd1dacf17ed97be48d459e6c72524872fd0e6ab6";
          hash = "sha256-P2jxSiq5aypnhk+J0W5dOqsoyjIX9l8Uz2xeRXBuSCc=";
        };

        libraryHaskellDepends = old.libraryHaskellDepends ++ [
          hfinal.utf8-string
        ];
      });

    }
  );

}
