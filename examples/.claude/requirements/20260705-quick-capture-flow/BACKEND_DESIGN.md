# Quick Capture Flow - Backend Design

## Summary

Use mock backend responses for the demo. A real implementation would expose parse and confirm endpoints.

## API And Contracts

- `POST /ai/parse`: accepts raw text and returns a structured preview.
- `POST /ai/confirm`: accepts the confirmed preview and returns created note/task ids.

## Backend Validation

- Contract tests should cover note-only, task-only, mixed, and unknown input.
