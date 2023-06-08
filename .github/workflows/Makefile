LOOP_DEVICE := $(shell losetup -f)

.PHONY: $(MAKECMDGOALS)

all: isomount

test:
	echo "-- $(LOOP_DEVICE) --"

ucrux-2.0.iso:
	wget http://ftp.spline.inf.fu-berlin.de/pub/crux/crux-2.0/contrib/ucrux-2.0.iso

isomount: ucrux-2.0.iso
	losetup $(LOOP_DEVICE) ucrux-2.0.iso
	mkdir /media
	mount $(LOOP_DEVICE) /media
	ls -la /media
