FROM golang:1.7.3
MAINTAINER jecnua "fabrizio.sabatini.it@google.com"

COPY code/server.go /go/server.go
COPY Dockerfile /

# Metadata params
ARG BUILD_DATE
ARG VERSION
ARG VCS_URL
ARG VCS_REF

RUN go get github.com/golang/snappy && \
  go get github.com/golang/protobuf/proto && \
  go get github.com/prometheus/common/model && \
  go get github.com/prometheus/prometheus/storage/remote && \
  go build server.go

# Metadata
LABEL org.label-schema.build-date=$BUILD_DATE \
  org.label-schema.name="Prometheus remote server" \
  org.label-schema.description="Prometheus remote server" \
  org.label-schema.url="https://github.com/jecnua/prom-remoteserver" \
  org.label-schema.vcs-url=$VCS_URL \
  org.label-schema.vcs-ref=$VCS_REF \
  org.label-schema.version=$VERSION \
  com.jecnua.docker.dockerfile="/Dockerfile" \
  com.jecnua.license="MIT"

ENTRYPOINT [ "/go/server" ]
