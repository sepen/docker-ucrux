# uCRUX Linux Docker Image

uCRUX is a port of [CRUX](https://crux.nu) Linux using the [uClibc C](https://uclibc.org) library.


## Important Notes

Since uCRUX is only for i486 platform it is not possible to make it run directly in containers.

These images have a /media directory that contains everything from the uCRUX ISO.

Example:
```
$ docker run -it sepen/ucrux:2.0 sh
Unable to find image 'sepen/ucrux:2.0' locally
2.0: Pulling from sepen/ucrux
8a49fdb3b6a5: Pull complete
1cc5e4c2efa7: Pull complete
e1e3bfbcee02: Pull complete
Digest: sha256:e9267eb4e96e724fd36b19b75be9540b69172949fc0dc4afedd651a54dcca9f7
Status: Downloaded newer image for sepen/ucrux:2.0
/ # apk update
/ # apk add bash dialog ncurses findutils
/ # tar xvf /media/crux/base/pkgutils* -C /
/ # ln -s /media/crux /crux
/ # /media/usr/bin/setup
```
