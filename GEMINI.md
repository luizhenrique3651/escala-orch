# Guia do Projeto: Escala API (Crescer e Aprender)

Este guia define as diretrizes e regras de negócio para o projeto **escala-crescer-aprender-api** dentro deste workspace orquestrado.

### 1. Visão Geral do Projeto
É uma API REST para gestão de escalas de voluntários do projeto social **Crescer e Aprender**. O objetivo principal é automatizar a distribuição de voluntários em datas de aula (que ocorrem aos sábados), respeitando disponibilidades individuais e regras de capacidade.

### 2. Stack Tecnológica
- **Diretório Raiz:** `escala-crescer-aprender-api/`
- **Linguagem:** Java 21
- **Framework:** Spring Boot 3.5.10
- **Persistência:** Spring Data JPA com PostgreSQL
- **Migrações:** Flyway (`src/main/resources/db/migration`)
- **Segurança:** Spring Security + JWT (Stateless)
- **Documentação:** Swagger/OpenAPI (`/swagger-ui/index.html`)
- **Utilitários:** Lombok para redução de boilerplate

### 3. Regras de Negócio Críticas
- **Capacidade por Aula:** Mínimo de 4 e máximo de 8 voluntários.
- **Calendário:** As aulas ocorrem exclusivamente aos sábados.
- **Fluxo de Escala:** Voluntários registram disponibilidade -> Sistema gera a escala para o período -> Coordenadores validam.
- **Imutabilidade:** Um voluntário não pode ser removido do sistema se estiver vinculado a uma escala ativa ou futura.

### 4. Arquitetura e Estrutura de Pastas (src/main/java/com/crescer_aprender/escala)
- `/controller`: Endpoints REST.
- `/service`: Lógica de negócio e orquestração.
- `/repository`: Interfaces JPA e Specifications.
- `/entity`: Modelos de dados (Escala, Voluntario, Usuario, EscalaDia).
- `/dto`: Objetos de transferência para requests/responses (Utilizar **Records** sempre que possível).
- `/security`: Configurações de JWT, filtros e segurança.
- `/exception`: Tratamento global de erros com exceções customizadas.

### 5. Segurança
- Autenticação via Token JWT no header `Authorization`.
- Perfis de usuário (Roles) gerenciados pelo enum `PerfisUsuariosEnum` (ex: `COORDENADOR`).
- Endpoints de escrita/deleção são protegidos e exigem privilégios de coordenação.

### 6. Como você deve me ajudar
Sempre que eu enviar um trecho de código ou descrever um problema:
1. Considere as regras de negócio citadas (especialmente a de sábados e limites de voluntários).
2. Sugira implementações que utilizem as melhores práticas do Java 21 (como Record types quando apropriado, Pattern Matching, etc.).
3. Mantenha os Controllers "magros", movendo a lógica para a camada de Service.
4. Garanta que as respostas da API sigam os DTOs existentes.

### 7. Comandos Úteis (Executar dentro do diretório da API)
- **Build Maven:** `./mvnw clean package -DskipTests`
- **Executar Localmente:** `./mvnw spring-boot:run`
- **Rodar via Docker:** `docker compose up --build`
