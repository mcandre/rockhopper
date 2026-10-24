variable "VERSION" {
    default = "test"
}

variable "PLATFORMS" {
    # Drop 32-bit support
    # Work around buildx quirks
    default = [
        # "linux/386",
        "linux/amd64",
        # "linux/arm/v6",
        # "linux/arm/v7",
        "linux/arm64/v8",
        # "linux/ppc64le",
        # "linux/riscv64",
        # "linux/s390x",
    ]
}

variable "PRODUCTION" {
    default = [
        "alpine-linux",
        "appimage",
        "fedora",
        "freebsd",
        "gentoo",
        "macos",
        "netbsd",
        "openbsd",
        "tarball",
        "ubuntu",
        "windows",
    ]
}

variable "TEST" {
    default = [
        "test-alpine-linux",
        "test-appimage",
        "test-fedora",
        "test-freebsd",
        "test-gentoo",
        "test-macos",
        "test-netbsd",
        "test-openbsd",
        "test-tarball",
        "test-ubuntu",
        "test-windows",
    ]
}

group "production" {
    targets = PRODUCTION
}

group "test" {
    targets = TEST
}

group "all" {
    targets = concat(PRODUCTION, TEST)
}

target "alpine-linux" {
    context = "docker/alpine-linux"
    platforms = PLATFORMS
    args = { ROCKHOPPER_VERSION = VERSION }
    tags = [
        "n4jm4/rockhopper:${VERSION}-alpine-linux-3.24",
        "n4jm4/rockhopper:${VERSION}-alpine-linux",
        "n4jm4/rockhopper:alpine-linux-3.24",
        "n4jm4/rockhopper:alpine-linux",
    ]
}

target "test-alpine-linux" {
    context = "docker/alpine-linux"
    platforms = PLATFORMS
    args = { ROCKHOPPER_VERSION = VERSION }
    tags = [
        "n4jm4/rockhopper:test-alpine-linux",
    ]
}

target "appimage" {
    context = "docker/appimage"
    platforms = PLATFORMS
    args = { ROCKHOPPER_VERSION = VERSION }
    tags = [
        "n4jm4/rockhopper:${VERSION}-appimage-continuous",
        "n4jm4/rockhopper:${VERSION}-appimage",
        "n4jm4/rockhopper:appimage-continuous",
        "n4jm4/rockhopper:appimage",
    ]
}

target "test-appimage" {
    context = "docker/appimage"
    platforms = PLATFORMS
    args = { ROCKHOPPER_VERSION = VERSION }
    tags = [
        "n4jm4/rockhopper:test-appimage",
    ]
}

target "fedora" {
    context = "docker/fedora"
    platforms = PLATFORMS
    args = { ROCKHOPPER_VERSION = VERSION }
    tags = [
        "n4jm4/rockhopper:${VERSION}-fedora-43",
        "n4jm4/rockhopper:${VERSION}-fedora",
        "n4jm4/rockhopper:fedora-43",
        "n4jm4/rockhopper:fedora",
    ]
}

target "test-fedora" {
    context = "docker/fedora"
    platforms = PLATFORMS
    args = { ROCKHOPPER_VERSION = VERSION }
    tags = [
        "n4jm4/rockhopper:test-fedora",
    ]
}

target "freebsd" {
    context = "docker/freebsd"
    platforms = PLATFORMS
    args = { ROCKHOPPER_VERSION = VERSION }
    tags = [
        "n4jm4/rockhopper:${VERSION}-freebsd",
        "n4jm4/rockhopper:freebsd",
    ]
}

target "test-freebsd" {
    context = "docker/freebsd"
    platforms = PLATFORMS
    args = { ROCKHOPPER_VERSION = VERSION }
    tags = [
        "n4jm4/rockhopper:test-freebsd",
    ]
}

