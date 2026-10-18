{ pkgs, haskellLib }:

final: prev: {

  firefox-addon-fetcher = final.callPackage ../tools/haskell/firefox-addon-fetcher { };

}
