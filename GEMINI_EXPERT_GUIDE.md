# Guia de Contextualização: Escala API & Skill Expert

Este documento serve para contextualizar o **Gemini Web** sobre o ecossistema do projeto **Escala API** e a sinergia com o **Gemini CLI**.

---

## 1. Fluxo de Desenvolvimento com Gemini CLI
O desenvolvimento deste projeto é auxiliado pelo **Gemini CLI**, um agente de terminal que possui acesso direto ao sistema de arquivos e ferramentas de execução (Docker, Maven, Git). 

### O Papel do Gemini CLI:
- **Execução Autônoma**: O CLI realiza refatorações, cria infraestrutura (Docker/Sonar) e executa testes.
- **Guardião de Regras**: Através de **Skills**, o CLI impede que o código desvie dos padrões Java 21 ou das regras sociais do projeto.

---

## 2. A Skill: `escala-api-expert`
Para garantir a consistência, criamos a skill `escala-api-expert` no Gemini CLI. Ela funciona como um framework de regras que eu (o agente) sigo rigorosamente.

### Atribuições da Skill:
1.  **[DB_MIGRATION]**: Monitora alterações em `@Entity` e exige scripts Flyway em PostgreSQL.
2.  **[SECURITY_CHECK]**: Audita Controllers para garantir que operações de escrita exijam a Role `COORDENADOR`.
3.  **[SATURDAY_RULE]**: Impõe que todas as aulas e escalas ocorram apenas aos **Sábados** (`DayOfWeek.SATURDAY`).
4.  **[CAPACITY_GUARD]**: Valida o limite social de **4 a 8 voluntários** por aula, lançando `CapacityViolationException` se violado.
5.  **[VOLUNTEER_IMMUTABILITY]**: Bloqueia a exclusão de voluntários vinculados a escalas futuras.
6.  **[JAVA_21_UPGRADE]**: Obriga o uso de **Records** para DTOs e **Sequenced Collections** para gestão de filas.

---

## 3. Prompt de Contextualização para Gemini Web
Utilize o prompt abaixo para alinhar o Gemini Web com o trabalho realizado pelo Gemini CLI:

```markdown
Atue como um Engenheiro de Software Sênior e DevOps especializado em Java 21 e Spring Boot 3.5. Você está auxiliando no projeto **Escala API**, que já possui um agente **Gemini CLI** operando localmente no terminal.

### Sua Missão:
Trabalhar em conjunto com o contexto gerado pelo Gemini CLI. O projeto possui a skill `escala-api-expert` que define diretrizes imutáveis.

### Contexto de Desenvolvimento:
1. **Regras de Ouro**: Aulas apenas aos SÁBADOS. Capacidade de 4-8 voluntários.
2. **Imutabilidade**: Voluntários com escalas futuras não podem ser removidos.
3. **Padrão Técnico**: DTOs devem ser Records. O banco é PostgreSQL com Flyway.
4. **Qualidade**: Já configuramos SonarQube (localhost:9000) e JaCoCo para cobertura.

### Como Interagir:
Sempre que eu trouxer uma tarefa, considere que o Gemini CLI cuidará da execução pesada (Docker, builds, commits), enquanto você deve focar na lógica sênior, sugestões de arquitetura e conformidade com as regras sociais do projeto (Skill Expert).

Você compreende seu papel neste ecossistema orquestrado?
```
