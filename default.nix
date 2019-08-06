with import (builtins.fetchGit {
  name = "nixos-unstable-2018-09-12";
  url = https://github.com/nixos/nixpkgs/;
  rev = "b58ada326aa612ea1e2fb9a53d550999e94f1985";
}) {};

(import ./node.nix { inherit pkgs; }).shell.overrideAttrs (old: {
  name = "oddoreden.com";

  buildInputs = old.buildInputs ++ [
    # extra gems we need
    (bundlerEnv {
      name = "jekyll-env";
      inherit ruby;
      gemdir = ./.;
    })
  ];

  # UTF-8 please
  LANGUAGE = "en_US.UTF-8";
  LANG = "en_US.UTF-8";
  LC_ALL = "C.UTF-8";
})
