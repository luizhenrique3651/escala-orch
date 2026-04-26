# Java 21 Modern Development Standards

## Overview
This reference guide outlines the project's modern Java 21 coding standards.

## Records
- All DTOs (Data Transfer Objects) must use `record` syntax.
- All request/response objects must follow the record pattern for immutability and conciseness.

## Pattern Matching
- Use Pattern Matching for `instanceof` inside custom exception handlers and generic services.
- Benefit: Reduces boilerplate casting and enhances readability.

## Sequenced Collections
- Use `SequencedCollection` (like `ArrayList`, `LinkedHashSet`) when volunteer priority is needed.
- Utilize `addFirst()` and `addLast()` for explicit priority management in generation algorithms.

## Sealed Classes
- Use Sealed Classes for the domain entities if fixed hierarchies are needed (e.g., User Roles or Statuses).

## Code Style
- Use `switch` expressions instead of legacy switch statements.
- Leverage `Optional` chaining for cleaner logic.
