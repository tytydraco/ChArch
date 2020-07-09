# ChArch
A set of scripts to manage chroot containers on Linux.

# Install
## Linux
### Option A) Path Install
1) Navigate to a reliable directory of your choice
2) `git clone https://github.com/tytydraco/ChArch ChArch`
3) Add `export PATH="$PATH:</path/to/ChArch/>"` to an shell profile of your choice

### Option B) Direct Install
1) Navigate to any folder of your choice
2) `git clone https://github.com/tytydraco/ChArch ChArch`
3) `chmod +x ChArch/*`
4) `sudo cp ChArch/* /usr/bin/`
5) (optional) `rm -rf ChArch`

## Android
Navigate to the [Magisk Module](https://github.com/tytydraco/ChArch-Magisk-Module) page and follow the instructions there.

# Officially Supported Architectures
- armv5
- armv7
- armv8 / aarch64
- x86_64

# Features
- Low learning curve, high skill capacity
- Not many dependencies
- Portable and universal
- Default configuration provided per-architecture

# Tutorials
## Basic
This tutorial is for those who don't want to do any manual configuration, just a simple isolated chroot container. The default configuration is set to setup Arch Linux in either `/home/chroot/` or `/data/local/chroot/` depending if your host device is a Linux base or an Android base.

Let's start!
1) With root permissions, type `charch`. This will fetch the latest rootfs tarball from Arch Linux directly and automatically configure and enter it.

If all goes well, you should be logged in as root in your Arch Linux instance. If you get an error, head over to [issues](https://github.com/tytydraco/ChArch/issues) and provide a log to find help on fixing the bug.

2) The first thing you may want to do is update your packages. Type `pacman -Syu` and confirm your upgrades.
3) Once you are finished in your Arch Linux instance, type `exit` to return to your host terminal.
4) You may want to unmount your host partitions from the Arch Linux instance. Type `unarch` to kill any running processes and proceed with the unmount. If you receive an error stating that the unmount failed, you may need to either manually kill any running processes in the Arch Linux instance, or reboot your host device to kill everything and unmount automatically.
5) If you would like to remove your Arch Linux instance, type `rmarch` to completely remove it. If you are planning on following the next tutorials, skip this step.

# Intermediate
This tutorial is for users who are familiar with Linux syntax, and wish to experiment a bit with multiple chroot instances.

Let's start!
1) Begin with typing `lsarch` as root. This will list all of the rootfs instances that ChArch has created. If you have already completed the Basic tutorial, you should have one rootfs instance: `/home/chroot/rootfs/` on Linux, or `/data/local/chroot/rootfs/` on Android.
2) Let's say you'd like to own multiple rootfs instances, maybe dedicating one to software development, and another for Linux experiments. Since we already have a rootfs instance named `rootfs`, create a new one by typing `charch -n new`.
3) When finished, type `exit` and then `lsarch` to see your new instance list. You should now see two paths, one for `rootfs`, and one for `new`.
4) Let's remove both instances with `rmarch` and `rmarch -n new`. Note that the default rootfs instance (named `rootfs`) does not need to be specified. All ChArch commands assume this default instance name, however, you can specify one explicitly.
5) Now that we removed our rootfs instances, you should also type `rmarch -t` to delete the saved Arch Linux tarball, which can be >500 MiB in size. ChArch keeps the tarball by default for offline installation and to save bandwidth.
6) ChArch can also specify a root directory for your rootfs instances. Let's use `/tmp` as our new default directory. Type `charch -d /tmp`. This will create `/tmp/chroot/` and `/tmp/chroot/rootfs/`.

# Advanced
This tutorial is for power users who would like to try a different Linux flavor besides Arch Linux with ChArch.

