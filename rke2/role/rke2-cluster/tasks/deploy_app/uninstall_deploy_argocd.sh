#!/usr/bin/bash

printf "y\n" | argocd app delete vas-aibot-scheduler
printf "y\n" | argocd app delete vas-aibot-master
printf "y\n" | argocd app delete vas-aibot-gateway
printf "y\n" | argocd app delete vas-aibot-engine
printf "y\n" | argocd app delete vas-aibot-cms
printf "y\n" | argocd app delete vas-aibot-chat-ui

printf "y\n" | argocd app delete vas-stt
printf "y\n" | argocd app delete vas-tts
printf "y\n" | argocd app delete vas-chub-tsm
printf "y\n" | argocd app delete vas-chub-sgw
printf "y\n" | argocd app delete vas-chub-consumer
printf "y\n" | argocd app delete vas-chub-cms
printf "y\n" | argocd app delete vas-chub-agw