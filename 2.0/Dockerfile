FROM alpine as builder
COPY ucrux-2.0.tar /tmp
RUN install -d -m 0755 -o root -g root /rootfs && \
    tar -C /rootfs -xf /tmp/ucrux-2.0.tar

FROM scratch
COPY --from=builder /rootfs /
