FROM golang:latest
ENV CGO_ENABLED 0
ENV REPO github.com/awslabs/amazon-ecr-credential-helper/ecr-login/cli/docker-credential-ecr-login
RUN go get -u $REPO

FROM containrrr/watchtower:latest
COPY --from=0 /go/bin /go/bin
ENV PATH="/go/bin:${PATH}"
