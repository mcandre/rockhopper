# rockhopper: Linux package generator

# ABOUT

rockhopper automates the process of generating installers, for a wide variety of Linux distributions.

# EXAMPLE

```console
$ cd examples/sh

$ docker run --rm \
    -v "$(pwd):/src" \
    n4jm4/rockhopper:alpine \
    --name hello \
    --version 1.0.0 \
    --arch noarch \
    --maintainer "Bob <bob@bobsautoparts.test>" \
    --description "greeter" \
    --summary "greeter" \
    --license BSD-3 \
    --release 1 \
    --changelog-file changelog.txt \
    --url https://bobsautoparts.test/

$ docker run --rm \
    -v "$(pwd):/src" \
    n4jm4/rockhopper:arch \
    --name hello \
    --version 1.0.0 \
    --arch any \
    --maintainer "Bob <bob@bobsautoparts.test>" \
    --description "greeter" \
    --summary "greeter" \
    --license BSD-3 \
    --release 1 \
    --changelog-file changelog.txt \
    --url https://bobsautoparts.test/

$ docker run --rm \
    -v "$(pwd):/src" \
    n4jm4/rockhopper:debian \
    --name hello \
    --version 1.0.0 \
    --arch noarch \
    --maintainer "Bob <bob@bobsautoparts.test>" \
    --description "greeter" \
    --summary "greeter" \
    --license BSD-3 \
    --release 1 \
    --changelog-file changelog.txt \
    --url https://bobsautoparts.test/

$ docker run --rm \
    -v "$(pwd):/src" \
    n4jm4/rockhopper:rhel \
    --name hello \
    --version 1.0.0 \
    --arch noarch \
    --maintainer "Bob <bob@bobsautoparts.test>" \
    --description "greeter" \
    --summary "greeter" \
    --license BSD-3 \
    --release 1 \
    --changelog-file changelog.txt \
    --url https://bobsautoparts.test/

$ docker run --rm \                                     andrew@najma:sh
    -v "$(pwd):/src" \
    n4jm4/rockhopper:slack \
    --name hello \
    --version 1.0.0 \
    --arch any \
    --maintainer "Bob <bob@bobsautoparts.test>" \
    --description "greeter" \
    --summary "greeter" \
    --license BSD-3 \
    --release 1 \
    --changelog-file changelog.txt \
    --url https://bobsautoparts.test/

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

🐧
