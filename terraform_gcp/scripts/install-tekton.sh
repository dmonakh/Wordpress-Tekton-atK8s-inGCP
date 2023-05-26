#!/bin/bash

kubectl apply --filename \
https://storage.googleapis.com/tekton-releases/pipeline/latest/release.yaml

# Get the tar.xz
curl -LO https://github.com/tektoncd/cli/releases/download/v0.31.0/tkn_0.31.0_Linux_x86_64.tar.gz
# Extract tkn to your PATH (e.g. /usr/local/bin)
sudo tar xvzf tkn_0.31.0_Linux_x86_64.tar.gz -C /usr/local/bin/ tkn

tkn hub install task git-clone --version 0.6

tkn hub install task buildah --version 0.3

tkn hub install task kubernetes-actions --version 0.2