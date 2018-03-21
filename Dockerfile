FROM alpine:3.7 as BUILD
RUN \
  wget -q -O openshift-client.tar.gz \
    https://github.com/openshift/origin/releases/download/v3.7.2/openshift-origin-client-tools-v3.7.2-282e43f-linux-64bit.tar.gz && \
  tar -xvf /openshift-client.tar.gz --strip-components 1

FROM gcr.io/distroless/base
MAINTAINER sohrab <sohrab.hosseini@gmail.com>
COPY --from=BUILD /oc /
CMD ["/oc"]