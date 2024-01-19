#!/usr/bin/bash


kubectl delete -k /root/manifest/oss/monitoring/kube-state-metric/
kubectl delete -k /root/manifest/oss/monitoring/prometheus
kubectl delete -f /root/manifest/e2e-install/src/prom-cm.yaml -n vas-chub
kubectl delete -f /root/manifest/e2e-install/src/prom-deploy.yaml -n vas-chub
kubectl delete -f /root/manifest/e2e-install/src/prom-svc.yaml -n vas-chub
kubectl delete -f /root/manifest/e2e-install/src/prom-crb.yaml -n vas-chub
kubectl delete -f /root/manifest/e2e-install/src/prom-cr.yaml -n vas-chub
kubectl delete -f /root/manifest/e2e-install/src/otel-inst.yaml -n vas-chub
kubectl delete -f /root/manifest/e2e-install/src/otel-crb.yaml -n vas-chub
kubectl delete -f /root/manifest/e2e-install/src/otel-cr.yaml -n vas-chub
kubectl delete -f /root/manifest/e2e-install/src/otel-col.yaml -n vas-chub
kubectl delete -f /root/manifest/e2e-install/src/mbt-svcl -n vas-chub
kubectl delete -f /root/manifest/e2e-install/src/mbt-svc.yaml -n vas-chub
kubectl delete -f /root/manifest/e2e-install/src/mbt-deploy.yaml -n vas-chub
kubectl delete -f /root/manifest/e2e-install/src/mbt-cm.yaml -n vas-chub
kubectl delete -f /root/manifest/e2e-install/src/dppp-svc.yaml -n vas-chub
kubectl delete -f /root/manifest/e2e-install/src/dppp-deploy.yaml -n vas-chub
kubectl delete -f /root/manifest/e2e-install/src/dppp-cm.yaml -n vas-chub
kubectl delete -f /root/manifest/e2e-install/src/ops-svc.yaml -n vas-chub
kubectl delete -f /root/manifest/e2e-install/src/ops-deploy.yaml -n vas-chub
kubectl delete -f /root/manifest/e2e-install/src/ops-cm.yaml -n vas-chub
helm uninstall fluent-bit -n opensearch
kubectl delete -f /root/manifest/e2e-install/src/opentelemetry-operator.yaml
kubectl get ns prometheus
kubectl get all -n prometheus
kubectl delete ns prometheus