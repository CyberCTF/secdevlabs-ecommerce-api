# Upstream's deployments/api.Dockerfile with these changes: the sources are copied from app/app/
# (upstream's build context is the app folder); the environment of upstream's
# deployments/docker-compose.yml is baked in, with a fixed database user and password where
# upstream's `make install` (app/scripts/generate-passwords.sh) writes random ones to
# deployments/dockers.env; the program is compiled once at build time so `go run` starts quickly
# and offline; and the compose command (`go run server.go`) is the CMD.
FROM docker.io/library/golang:1.14

WORKDIR /go/src/github.com/globocom/secDevLabs/owasp-top10-2021-apps/a1/ecommerce-api/app

COPY app/app/go.mod app/app/go.sum ./
RUN go mod download

COPY app/app/ ./

ENV GOPATH=/go/ \
    API_PORT=10005 \
    MONGO_HOST=mongodb \
    MONGO_DATABASE_NAME=DB \
    MONGO_PORT=27017 \
    MONGO_TIMEOUT=60 \
    MONGO_DATABASE_USERNAME=User20218841 \
    MONGO_DATABASE_PASSWORD=Pass11973052

RUN go build -o /dev/null .
CMD ["go", "run", "server.go"]
