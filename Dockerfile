# By default we pin to amd64 sha. Use make docker to automatically adjust for arm64 versions.
ARG SHA="de4af55df1f648a334e16437c550a2907e0aed4f0b0edf454b0b215a9349bdbb"
FROM quay.io/prometheus/busybox@sha256:${SHA}
LABEL maintainer="The Thanos Authors"

COPY /thanos_tmp_for_docker /bin/thanos

ENTRYPOINT [ "/bin/thanos" ]
