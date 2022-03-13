# Openshift ArgoCD Setup and Examples
This repository contains setup and example for ArgoCD on openshift


## Bootstrap folder
The folder [bootstrap](bootstrap) contains a kustomize etupfor installing the GitOps operator, the overlay folder cluster-admin adjust the permissions for the default instance, so that is has full admin access on the cluster, and you can adjust cluster configuration settings.

Apply with:

```
oc apply -k overlays/cluster-admin
```

## Sealed secrets
See the [github repo](https://github.com/bitnami-labs/sealed-secrets).
The [sealed secrets operator](https://github.com/disposab1e/sealed-secrets-operator-helm) is deprecated, so installation with OLM is not feasible.

The directory [sealed-secrets](sealed-secrets) contains the installation, the base contains the ```controller.yaml``` which you can find on the release page of sealed-secrets.
The directory ```overlay/openshift``` contains the adjustments needed to get the sealed-secrets controller to work on openshift.

```
oc apply -k overlays/openshift
```

Install the kubeseal client.
Check the [releases page](https://github.com/bitnami-labs/sealed-secrets/releases) and get the stable version matching your install

## Test sealed secrets
The directory [sealed-secret-test](sealed-secret-test), contains a simple test to test the sealed secrets.
