#!/bin/bash

set -e

if [[ $UID != 0 ]]; then
    echo "Please run this script with sudo:"
    echo "sudo $0 $*"
    exit 1
fi


export GOPATH=/root/go
mkdir -p $GOPATH

go get github.com/hashicorp/consul/api
go get github.com/docopt/docopt-go

go build

mv consul-backup usr/bin
fpm -s dir -t deb -n consul-backup usr/bin/consul-backup
