FROM golang:latest
ENV CGO_ENABLED 0
ENV REPO github.com/awslabs/amazon-ecr-credential-helper/ecr-login/cli/docker-credential-ecr-login
RUN go get -u $REPO

FROM containrrr/watchtower:latest
LABEL org.opencontainers.image.source https://github.com/cixce/watchtower-ecr
COPY --from=0 /go/bin /go/bin
ENV PATH="/go/bin:${PATH}"
