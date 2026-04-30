#!/bin/bash
# tunnel-air.sh - Abre túneis para Postgres e Sonar no Air

USER="luiz"
REMOTE_IP="10.0.1.2"

echo "----------------------------------------------------"
echo "🚀 Iniciando Túnel SSH para o MacBook Air..."
echo "📡 Postgres: localhost:5432 -> 10.0.1.2:5432"
echo "📡 SonarQube: localhost:9000 -> 10.0.1.2:9000"
echo "----------------------------------------------------"
echo "📌 Mantenha este terminal aberto (ou use Ctrl+C para encerrar)"

# O comando SSH com as duas portas
ssh -L 5432:localhost:5432 -L 9000:localhost:9000 $USER@$REMOTE_IP -N