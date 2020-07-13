# ![ChArch](https://imgur.com/download/Spf3agt)

A set of scripts to manage chroot containers on Linux.

# Features
- Low learning curve. Even Linux noobs will have an easy time with ChArch.
- Portable. There is very little setup required, and you can take your rootfs instances with you on an external drive.
- Fast. ChArch uses raw filesystems as opposed to other solutions that create and mount disk images, resulting in less I/O overhead.
- Quick Install. With reasonably fast network speeds, ChArch can configure an entire rootfs instance in less than 5 minutes. Removing the tarball download from the equation, ChArch can do it in less than 15 seconds.
- Small. ChArch removes the Linux Kernel images and firmware packages post-install to reduce the usual 500 MiB rootfs instance to around 120 MiB.
- Compatible. ChArch uses relatively few dependencies. On Android, Magisk BusyBox support is added as a fallback to support more devices.
- Non-hacky. Unlike other solutions that download old images or use manual package installation in a bootstrap environment, ChArch uses a rootfs tarball base that is provided by you, the user. For Arch Linux ARM devices, the latest rootfs tarball is used by default.
- Seamless. ChArch supports multiple running rootfs instances at the same time, and even in the background.

# Architectures With Default Arch Linux Support
If no `-u` option is given to `charch` for these architecures, ChArch will choose the latest ARM Arch Linux tarball. Other architectures require a URL to be specified.

- armv5
- armv7
- armv8 / aarch64

# Getting Started
Head over to the [Wiki](https://github.com/tytydraco/ChArch/wiki) to learn how to get started with ChArch.

# Credits
- [topjohnwu](https://github.com/topjohnwu): Magisk Module tutorial for Android devices
- [baalajimaestro](https://github.com/baalajimaestro): Android bug testing and suggestions
