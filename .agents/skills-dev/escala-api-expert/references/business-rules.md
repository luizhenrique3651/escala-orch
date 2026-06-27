# Escala API Business Rules

## Overview
This reference guide details the project's core business rules and validation logic.

## 1. Saturday Rule (The Golden Rule)
- All classes and schedule entries MUST occur only on Saturdays.
- Field: `java.time.LocalDate`
- Validation: `DayOfWeek.SATURDAY`
- For date calculation, use `TemporalAdjusters.nextOrSame(DayOfWeek.SATURDAY)`.

## 2. Volunteer Capacity Rule
- Every 'EscalaDia' must contain between 4 and 8 volunteers.
- Validation: Trigger `CapacityViolationException` if counts are outside this range.
- Service: Use `CapacityGuard.validate(int count)` for centralized checks.

## 3. Volunteer Immutability Rule
- Deletion of volunteers is forbidden if they are scheduled in future classes.
- Verification: Use `EscalaRepository.existsByVoluntarioIdAndDataAfter(Long voluntarioId, LocalDate date)` before deletion.

## 4. Balancing Requirement
- New schedules must prioritize volunteers with fewer previous allocations in the period.
- Implementation: Use `ScheduleGenerationService` with frequency mapping.
