# Use a loop device for mounting the iso and extract their contents
LOOP_DEVICE := $(shell losetup -f)

# PHONY goal dynamically
.PHONY: $(MAKECMDGOALS)

ifeq ($(MAKECMDGOALS), login)

ifndef DOCKER_USERNAME
$(error "You must set DOCKER_USERNAME. Type `make help` for more info.")
endif
export DOCKER_USERNAME

ifndef DOCKER_PASSWORD
$(error "You must set DOCKER_PASSWORD. Type `make help` for more info.")
endif
export DOCKER_PASSWORD

endif

help:
	@echo "Usage: make <sub-command>"
	@echo
	@echo "Where sub-commands are:"
	@echo "  all        Build and push all images"
	@echo "  login      Authenticate into your registry"
	@echo
	@echo "Where the `login` sub-command requires to provide these variables:"
	@echo "  DOCKER_USERNAME and DOCKER_PASSWORD"
	@echo "Examples:"
	@echo "  DOCKER_USER=myuser DOCKER_PASS=mypass make login"
	@echo "  make login DOCKER_USER=myuser DOCKER_PASS=mypass"

login:
	docker login -u $(DOCKER_USERNAME) -p $(DOCKER_PASSWORD) docker.io

all:
	# 2.0
	wget -q http://ftp.spline.inf.fu-berlin.de/pub/crux/crux-2.0/contrib/ucrux-2.0.iso
	sudo losetup $(LOOP_DEVICE) ucrux-2.0.iso
	mkdir -p .iso_contents
	sudo mount $(LOOP_DEVICE) .iso_contents
	docker build -t sepen/ucrux:2.0 -f 2.0/Dockerfile .
	sudo umount .iso_contents
	sudo losetup -d $(LOOP_DEVICE)
	docker run -t ucrux:2.0 bash -c "crux"
	docker push sepen/ucrux:2.0
	# 2.1
	wget -q http://ftp.spline.inf.fu-berlin.de/pub/crux/crux-2.1/contrib/ucrux-i486/ucrux-2.1.iso
	sudo losetup $(LOOP_DEVICE) ucrux-2.0.iso
	mkdir -p .iso_contents
	sudo mount $(LOOP_DEVICE) .iso_contents
	docker build -t sepen/ucrux:2.1 -f 2.1/Dockerfile .
	sudo umount .iso_contents
	sudo losetup -d $(LOOP_DEVICE)
	docker run -t ucrux:2.0 bash -c "crux"
	docker push sepen/ucrux:2.1
	# latest
	docker tag sepen/ucrux:2.1 sepen/ucrux:latest
	docker push sepen/ucrux:latest
