{ pkgs ? import <nixpkgs> {} }:

pkgs.stdenv.mkDerivation {
  name = "bgg";
  src = null;

  buildInputs = let
    pypkgs = packages: with packages; [
      requests
      pyyaml
      ipdb
    ];
    python = pkgs.python37Full.withPackages pypkgs;
  in [
    python
  ];
}
