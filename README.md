# Openshift ArgoCD Setup and Examples
This repository contains setup and example for ArgoCD on openshift


## Bootstrap
Run the script ```./bootstrap.sh```, this will use the folder [bootstrap](boostrap) for the kustomize overlays

## Test sealed secrets
Install the kubeseal client.
Check the [releases page](https://github.com/bitnami-labs/sealed-secrets/releases) and get the stable version matching your install
The directory [sealed-secret-test](sealed-secret-test), contains a simple test to test the sealed secrets.
