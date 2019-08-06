{
  addressable = {
    dependencies = ["public_suffix"];
    groups = ["default" "jekyll_plugins"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1j5r0anj8m4qlf2psnldip4b8ha2bsscv11lpdgnfh4nnchzjnxw";
      type = "gem";
    };
    version = "2.5.0";
  };
  colorator = {
    groups = ["default" "jekyll_plugins"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0f7wvpam948cglrciyqd798gdc6z3cfijciavd0dfixgaypmvy72";
      type = "gem";
    };
    version = "1.1.0";
  };
  em-websocket = {
    dependencies = ["eventmachine" "http_parser.rb"];
    groups = ["default" "jekyll_plugins"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1bsw8vjz0z267j40nhbmrvfz7dvacq4p0pagvyp17jif6mj6v7n3";
      type = "gem";
    };
    version = "0.5.1";
  };
  eventmachine = {
    groups = ["default" "jekyll_plugins"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "075hdw0fgzldgss3xaqm2dk545736khcvv1fmzbf1sgdlkyh1v8z";
      type = "gem";
    };
    version = "1.2.5";
  };
  ffi = {
    groups = ["default" "jekyll_plugins"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1nkcrmxqr0vb1y4rwliclwlj2ajsi4ddpdx2gvzjy0xbkk5iqzfp";
      type = "gem";
    };
    version = "1.9.14";
  };
  forwardable-extended = {
    groups = ["default" "jekyll_plugins"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "15zcqfxfvsnprwm8agia85x64vjzr2w0xn9vxfnxzgcv8s699v0v";
      type = "gem";
    };
    version = "2.6.0";
  };
  "http_parser.rb" = {
    groups = ["default" "jekyll_plugins"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "15nidriy0v5yqfjsgsra51wmknxci2n2grliz78sf9pga3n0l7gi";
      type = "gem";
    };
    version = "0.6.0";
  };
  jekyll = {
    dependencies = ["addressable" "colorator" "jekyll-sass-converter" "jekyll-watch" "kramdown" "liquid" "mercenary" "pathutil" "rouge" "safe_yaml"];
    groups = ["default" "jekyll_plugins"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1yr9y8ygdwljdbx531p1achys81wmk89gdssnpvpzadrbql7v1lv";
      type = "gem";
    };
    version = "3.3.1";
  };
  jekyll-feed = {
    dependencies = ["jekyll"];
    groups = ["jekyll_plugins"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "15sqxgs08s8rn55ja5zpcjk7qdm720y3ygap8b2z5q3qr12c5p2i";
      type = "gem";
    };
    version = "0.8.0";
  };
  jekyll-livereload = {
    dependencies = ["em-websocket" "jekyll"];
    groups = ["jekyll_plugins"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1l5kbd9figf65i0ggrvvh9f4d6q427di0vlq53155lmp6jhr5vyb";
      type = "gem";
    };
    version = "0.2.2";
  };
  jekyll-paginate = {
    groups = ["jekyll_plugins"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0r7bcs8fq98zldih4787zk5i9w24nz5wa26m84ssja95n3sas2l8";
      type = "gem";
    };
    version = "1.1.0";
  };
  jekyll-sass-converter = {
    dependencies = ["sass"];
    groups = ["default" "jekyll_plugins"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "01m921763yfgx1gc33k5ixqz623f4c4azgnpqhgsc2q61fyfk3q1";
      type = "gem";
    };
    version = "1.5.0";
  };
  jekyll-tagging = {
    dependencies = ["ruby-nuggets"];
    groups = ["jekyll_plugins"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "081r35rc2wmff5ir7mv90gavyj8hvq69kj1r6mv6kpha1fhycwbj";
      type = "gem";
    };
    version = "1.0.1";
  };
  jekyll-watch = {
    dependencies = ["listen"];
    groups = ["default" "jekyll_plugins"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "02rg3wi95w2l0bg1igl5k6pza723vn2b2gj975gycz1cpmhdjn6z";
      type = "gem";
    };
    version = "1.5.0";
  };
  kramdown = {
    groups = ["default" "jekyll_plugins"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "074pv7996lhz0iz4ymmb0jl5lfb8agxxxcpb05h1qjhladck15y4";
      type = "gem";
    };
    version = "1.13.1";
  };
  liquid = {
    groups = ["default" "jekyll_plugins"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "033png37ym4jrjz5bi7zb4ic4yxacwvnllm1xxmrnr4swgyyygc2";
      type = "gem";
    };
    version = "3.0.6";
  };
  listen = {
    dependencies = ["rb-fsevent" "rb-inotify"];
    groups = ["default" "jekyll_plugins"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1l0y7hbyfiwpvk172r28hsdqsifq1ls39hsfmzi1vy4ll0smd14i";
      type = "gem";
    };
    version = "3.0.8";
  };
  mercenary = {
    groups = ["default" "jekyll_plugins"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "10la0xw82dh5mqab8bl0dk21zld63cqxb1g16fk8cb39ylc4n21a";
      type = "gem";
    };
    version = "0.3.6";
  };
  minima = {
    dependencies = ["jekyll"];
    groups = ["default"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1s7ks9fqfvqx7qicnkrg76wavg9mjas52f7iyhr89lz9mqiy7p39";
      type = "gem";
    };
    version = "2.1.0";
  };
  nuggets = {
    groups = ["default" "jekyll_plugins"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1gy71nvsji7yljg6b1bxih9jwkjccd4naii4iqndial7ydqlnakc";
      type = "gem";
    };
    version = "1.0.0";
  };
  pathutil = {
    dependencies = ["forwardable-extended"];
    groups = ["default" "jekyll_plugins"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0f444wx6vjd30lkkb2zn1k5a6g33lidrpyy7lmgy66n1gsiipzn7";
      type = "gem";
    };
    version = "0.14.0";
  };
  public_suffix = {
    groups = ["default" "jekyll_plugins"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1ig5ily94n4jcybsmir6wsya9z2l142g0p3g7vxm87m3f89z440x";
      type = "gem";
    };
    version = "2.0.4";
  };
  rb-fsevent = {
    groups = ["default" "jekyll_plugins"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1pdiasp9zlr306yld19szapi6kdjk38rpv1hih9x0ry40x6mb63n";
      type = "gem";
    };
    version = "0.9.8";
  };
  rb-inotify = {
    dependencies = ["ffi"];
    groups = ["default" "jekyll_plugins"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1yfcp3065n08balljmxn0qzwhdbwwxn2h9z89wmydyfj2gq1p71d";
      type = "gem";
    };
    version = "0.9.7";
  };
  rouge = {
    groups = ["default" "jekyll_plugins"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "13amckbdknnc5491ag28y8pqbyfpbzx5n4rlmadxhd3wkrhp92c8";
      type = "gem";
    };
    version = "1.11.1";
  };
  ruby-nuggets = {
    dependencies = ["nuggets"];
    groups = ["default" "jekyll_plugins"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1dkkm07vgjqqdl3av998478rnjx1k8r78fdygpg6m6yl3ccffj23";
      type = "gem";
    };
    version = "1.0.0";
  };
  safe_yaml = {
    groups = ["default" "jekyll_plugins"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "1hly915584hyi9q9vgd968x2nsi5yag9jyf5kq60lwzi5scr7094";
      type = "gem";
    };
    version = "1.0.4";
  };
  sass = {
    groups = ["default" "jekyll_plugins"];
    platforms = [];
    source = {
      remotes = ["https://rubygems.org"];
      sha256 = "0dkj6v26fkg1g0majqswwmhxva7cd6p3psrhdlx93qal72dssywy";
      type = "gem";
    };
    version = "3.4.22";
  };
}