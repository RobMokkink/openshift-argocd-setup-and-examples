# Make sure the kubeseal client is on your system

## Create project
Make sure you are not the kubeadmin user, but a normal user, like developer(crc) and create a project, like:

```
oc new-project testseal
```

## Seal a secret
Seal the secret:

``` 
kubeseal --controller-namespace=sealed-secrets -o yaml < simple-secret.yml > sealed-simple-secret.yml
```

## Apply a sealed secret

```
oc apply -f sealed-simple-secret.yml
```

## Extract the values:

```
oc get secret simple-secret -o jsonpath="{.data.username}" | base64 -d

oc get secret simple-secret -o jsonpath="{.data.password}" | base64 -d
```
