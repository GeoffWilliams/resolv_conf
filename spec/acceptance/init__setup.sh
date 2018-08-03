#!/bin/bash
cat > /etc/resolv.conf <<END
search old broken
nameserver 40.0.0.1
nameserver 40.0.0.2
END
