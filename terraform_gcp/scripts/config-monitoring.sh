#!/bin/bash

export GPASS=$(kubectl get secret --namespace grafana grafana -o jsonpath="{.data.admin-password}" | base64 --decode ; echo )

export PROM_IP=$(kubectl get svc -n prometheus -o jsonpath='{.items[?(@.metadata.name=="prometheus-server")].spec.clusterIP}')

cat > datasource.json << EOM
{
    "name": "My Prometheus",
    "type": "prometheus",
    "url": "http://$PROM_IP:80",
    "access": "proxy",
    "basicAuth": false,
    "isDefault": false
  }
EOM

curl -X POST -H "Content-Type: application/json" -d @datasource.json -u admin:$GPASS http://127.0.0.1:3000/api/datasources
