ARG BASE=ubuntu
FROM $BASE

ARG arch=arm
ENV ARCH=$arch

COPY qemu/qemu-$ARCH-static* /usr/bin/

RUN apt-get update && \
    apt-get install -y exim4-daemon-light && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    find /var/log -type f | while read f; do echo -ne '' > $f; done;

COPY entrypoint.sh set-exim4-update-conf /bin/

EXPOSE 25
ENTRYPOINT ["/bin/entrypoint.sh"]
CMD ["exim", "-bd", "-q15m", "-v"]
