ARG BASE=alpine
FROM $BASE

ARG arch=arm
ENV ARCH=$arch

COPY qemu/qemu-$ARCH-static* /usr/bin/

RUN apk add --no-cache exim

COPY entrypoint.sh set-exim4-update-conf /usr/local/bin/

EXPOSE 25
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD ["exim", "-bd", "-q15m", "-v"]
