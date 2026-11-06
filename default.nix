{
  nixpkgs ? <nixpkgs>,
  system ? builtins.currentSystem,
}:

let

  self = (import ./flake.nix).outputs {
    inherit self;
  };

in

import nixpkgs {

  inherit system;
  config = { };
  overlays = [ self.overlays.default ];

}
