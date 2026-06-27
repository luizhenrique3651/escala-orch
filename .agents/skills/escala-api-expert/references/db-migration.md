# DB Migration Standards (Flyway + PostgreSQL)

## Overview
This reference guide ensures all database changes follow the project's Flyway migration standards.

## Script Naming
- Use the pattern: `V[YYYYMMDDHHMMSS]__description.sql` (e.g., `V202404191030__add_phone_to_voluntario.sql`).
- Location: `escala-crescer-aprender-api/src/main/resources/db/migration/`

## Rules
1. **Lowercase**: All table and column names must be `snake_case`.
2. **PostgreSQL Compatibility**: Use `SERIAL` or `BIGSERIAL` for IDs, `TIMESTAMP` for dates.
3. **No DDL Auto**: Never rely on `hibernate.ddl-auto`. Always generate the SQL script after modifying an `@Entity`.

## Example Migration Template
```sql
-- V[TIMESTAMP]__create_example_table.sql
CREATE TABLE example (
    id BIGSERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```
