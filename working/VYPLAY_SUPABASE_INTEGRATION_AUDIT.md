# VyPlay — Supabase Connection & Integration Audit (Phase 6)

Date: 2026-11-19

## What the Freebuff connection actually provides

The connected account is `supabase_rapic-exist`. Querying it:

| Call | Result |
|---|---|
| `SUPABASE_LIST_ALL_PROJECTS` | `{"details": []}` — **zero accessible projects** |

Consequences:

- No project reference could be obtained, so `SUPABASE_LIST_TABLES`,
  `SUPABASE_GET_TABLE_SCHEMAS`, `SUPABASE_RUN_READ_ONLY_QUERY` and
  `SUPABASE_LIST_DATABASE_BRANCHES` cannot be called (all require a `project_ref`
  matching `^[a-z]{20}$`).
- No schema, table, policy, function or storage bucket was inspected, because none is reachable
  through this connection.
- Nothing was created, modified or deleted. No keys were read, printed or stored.

This is a read-only capability finding, not an error in the app.

## What the Flutter repository actually contains

A repository-wide case-insensitive search for `supabase` returns **0 matches**:

- no `supabase_flutter` in `pubspec.yaml`
- no `Supabase.initialize(...)` anywhere
- no table, RPC, storage or auth usage

**VyPlay is not integrated with Supabase in any way today.** The Freebuff connection is an
account-level capability only; it does not connect the application.

## Preserved constraints for any future integration

- The local Drift database (`lib/infrastructure/database/database.dart`, `vyplay.db`) stays the
  source of truth; Supabase would be an optional sync layer only.
- The no-login experience stays intact; anonymous local use must keep working with no network.
- No service-role key may ever ship in the Flutter app. Only a user-scoped anon key with RLS.
- No video streaming through Supabase; media URLs come from the extractor.

## Recommended future uses (not implemented)

1. Optional, user-initiated settings/profile backup (explicit export/import, not automatic).
2. Optional cross-device sync of saved videos and subscriptions, gated behind a signed-in,
   user-owned account with RLS keyed on `auth.uid()`.
3. Public, read-only configuration (e.g. instance lists) cached by the app.

## Status

`NOT IMPLEMENTED` — connection inspected, zero projects visible, zero code references.
