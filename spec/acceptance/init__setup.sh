#!/bin/bash
cat > /etc/resolv.conf.test <<END
search old broken
nameserver 40.0.0.1
option "ruh roh"
nameserver 40.0.0.2
END
