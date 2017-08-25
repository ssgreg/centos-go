FROM centos:7
MAINTAINER me@ssgreg.com

ENV VERSION 1.9
ENV FILE go$VERSION.linux-amd64.tar.gz
ENV URL https://storage.googleapis.com/golang/$FILE
ENV SHA256 d70eadefce8e160638a9a6db97f7192d8463069ab33138893ad3bf31b0650a79

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
