from golang:1.7.3

COPY code/server.go /go/server.go

RUN go get github.com/golang/snappy && \
  go get github.com/golang/protobuf/proto && \
  go get github.com/prometheus/common/model && \
  go get github.com/prometheus/prometheus/storage/remote && \
  go build server.go

ENTRYPOINT [ "/go/server" ]
