# Simple Execution Environment (SEE) in Nerves

This example shows how to build a Nerves firmware image that runs a SEE test
application from Joe Armstrong's Programming Erlang 2nd Edition book. SEE
doesn't load OTP or any of the normal Erlang modules. As a result, this is
about the smallest and fastest loading image that you can build with Nerves.

To build, download and build the `nerves-sdk` first. Then run the following:

```shell
$ source ../nerves-sdk/nerves-env.sh
$ make
```

Copy the image to an SDCard using `dd` or `mmccopy`:

```shell
$ sudo mmccopy _images/sdcard.img
```

Insert the image into a BeagleBone Black and boot. You should eventually see
the following
```
HELLO WORLD
4 modules loaded
Press a key to reboot...
```
