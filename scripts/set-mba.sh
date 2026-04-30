#!/bin/bash
# set-mba.sh - Direciona o Docker para o MacBook Air

# Troca o contexto
docker context use mba-infra

echo "----------------------------------------------------"
echo "✅ Contexto Docker alterado para: MacBook Air"
echo "💡 Dica: Agora você pode fechar o Docker Desktop no seu Pro para liberar RAM."
echo "----------------------------------------------------"