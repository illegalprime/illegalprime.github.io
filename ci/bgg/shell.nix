{ pkgs ? import (builtins.fetchGit {
  name = "nixos-unstable-2018-09-12";
  url = https://github.com/nixos/nixpkgs/;
  rev = "b58ada326aa612ea1e2fb9a53d550999e94f1985";
}) {} }:

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
