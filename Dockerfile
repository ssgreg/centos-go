FROM centos:7
MAINTAINER me@ssgreg.com

ENV VERSION 1.9.1
ENV FILE go$VERSION.linux-amd64.tar.gz
ENV URL https://storage.googleapis.com/golang/$FILE
ENV SHA256 07d81c6b6b4c2dcf1b5ef7c27aaebd3691cdb40548500941f92b221147c5d9c7

ENV GOPATH /go
ENV PATH $GOPATH/bin:/usr/local/go/bin:$PATH

RUN \
    set -ex && \
    yum -y update && \
    yum -y install git && \
    yum -y clean all && \
    curl -OL $URL && \
	echo "$SHA256  $FILE" | sha256sum -c - && \
	tar -C /usr/local -xzf $FILE && \
	rm $FILE && \
    mkdir -p "$GOPATH/src" "$GOPATH/bin"
  
WORKDIR $GOPATH
