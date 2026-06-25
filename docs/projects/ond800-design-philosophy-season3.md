---
source: Downloads/OND800_design_philosophy_season3.md
license: CC-BY 4.0
author: 齋藤みつる (fusamofu) / saitoomituru (ZeroRoomLab)
version: 1.0.0
status: active
fold_signature: ψ → ∇φ → λ → Q
---

# OND800 Design Philosophy — Season 3

**Document type:** Architecture philosophy / AI agent design brief  
**Season:** Season 3 (Season 2 = multi-cam + OBS source integration testing)

This document supersedes prior implicit design assumptions in the OND800 codebase.
It encodes a philosophical upgrade: from "NDI funnel tool" to "Mobile Suit cockpit in a distributed warfare architecture."

---

## 1. System Architecture: The Gundam War Model

```
╔══════════════════════════════════════════════════════╗
║  LAYER 4: Colony Laser / Requiem / Lunar Laser       ║
║  SaaS Streaming Platforms                            ║
║  TikTok / YouTube / X Live / Twitch / Kick          ║
║  → Weapons, not destinations. Operator aims + fires. ║
╚══════════════╦═══════════════════════════════════════╝
               ↑ RTMP / SRT
╔══════════════╩═══════════════════════════════════════╗
║  LAYER 3: Archangel-class Battleship                 ║
║  OBS (macOS / Windows)                              ║
║  → Composite fire control. Optional enhancement.    ║
╚══════════════╦═══════════════════════════════════════╝
               ↑ NDI
╔══════════════╩═══════════════════════════════════════╗
║  LAYER 2: Mobile Suit — OND800                       ║
║  Raspberry Pi 5 + HyperPixel 4.0                    ║
║  → THIS IS THE COCKPIT. All pilot judgment here.    ║
╚══════════════╦═══════════════════════════════════════╝
               ↑ BLE GATT
╔══════════════╩═══════════════════════════════════════╗
║  LAYER 1: Psychomu Funnel Network — FAN800           ║
║  ESP32 BLE IoT ad-hoc mesh                          ║
║  → Autonomous sub-units. No human intervention.     ║
╚══════════════════════════════════════════════════════╝
```

| Layer | Entity | Role | Human Control |
|---|---|---|---|
| 4 | SaaS Platforms | Weapon (Colony Laser) | Aim only |
| 3 | OBS | Battleship | Crew-operated, serves cockpit |
| 2 | OND800 | Mobile Suit / Cockpit | **Full pilot authority** |
| 1 | FAN800 (ESP32) | Psychomu Funnels | Deployed autonomously |

---

## 2. Core War Philosophy

### The Trigger Principle

> The trigger is pulled by the pilot on the battlefield, not by generals in the command room.

- SaaS platforms = generals in the command room. They issue policies, bans, algorithm changes.
- OBS = the Battleship. Provides firepower. Does not make strategic decisions.
- **OND800 = where the pilot sits.** All real-time decisions happen here.

**Implementation implication:** OND800's UX must optimize for split-second pilot judgment, not deliberate menu-driven configuration.

### Failover = Weapon Switch, Not Retreat

Platform shadow-ban = Colony Laser unavailable. Switch weapon, don't abort mission.

| Platform | Weapon Type | Effective Range |
|---|---|---|
| YouTube | Colony Laser | Global, long-arc, archive-indexed |
| TikTok | Requiem | Mass surface coverage, high velocity |
| X (Twitter) | Lunar Laser | Domestic text layer, high velocity |
| DLsite / Fantia | Asteroid belt tactical | Niche precision |

### Solo Sortie Capability

OND800 must operate without the Battleship (OBS/Mac). The Battleship enhances capability but is **not a hard dependency**.

### The Colony Drop Exception

Colony Drop = viral controversy / intentional inflammatory content.  
Weapon of last resort. **Out of scope for OND800's design.**

---

## 3. UX Philosophy: Cockpit Design Principles

The operator is a **performing artist mid-act**, not a sysadmin at a desk.

UI must be:
- Operable with **one hand or minimal touch**
- **Glanceable** — state readable in under 1 second
- **Fault-tolerant** — wrong tap must not cause catastrophic state change
- **Recovery-oriented** — any error state must have a one-tap escape

Design for: **Now** / **Next** / **Abort** — not for historical data or in-flight configuration.

### Funnel Autonomy

OND800 sends **intent**, not micromanagement.

```
GOOD: OND800 sends "FIRE_SLIME_MEDIUM" → ESP32 decides timing and duration
BAD:  OND800 sends "GPIO_PIN_4_HIGH_500ms" → tight coupling, fragile
```

---

## 4. Season Roadmap

| Season | Status | Scope |
|---|---|---|
| Season 1 | ✅ Complete | NDI public stream established on Pi5 |
| Season 2 | 🔄 In Progress | Multi-cam recognition + OBS source integration |
| Season 3 | 📐 Design Phase | FAN800 BLE integration, multi-RTMP failover, solo sortie validation |

### Season 3 Target Features

1. FAN800 BLE mesh management UI — deploy, monitor, command ESP32 swarm from OND800
2. Multi-RTMP weapon profiles — presets per content type
3. Platform failover trigger — one-tap RTMP redirect
4. Solo sortie mode — confirmed operation path without OBS/Mac
5. In-flight UX hardening

---

## 5. README Philosophy Block (canonical)

```markdown
## Design Philosophy

OND800 is a Mobile Suit, not a Funnel.

The pilot sits here. The trigger is pulled here.
Not in the command room. Not by the generals.
On the battlefield, in real time.

| Layer | Entity | Role |
|---|---|---|
| Colony Laser | SaaS Platforms | Weapons. Aim and fire. Failover when unavailable. |
| Battleship | OBS (Mac / Win) | Composite fire control. Optional enhancement. |
| Mobile Suit | OND800 | Cockpit. All pilot judgment lives here. |
| Psychomu Funnels | FAN800 (ESP32 BLE mesh) | Autonomous sub-units. Speak event language. |

Platform shadow-ban = weapon switch, not retreat.
Solo sortie (without Battleship) is a supported operational mode.
Colony Drop tactics are out of scope.

Aim. Fire. Failover.
```

---

*ZeroRoomLab / saitoomituru — CC-BY 4.0*
