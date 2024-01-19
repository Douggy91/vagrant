#!/usr/bin/bash

kubectl delete -f /root/manifest/oss/rancher-monitoring/grafana-ingress.yaml -n cattle-monitoring-system
kubectl delete -f /root/manifest/oss/opensearch/dashboard-ingress.yaml -n opensearch
kubectl delete -k /root/manifest/oss/solr -n solr

helm uninstall rancher -n cattle-system
helm uninstall blackbox-exporter -n cattle-monitoring-system
helm uninstall redis -n redis
helm uninstall postgresql -n db
helm uninstall mariadb -n db
helm uninstall argocd -n argocd



# Namespace 제거가 안될 시, kubectl edit ns {namespace}로 진입 후, finalizer 제거
kubectl delete ns solr
kubectl delete ns cattle-moniotoring-system
kubectl delete ns redis
kubectl delete ns argocd
kubectl delete ns opensearch
kubectl delete ns db
