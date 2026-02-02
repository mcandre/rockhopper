# rockhoppers: Linux package generators

```text
  o<  gak! gak!
-/)
 ^^
```

# ABOUT

rockhopper automates install media generation for a wide variety of Linux distributions.

# EXAMPLE

```console
$ cd examples/sh

$ ./demo

$ tree .rockhopper
.rockhopper
├── alpine
│   └── hello-1.0.0-r1.apk
├── arch
│   └── hello-1.0.0-1-any.pkg.tar.zst
├── debian
│   └── hello_1.0.0-1_noarch.deb
├── rhel
│   └── hello-1.0.0-1.fc43.noarch.rpm
└── slack
    └── hello-1.0.0-1-any-build.tgz
```

# SEE ALSO

* [crit](https://github.com/mcandre/crit), an automated Rust multiplatform compiler
* [factorio](https://github.com/mcandre/factorio), an automated Go multiplatform compiler
* [fpm](https://github.com/jordansissel/fpm), an older, host native package generator
* [tuggy](https://github.com/mcandre/tuggy), an automated Docker multiplatform image builder

🐧
