#!/bin/bash

# Define the Rancher server URL and API token
RANCHER_URL="https://172.26.192.122/v3"
RANCHER_TOKEN="token-rfkd4:df4vjwljfsqv6bdqf5xqxh4rkcmlm9psr8r92xnpvqj4dhvjtg98hh"
RANCHER_CONTEXT="c-kkg76:p-npzdc"

# Log in to Rancher
/usr/local/bin/rancher login --context $RANCHER_CONTEXT --token $RANCHER_TOKEN --skip-verify $RANCHER_URL

# Execute the command with Rancher kubectl
/usr/local/bin/rancher kubectl create -f /home/ccs2/test/apache-deployment.yaml --validate=false