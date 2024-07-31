#!/bin/sh
whoami
if [ -d /opt/custom-certificates ]; then
  echo "Trusting custom certificates from /opt/custom-certificates."
  export NODE_OPTIONS=--use-openssl-ca $NODE_OPTIONS
  export SSL_CERT_DIR=/opt/custom-certificates
  c_rehash /opt/custom-certificates
fi

chown root:docker /var/run/docker.sock 

if [ "$#" -gt 0 ]; then
  # Got started with arguments
  exec runuser -u node n8n "$@"
else
  # Got started without arguments
  exec runuser -u node n8n
fi