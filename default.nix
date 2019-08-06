with import <nixpkgs> {};

(import ./node.nix {}).shell.overrideAttrs (old: {
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
