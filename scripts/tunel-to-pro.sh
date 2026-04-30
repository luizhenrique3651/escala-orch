#!/bin/bash
# tunnel-air.sh - Abre túneis para Postgres e Sonar no Air

USER="luiz"
REMOTE_IP="10.0.1.3"

echo "----------------------------------------------------"
echo "🚀 Iniciando Túnel SSH para o MacBook Pro..."
echo "📡 API: localhost:8080 -> 10.0.1.3:8080"
echo "----------------------------------------------------"
echo "📌 Mantenha este terminal aberto (ou use Ctrl+C para encerrar)"

# O comando SSH com as duas portas
ssh -L 8080:localhost:8080 $USER@$REMOTE_IP -N