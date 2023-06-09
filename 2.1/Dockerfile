FROM alpine as builder
COPY ucrux-2.1.tar /tmp
RUN install -d -m 0755 -o root -g root /rootfs && \
    tar -C /media -xf /tmp/ucrux-2.1.tar && \
    rm -f /tmp/ucrux-2.1.tar
