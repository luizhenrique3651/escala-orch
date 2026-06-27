---
name: escala-api-expert
description: Especialista em arquitetura e regras de negócio da Escala API (Crescer e Aprender). Use para implementar features, refatorar código Java 21, auditar segurança (Roles), e validar regras de escala (Sábados, capacidade 4-8).
---

# Escala API Expert Skill

Este guia fornece os workflows e padrões essenciais para o desenvolvimento da **Escala API** (Projeto Crescer e Aprender).

## Workflows Principais

### 1. Alteração de Entidade e Banco de Dados
Sempre que uma `@Entity` for modificada (novo campo, nova tabela, mudança de tipo):
- Gere o script SQL Flyway seguindo os padrões em [db-migration.md](references/db-migration.md).
- Nomeie como `V[DATA_HORA]__descrição.sql`.

### 2. Implementação de Endpoints e DTOs
- Utilize **Records** para todos os novos DTOs (Requests e Responses).
- Siga os padrões do Java 21 detalhados em [java-standards.md](references/java-standards.md).
- Garanta que o Controller seja magro, movendo a lógica para o Service.

### 3. Validação de Regras de Negócio
Ao manipular datas ou escalas:
- **Regra do Sábado**: Aulas ocorrem apenas aos sábados. Veja detalhes em [business-rules.md](references/business-rules.md).
- **Regra de Capacidade**: Valide sempre o piso de 4 e teto de 8 voluntários.
- **Balanceamento**: Novos sorteios devem priorizar voluntários menos escalados.

### 4. Auditoria de Segurança
Ao criar ou atualizar Controllers:
- Verifique a proteção por Role (`COORDENADOR`) para métodos sensíveis.
- Siga o padrão de tratamento de exceções em [security.md](references/security.md).

## Referências Técnicas
- **DB Migration**: [references/db-migration.md](references/db-migration.md)
- **Segurança e Auditoria**: [references/security.md](references/security.md)
- **Regras de Negócio**: [references/business-rules.md](references/business-rules.md)
- **Java 21 Standards**: [references/java-standards.md](references/java-standards.md)
