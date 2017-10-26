FROM centos:7.4.1708
MAINTAINER me@ssgreg.com

ENV VERSION 1.9.2
ENV FILE go$VERSION.linux-amd64.tar.gz
ENV URL https://storage.googleapis.com/golang/$FILE
ENV SHA256 de874549d9a8d8d8062be05808509c09a88a248e77ec14eb77453530829ac02b

ENV GOPATH /go
ENV PATH $GOPATH/bin:/usr/local/go/bin:$PATH

RUN \
    set -ex && \
    yum -y update && \
    yum -y install git rpm-build  && \
    yum -y clean all && \
    curl -OL $URL && \
	echo "$SHA256  $FILE" | sha256sum -c - && \
	tar -C /usr/local -xzf $FILE && \
	rm $FILE && \
    mkdir -p "$GOPATH/src" "$GOPATH/bin"
  
WORKDIR $GOPATH
