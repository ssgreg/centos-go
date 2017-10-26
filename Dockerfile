FROM centos:7.4.1708
MAINTAINER me@ssgreg.com

ENV VERSION 1.8.5
ENV FILE go$VERSION.linux-amd64.tar.gz
ENV URL https://storage.googleapis.com/golang/$FILE
ENV SHA256 4f8aeea2033a2d731f2f75c4d0a4995b357b22af56ed69b3015f4291fca4d42d

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
