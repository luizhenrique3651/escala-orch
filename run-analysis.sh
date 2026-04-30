#!/bin/bash

# Script de automação para análise estática SonarQube - Escala API
# Uso: ./run-analysis.sh

# Token definitivo persistido no banco PostgreSQL
TOKEN="squ_a059ff1c7a9f806a516ce156c1d8a5bc69c6fbc3"
PROJECT_DIR="escala-crescer-aprender-api"

echo "🚀 Iniciando análise estática do projeto Escala API..."

if [ ! -d "$PROJECT_DIR" ]; then
    echo "❌ Erro: Diretório $PROJECT_DIR não encontrado."
    exit 1
fi

cd "$PROJECT_DIR"

# Executa o Maven Wrapper com o token de autenticação e gera cobertura JaCoCo
./mvnw clean verify sonar:sonar \
  -Dsonar.login=$TOKEN

if [ $? -eq 0 ]; then
    echo "✅ Análise concluída com sucesso!"
    echo "📊 Acesse o dashboard em: http://localhost:9000/dashboard?id=escala-api"
else
    echo "❌ Falha na execução da análise. Verifique se o container escala-sonar está rodando e se o banco de dados está acessível."
    exit 1
fi
