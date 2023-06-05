#!/bin/bash

# Install Tekton CLI
echo "Tekton CLI"
curl -LO https://github.com/tektoncd/cli/releases/download/v0.30.1/tektoncd-cli-0.30.1_Linux-64bit.deb
sudo dpkg -i ./tektoncd-cli-0.30.1_Linux-64bit.deb

echo "Install Tekton Pipelines"
# Install Tekton Pipelines
kubectl apply --filename https://storage.googleapis.com/tekton-releases/pipeline/latest/release.yaml

# Install Tekton Triggers
kubectl apply --filename https://storage.googleapis.com/tekton-releases/triggers/latest/release.yaml

# Install Tekton Operators
kubectl apply -f https://storage.googleapis.com/tekton-releases/operator/latest/release.yaml

# Install tasks from Tekton Hub
echo "install Tasks form Hub"
tkn hub install task git-clone && tkn hub install task buildah && tkn hub install task kubernetes-actions

# cat > secret-sa.yml << EOM
# apiVersion: v1
# kind: Secret
# metadata:
#   name: docker-secret
#   annotations:
#     tekton.dev/docker-0: https://index.docker.io/
# type: kubernetes.io/basic-auth
# stringData:
#   username: dmonakh
#   password: Mondy3108Dude
# ---
# apiVersion: v1
# kind: ServiceAccount
# metadata:
#   name: tekton-pipelines-controller
# secrets:
#   - name: docker-secret
# EOM

# kubectl apply -f secret-sa.yml  

cat > regsecret.yaml << EOM
kind: Secret
apiVersion: v1
metadata:
  name: regsecret
  annotations:
    tekton.dev/docker-0: https://index.docker.io/
type: kubernetes.io/basic-auth
stringData:
    username: dmonakh
    password: Mondy3108Dude
EOM

kubectl apply -f regsecret.yaml

echo "apply -f pipeline/"
kubectl apply -f pipeline/

echo "apply -f tekton/"
kubectl apply -f tekton/

kubectl create rolebinding pipeline-pvc --clusterrole=edit --serviceaccount=default:pipeline --namespace=default
kubectl create clusterrolebinding pipeline-admin --clusterrole=cluster-admin --serviceaccount=default:pipeline
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.8.0/deploy/static/provider/cloud/deploy.yaml