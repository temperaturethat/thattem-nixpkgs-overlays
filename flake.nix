{

  description = "Thattemperature's nixpkgs overlays";

  outputs =
    { self, ... }:

    {
      overlays = {

        default = import ./pkgs/top-level (
          with self.overlays;
          [
            by-name
            emacs-packages
            firefox-extensions
            gnome-extensions
            haskell-modules
            python-modules
            workarounds
          ]
        );

        by-name = import ./pkgs/top-level/by-name-overlay.nix ./pkgs/by-name;

        emacs-packages = import ./pkgs/top-level/emacs-packages-overlay.nix ./pkgs/applications/editors/emacs/elisp-packages/manual-packages.nix;

        firefox-extensions =
          import ./pkgs/top-level/firefox-extensions-overlay.nix
            ./pkgs/uncategorized/firefox/extensions/buildFirefoxExtension.nix
            ./pkgs/uncategorized/firefox/extensions/addons.jsonl;

        gnome-extensions = import ./pkgs/top-level/gnome-extensions-overlay.nix ./pkgs/desktops/gnome/extensions/manuallyPackaged.nix;

        haskell-modules =
          import ./pkgs/top-level/haskell-packages-overlay.nix
            ./pkgs/development/haskell-modules/non-hackage-packages.nix
            [
              "firefox-addon-fetcher"
            ];

        python-modules =
          import ./pkgs/top-level/python-packages-overlay.nix ./pkgs/development/python-modules
            [
              "honcho-ai"
            ];

        workarounds = import ./pkgs/top-level (import ./workarounds);

      };
    };

}
