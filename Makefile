.PHONY: $(MAKECMDGOALS)

LOOP_DEVICE := $(shell losetup -f)

all:
	wget http://ftp.spline.inf.fu-berlin.de/pub/crux/crux-2.0/contrib/ucrux-2.0.iso
	losetup $(LOOP_DEVICE) ucrux-2.0.iso
	mkdir .iso_contents
	mount $(LOOP_DEVICE) .iso_contents
	docker build -t ucrux:2.0 .
	docker image ls
	umount .iso_contents
	losetup -d $(LOOP_DEVICE)
