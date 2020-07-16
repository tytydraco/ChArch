# ![ChArch](https://imgur.com/download/Spf3agt)

A set of scripts to manage chroot containers on Linux.

# Features
- Low Learning Curve. Even Linux noobs will have an easy time with ChArch.
- Portable. Take your rootfs instances with you on an external drive.
- Fast. ChArch uses raw filesystems instead of loopback devices.
- Easy. ChArch can configure an entire rootfs instance in less than a minute (YMMV).
- Small. ChArch removes the Linux Kernel images and firmware packages, resulting in a ~0.5 GiB rootfs instance.
- Compatible. ChArch uses relatively few dependencies and Magisk BusyBox is used as a fallback for Android devices.
- Seamless. ChArch supports multiple running rootfs instances at the same time, and even in the background.

# Architectures With Default Tarballs
These architectures can use the `charch` command without specifying a rootfs tarball URL. Other architectures are supported, however the rootfs tarball URL will need to be specified with `charch -u <url>`, or an image must be sideloaded. See the [Wiki](https://github.com/tytydraco/ChArch/wiki) for details. The default rootfs tarball for these architectures is [ARM Arch Linux](http://fl.us.mirror.archlinuxarm.org/os/).

- armv5
- armv7
- armv8 / aarch64

# Getting Started
Head over to the [Wiki](https://github.com/tytydraco/ChArch/wiki) to learn how to get started with ChArch.

# Credits
- [baalajimaestro](https://github.com/baalajimaestro): Android bug testing and suggestions
