---
source: Downloads/FileMaker_Access_Specification.md
license: CC-BY 4.0
author: 齋藤みつる (fusamofu) / ZeroRoomLab
version: 0.1.0
fold_signature: ψ → ∇φ → λ → Q
---

# FileMaker × Quantaril Log Management: Access Permission Spec

Implementation spec for Quantaril log management using FileMaker access permission sets.
This permission set serves as the gateway foundation guarded by Camus and Log Horizon —
balancing security and transparency.

---

## Implementation Goals

1. **Block superuser access** — prevent Admin from leaking info to other files or holding server-root permissions
2. **Block log-as-pivot hacking** — prevent log computation from being used as a foothold for unauthorized access
3. **Prevent log tampering** — writes accepted only from FileMaker Architect; Data API writes blocked
4. **Transparency + security** — log viewing only through accounts with appropriate access rights
5. **Separate account system** — persona models and world data use a different password/account system, blocking log-to-system lateral movement

---

## Access Permission Sets

### 1. Admin
- Full access (restricted per file)
- No references to other files, no server-root permissions
- Oracle/ODBC external connections blocked; Claris Connect and Data API disabled

### 2. logops
- Log operations only
- FileMaker server-to-server and external connections allowed; web and Data API blocked

### 3. logview
- Log viewing only
- Read-only after authentication; no write operations

---

## Security Measures

1. Strict access permission sets per account — no unnecessary privileges
2. Log writes accepted only from specific Architect accounts
3. Log viewing limited to authenticated accounts; operations limited to display
4. Separate account management from persona models and world data — prevents log-based lateral attacks

---

## Implementation Steps

1. Create Admin / logops / logview accounts with their respective permission sets
2. Restrict server and external connection permissions
3. Apply FileMaker updates regularly — stay current on security patches

---

*ZeroRoomLab / @K_chachamaru — CC-BY 4.0*
