# centos-go

[![](https://dockerbuildbadges.quelltext.eu/status.svg?organization=ssgreg&repository=centos-go)](https://hub.docker.com/r/ssgreg/centos-go/builds/)

CentOS docker image with Go

## Installation & Usage

Pull the images:

```
docker pull ssgreg/centos-go:latest
```

Run a container from the image:

```
# docker run --rm -it -v $GOPATH:/go ssgreg/centos-go
```

Build your project:

```
[root@101e5200c632 go]# cd /go/src/github.com/ssgreg/zerodt/
[root@101e5200c632 zerodt]# go build
```

## Latest version

CentOS 7.4.1708 + Go 1.9.1
[hub.docker.com](https://hub.docker.com/r/ssgreg/centos-go/)

## Previous versions

* CentOS 7.4.1708 + Go 1.9 [Link to automated build](https://hub.docker.com/r/ssgreg/centos-go/builds/bhg3y8cckzhxvuqovuljlpb/)
