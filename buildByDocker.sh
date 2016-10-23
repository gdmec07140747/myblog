#!/bin/bash
docker run --rm -v /var/www/go/src/myblog:/go/src/myblog  -w /go/src/myblog go go build -o myblog main.go

