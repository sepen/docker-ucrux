.PHONY: $(MAKECMDGOALS)

MOUNT_POINT := .iso_contents
LOOP_DEVICE := $(shell losetup -f)

all:
	wget http://ftp.spline.inf.fu-berlin.de/pub/crux/crux-2.0/contrib/ucrux-2.0.iso
	losetup $(LOOP_DEVICE) ucrux-2.0.iso
	mount $(LOOP_DEVICE) $(MOUNT_POINT)
	docker build -t ucrux:2.0 .
	umount $(MOUNT_POINT)
	losetup -d $(LOOP_DEVICE)
