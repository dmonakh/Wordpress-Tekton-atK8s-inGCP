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

# create your Docker registry secret
cat > secret-sa.yml.yaml << EOM
apiVersion: v1
kind: Secret
metadata:
  name: docker-secret
  annotations:
    tekton.dev/docker-0: https://index.docker.io/
type: kubernetes.io/basic-auth
stringData:
  username: dmonakh
  password: 3!08mondy
---
apiVersion: v1
kind: ServiceAccount
metadata:
  name: docker-login
secrets:
  - name: docker-secret
EOM

kubectl apply -f secret-sa.yml  