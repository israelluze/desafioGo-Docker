FROM golang:alpine AS builder

WORKDIR /usr/src/app
COPY . .

RUN  go build -ldflags '-s -w' hello-world.go

FROM scratch
WORKDIR /
COPY --from=builder /usr/src/app/ .

CMD [ "./hello-world" ]