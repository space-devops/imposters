FROM alpine:3.17

WORKDIR /init/mountebank

RUN apk update &&\
    apk add curl

COPY definition/ ./definition
COPY publish/ ./

ENTRYPOINT ["./publish.sh"]