1) Pick a flavor of linux that offers prebuilt rootfs tarballs. Some examples include `Kali Linux`, `Ubuntu`, and `Debian`. For this tutorial, we will use `Kali Linux`.
2) Navigate to the official Kali Linux [rootfs tarball](https://build.nethunter.com/kalifs/kalifs-latest/) page. Find the right tarball for your host architecture and copy it to your clipboard.
3) Type `charch -u "<url>" -n kali`, replacing `<url>` with something like `https://build.nethunter.com/kalifs/kalifs-latest/kalifs-amd64-full.tar.xz`.
4) If all goes well, you should be placed directly into a Kali Linux rootfs instance. Type `exit` to return to your host terminal.
5) Note that since you fetched a custom URL with `charch`, your backed-up tarball will be that of the distribution you last fetched. If you ever wish to return to the default Arch Linux tarball fetch, either type `rmarch -t` to remove the tarball entirely, or specify `-f` the next time you create a new rootfs instance with `charch` (i.e. `charch -f -n example`).
6) Let's practice cloning a rootfs instance. Type `cparch kali kali_bk` to backup your rootfs instance. This will take a while.
7) Type `lsarch` to see your rootfs instances. You should see both your original `kali` instance and your `kali_bk` instance.

# Sideloading
If you have a custom rootfs tarball that you want to use, but don't want to specify a URL to `charch`, you can manually sideload a tarball.

1) Navigate to your chroot container of choice. The default is `/home/chroot` for Linux and `/data/local/chroot/` for Android.
2) Remove any existing `rootfs.tar.gz` using `rmarch -t`.
3) Copy your rootfs tarball to `rootfs.tar.gz` (the final file should look like `/home/chroot/rootfs.tar.gz`).
4) Type `charch -n <name>` to create a rootfs instance called `name` that will use your custom tarball.
5) Type `rmarch -t` to remove your custom tarball.

If your image is already extracted, or you'd like to sideload a premade rootfs, you can follow these steps.

1) Navigate to your chroot container of choice. The default is `/home/chroot` for Linux and `/data/local/chroot/` for Android.
2) Copy your extracted rootfs here (the final folder could look like `/home/chroot/custom/`).
3) You can directly enter the rootfs using `charch -n <foldername>` (the command could look like `charch -n custom`).

# Chroot Post-Install
## User Configuration
1) Type `useradd -m <username>` to create a non-root user.
2) Use `passwd <username>` to set the password for the new user.
3) Login as your new user with `su - <username>`.

## SSH Server
You can setup SSHD for wireless access to your chroot container from another device.

1) `ssh-keygen -A`
2) `nano /etc/ssh/sshd_config`
3) Change `#PermitRootLogin` to `PermitRootLogin yes`
4) Change `#PasswordAuthentication` to `PasswordAuthentication yes`
5) Change `UsePam yes` to `#UsePam yes`
6) To start the SSHD server, run `/usr/bin/sshd`
7) On another machine, login using `ssh root@<android ip>` (default root password is `root`)

# FAQ
## Q: My non-root users can't use the internet!

A: You might need to add your non-root users to the net groups.

1) Type `groups` and find the net related ones (`inet`, `net_raw`)

If there are no net groups, add them manually to the top of `/etc/group`:

```
inet:x:3003:root
net_raw:x:3004:root
```

2) `usermod -a -G inet <username>`
3) `usermod -a -G net_raw <username>`

## Q: What is the default DNS?
A: Using the DNS from the host machine is unreliable, especially on Android, as it is extremely volatile. The default DNS is from Cloudflare.

- Primary: `1.1.1.1`
- Secondary: `1.0.0.1`

## Q: (Android) Why is my `/data` partition suddenly mounted with `suid` and `exec`?
A: ChArch remounts your chroot container root directory with `exec` and `suid` to allow chroot to function, and for `sudo` to work properly. `unarch` will **not** remount it with `nosuid` and `noexec`, since other chroot instances could be running at the time, and remounting the filesystem could break the running instance. Rebooting will remount with the default mount options.

# Credits
- @topjohnwu: Magisk Module tutorial for Android devices
- @baalajimaestro: Android bug testing and suggestions
