{ pkgs ? import <nixpkgs> {} }:
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
    git-lfs
  ];

  # UTF-8 please
  LANGUAGE = "en_US.UTF-8";
  LANG = "en_US.UTF-8";
  LC_ALL = "C.UTF-8";
})
