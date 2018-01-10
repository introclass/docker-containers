#!/bin/bash
token=`cat /run/secrets/kubernetes.io/serviceaccount/token`
curl https://${KUBERNETES_SERVICE_HOST}:${KUBERNETES_SERVICE_PORT} --cacert /run/secrets/kubernetes.io/serviceaccount/ca.crt -H "Authorization: Bearer $token"
