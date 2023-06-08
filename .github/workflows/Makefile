LOOP_DEVICE := $(shell losetup -f)

.PHONY: $(MAKECMDGOALS)

test:
	echo "-- $(LOOP_DEVICE) --"

isomount:
	wget -c http://ftp.spline.inf.fu-berlin.de/pub/crux/crux-2.0/contrib/ucrux-2.0.iso
	losetup $(LOOP_DEVICE) ucrux-2.0.iso
	mkdir /media
	mount $(LOOP_DEVICE) /media
	ls -la /media
