FROM golang

RUN go get google.golang.org/api/gmail/v1

RUN go get golang.org/x/oauth2/google

RUN go get golang.org/x/oauth2

RUN go get github.com/cloudevents/sdk-go

RUN go get github.com/gorilla/mux

WORKDIR /go/src/github.com/oms-services/gmail

ADD . /go/src/github.com/oms-services/gmail

RUN go install github.com/oms-services/gmail

ENTRYPOINT gmail

EXPOSE 3000