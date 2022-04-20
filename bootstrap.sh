#!/bin/bash

set -o pipefail

echo "Starting boostrap off cluster"
echo

echo -n "Deploying GitOps Operator"
oc apply -k bootstrap/gitops > /dev/null 2>&1

until oc get deployment -n openshift-gitops openshift-gitops-server 2>/dev/null >/dev/null; do
    echo -n '.'
    sleep 1
done
echo
oc wait --for=condition=Available -n openshift-gitops deployment/openshift-gitops-server

echo "OpenShift GitOps is ready!"


echo -n "Deploying Sealed Secrets"
oc apply -k bootstrap/sealed-secrets > /dev/null 2>&1

