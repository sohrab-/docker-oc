FROM frolvlad/alpine-glibc:alpine-3.8
LABEL \
  maintainer="sohrab <sohrab.hosseini@gmail.com>"
RUN \
  apk add --update ca-certificates && \
  wget -q -O /tmp/openshift-client.tar.gz \
    https://github.com/openshift/origin/releases/download/v3.11.0/openshift-origin-client-tools-v3.11.0-0cbc58b-linux-64bit.tar.gz && \
  tar -xvf /tmp/openshift-client.tar.gz --strip-components 1 -C /tmp && \
  mv -v /tmp/oc /bin && \
  rm -rfv /tmp/* /var/cache/apk/*
CMD [ "oc" ]