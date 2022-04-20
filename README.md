# Openshift ArgoCD Setup and Examples
This repository contains setup and example for ArgoCD on openshift


## Bootstrap folder
The folder [bootstrap](bootstrap) contains a kustomize etupfor installing the GitOps operator, the overlay folder cluster-admin adjust the permissions for the default instance, so that is has full admin access on the cluster, and you can adjust cluster configuration settings.

Run the script ```./bootstrap.sh```

## Test sealed secrets
Install the kubeseal client.
Check the [releases page](https://github.com/bitnami-labs/sealed-secrets/releases) and get the stable version matching your install
The directory [sealed-secret-test](sealed-secret-test), contains a simple test to test the sealed secrets.
