# Guia de Importação de Contexto: Escala API (MacBook Air)

Este documento contém os passos para restaurar as **Skills**, o **Contexto de Negócio** e a **Memória do Agente** em um novo computador.

---

## 1. O que você precisa copiar (Arquivos Físicos)

Para que o novo Gemini CLI reconheça o projeto, você DEVE copiar estas pastas do seu computador atual para o MacBook Air:

1.  **Pasta do Projeto**: Todo o diretório `escala-orch` (onde estão o código e a pasta `.gemini/` interna).
2.  **Pasta de Logs (Opcional)**: Se quiser manter o histórico exato do chat, copie o conteúdo de `~/.gemini/logs/` (na sua pasta de usuário) para o mesmo local no Mac.

---

## 2. Restaurando as Skills no MacBook Air

Após baixar o projeto no Mac, abra o terminal na pasta raiz e execute:

```bash
# 1. Recarregue o sistema de skills para detectar a pasta .gemini local
/skills reload

# 2. Verifique se a skill 'escala-api-expert' aparece na lista
/skills list
```

Se ela não aparecer, force a instalação local:
```bash
gemini skills install .gemini/skills-dev/escala-api-expert.skill --scope workspace
/skills reload
```

---

## 3. Prompt de Restauração de Memória (Primeira Mensagem)

Ao iniciar a primeira conversa no MacBook Air, envie o texto abaixo para alinhar o meu "estado mental" com as últimas implementações:

```markdown
# RESTAURAÇÃO DE CONTEXTO: ESCALA API
Estou retomando o desenvolvimento no meu MacBook Air. 

### Status Atual do Projeto:
- **Infraestrutura**: SonarQube rodando em Docker com persistência em PostgreSQL. Script 'run-analysis.sh' configurado.
- **Qualidade**: Cobertura subiu para 55%+ com testes unitários em todos os Controllers e UsuarioService.
- **Regras de Negócio**: Skills 'CapacityGuard', 'SaturdayValidator' e 'ScheduleGeneration' implementadas e validadas.
- **Stack**: Java 21, Spring Boot 3.5.10.

### Sua Missão:
Continue atuando como o Engenheiro Sênior do projeto. A skill 'escala-api-expert' está instalada e deve ser usada como guia para todas as próximas tarefas (Sábados, 4-8 voluntários, Records, etc.).

### Próximo Objetivo:
Atingir os 80% de cobertura de testes.

Confirme se o contexto foi recuperado e estamos prontos.
```

---

## 4. Checklist Técnico (No MacBook Air)

Antes de rodar o código, certifique-se de:
1.  Ter o **Docker Desktop** instalado e rodando.
2.  Ter o **Java 21** instalado (`java -version`).
3.  Executar `docker compose up -d` dentro de `escala-crescer-aprender-api` para subir o banco e o Sonar.
4.  Testar o script de análise: `./run-analysis.sh`.

---
**Guia gerado pelo Gemini CLI em 26/04/2026.**
