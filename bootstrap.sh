#!/bin/bash

set -o pipefail

CLUSTER_NAME=$1

if [[ -z ${CLUSTER_NAME} ]]; then
    echo "USAGE: ${0} CLUSTER_NAME"
    exit 1
fi

echo "Starting boostrap off cluster"
echo

echo -n "Deploying GitOps Operator"
oc apply -k bootstrap/gitops

until oc get deployment -n openshift-gitops openshift-gitops-server 2>/dev/null >/dev/null; do
    echo -n '.'
    sleep 1
done
echo
oc wait --for=condition=Available -n openshift-gitops deployment/openshift-gitops-server

echo "OpenShift GitOps is ready!"

echo -n "Deploying the applicationset of applicationsets"
oc apply -k bootstrap/bootstrap-as/overlays/${CLUSTER_NAME}
