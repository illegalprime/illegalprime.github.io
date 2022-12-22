{ rev ? "1c1f5649bb9c1b0d98637c8c365228f57126f361"
, pkgs ? import (builtins.fetchGit {
  name = "nixos-20.09";
  url = "https://github.com/nixos/nixpkgs";
  allRefs = true;
  inherit rev;
}) {} }:
with pkgs;

(import ./node.nix { inherit pkgs; }).shell.overrideAttrs (old: {
  name = "oddoreden.com";

  buildInputs = old.buildInputs ++ [
    # extra gems we need
    (bundlerEnv {
      name = "jekyll-env";
      inherit ruby;
      gemfile = ./Gemfile;
      lockfile = ./Gemfile.lock;
      gemset = ./gemset.nix;
    })
    (writeShellScriptBin "jekyll-watch" ''
      exec jekyll serve --watch --host 0.0.0.0 "$@"
    '')
    git
    git-lfs
  ];

  # UTF-8 please
  LANGUAGE = "en_US.UTF-8";
  LANG = "en_US.UTF-8";
  LC_ALL = "C.UTF-8";
})
