# Security and Audit Standards (Spring Security + JWT)

## Overview
This reference guide ensures all new controllers follow the project's security and exception handling standards.

## Role Protection
- Use `@PreAuthorize("hasAuthority('COORDENADOR')")` for all write/delete operations.
- New Controllers must be reviewed for proper role assignments.

## Exception Handling
- All security-related errors must be handled via `CustomAccessDeniedHandler`.
- Use `@ResponseStatus` in custom exceptions to map to correct HTTP statuses (e.g., 403 Forbidden).

## JWT Configuration
- Tokens must be sent in the `Authorization: Bearer <TOKEN>` header.
- Stateless authentication is the project's standard.