target "gentoo" {
    context = "docker/gentoo"
    platforms = PLATFORMS
    args = { ROCKHOPPER_VERSION = VERSION }
    tags = [
        "n4jm4/rockhopper:${VERSION}-gentoo",
        "n4jm4/rockhopper:gentoo",
    ]
}

target "test-gentoo" {
    context = "docker/gentoo"
    platforms = PLATFORMS
    args = { ROCKHOPPER_VERSION = VERSION }
    tags = [
        "n4jm4/rockhopper:test-gentoo",
    ]
}

target "macos" {
    context = "docker/macos"
    platforms = PLATFORMS
    args = { ROCKHOPPER_VERSION = VERSION }
    tags = [
        "n4jm4/rockhopper:${VERSION}-macos",
        "n4jm4/rockhopper:macos",
    ]
}

target "test-macos" {
    context = "docker/macos"
    platforms = PLATFORMS
    args = { ROCKHOPPER_VERSION = VERSION }
    tags = [
        "n4jm4/rockhopper:test-macos",
    ]
}

target "netbsd" {
    context = "docker/netbsd"
    platforms = PLATFORMS
    args = { ROCKHOPPER_VERSION = VERSION }
    tags = [
        "n4jm4/rockhopper:${VERSION}-netbsd",
        "n4jm4/rockhopper:netbsd",
    ]
}

target "test-netbsd" {
    context = "docker/netbsd"
    platforms = PLATFORMS
    args = { ROCKHOPPER_VERSION = VERSION }
    tags = [
        "n4jm4/rockhopper:test-netbsd",
    ]
}

target "openbsd" {
    context = "docker/openbsd"
    platforms = PLATFORMS
    args = { ROCKHOPPER_VERSION = VERSION }
    tags = [
        "n4jm4/rockhopper:${VERSION}-openbsd",
        "n4jm4/rockhopper:openbsd",
    ]
}

target "test-openbsd" {
    context = "docker/openbsd"
    platforms = PLATFORMS
    args = { ROCKHOPPER_VERSION = VERSION }
    tags = [
        "n4jm4/rockhopper:test-openbsd",
    ]
}

target "tarball" {
    context = "docker/tarball"
    platforms = PLATFORMS
    args = { ROCKHOPPER_VERSION = VERSION }
    tags = [
        "n4jm4/rockhopper:${VERSION}-tarball",
        "n4jm4/rockhopper:tarball",
    ]
}

target "test-tarball" {
    context = "docker/tarball"
    platforms = PLATFORMS
    args = { ROCKHOPPER_VERSION = VERSION }
    tags = [
        "n4jm4/rockhopper:test-tarball",
    ]
}

target "ubuntu" {
    context = "docker/ubuntu"
    platforms = PLATFORMS
    args = { ROCKHOPPER_VERSION = VERSION }
    tags = [
        "n4jm4/rockhopper:${VERSION}-ubuntu-noble",
        "n4jm4/rockhopper:${VERSION}-ubuntu-24.04",
        "n4jm4/rockhopper:${VERSION}-ubuntu",
        "n4jm4/rockhopper:ubuntu-noble",
        "n4jm4/rockhopper:ubuntu-24.04",
        "n4jm4/rockhopper:ubuntu",
    ]
}

target "test-ubuntu" {
    context = "docker/ubuntu"
    platforms = PLATFORMS
    args = { ROCKHOPPER_VERSION = VERSION }
    tags = [
        "n4jm4/rockhopper:test-ubuntu",
    ]
}

target "windows" {
    context = "docker/windows"
    platforms = PLATFORMS
    args = { ROCKHOPPER_VERSION = VERSION }
    tags = [
        "n4jm4/rockhopper:${VERSION}-windows",
        "n4jm4/rockhopper:windows",
    ]
}

target "test-windows" {
    context = "docker/windows"
    platforms = PLATFORMS
    args = { ROCKHOPPER_VERSION = VERSION }
    tags = [
        "n4jm4/rockhopper:test-windows",
    ]
}
