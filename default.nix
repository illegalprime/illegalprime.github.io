with import <nixpkgs> {};

stdenv.mkDerivation  {
  name = "oddoreden.com";

  buildInputs = [
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

  # to run stuff:
  # $ jekyll serve --watch --livereload --host 0.0.0.0
}
