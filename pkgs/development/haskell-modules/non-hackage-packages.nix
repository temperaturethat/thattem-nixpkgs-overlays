{ pkgs, haskellLib }:

self: super: {

  firefox-addon-fetcher = self.callPackage ../tools/haskell/firefox-addon-fetcher { };

}
