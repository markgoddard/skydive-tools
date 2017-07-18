#FROM stackhpc/centos-binary-base:5.0.0.0
FROM centos:7

ENV GOPATH /go
RUN yum -y install \
    git \
    golang \
    libpcap-devel \
    libxml2-devel \
    make \
    unzip
ADD https://github.com/skydive-project/skydive/archive/master.tar.gz /skydive.tar.gz
RUN mkdir -p $GOPATH/src/github.com/skydive-project \
    && tar -xzf /skydive.tar.gz -C /$GOPATH/src/github.com/skydive-project \
    && mv /$GOPATH/src/github.com/skydive-project/skydive{-master,} \
    && cd $GOPATH/src/github.com/skydive-project/skydive \
    && curl -OL https://github.com/google/protobuf/releases/download/v3.2.0/protoc-3.2.0-linux-x86_64.zip \
    && unzip protoc-3.2.0-linux-x86_64.zip -d protoc3 \
    && export PATH=$(pwd)/protoc3/bin:$GOPATH/bin/:$PATH \
    && make install \
    && rm -rf $GOPATH/src
