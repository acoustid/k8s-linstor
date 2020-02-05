# Delete orphaned Linstor volumes

The Linstor CSI plugin sometimes leaves orphaned volumes in Linstor. This is a hacky way to delete them:

```bash
kubectl get pv  | grep '^pvc-' | awk '{ print $1 }' | sort > pv-in-kube.txt
kubectl -n linstor exec -ti deploy/linstor-controller -- linstor vd list -p | grep '^| pvc-' | awk '{ print $2 }' | sort > pv-in-linstor.txt
diff -u pv-in-kube.txt pv-in-linstor.txt | grep '^+pvc-' | sed 's/^+//' > pv-to-delete-from-linstor.txt
for name in $(cat pv-to-delete-from-linstor.txt); do kubectl -n linstor exec -ti deploy/linstor-controller -- linstor vd delete $name 0; done
```
