---
source: Google Drive / GitHubリポジトリ横断レビュー_20260621 (translated)
license: CC-BY 4.0
author: 齋藤みつる (fusamofu) + ChatGPT (review assist)
version: 0.1.0
status: draft
---

# 800-Series: Operator Sovereignty Recovery System

## Repositories

| Repo | Role | Link |
|---|---|---|
| OND800 | Shooting cockpit | https://github.com/HIPSTAR-IScompany/OND800 |
| FAN800 | Physical effects funnels | https://github.com/HIPSTAR-IScompany/FAN800 |
| SAO800 | Livestream mothership extension | https://github.com/HIPSTAR-IScompany/SAO800 |
| PSYCHO-Py800MCP | Instrument MCP | https://github.com/HIPSTAR-IScompany/PSYCHO-Py800MCP |

---

## The Philosophy: Taking Back Ownership

The 800-series runs on one idea:

Shooting, livestreaming, effects production, and measurement — these normally scatter across staff, SaaS vendors, equipment manufacturers, and external labs.
The 800-series pulls all of that back **into the operator's own hands.**

```
OND800            = ownership of the shooting space
FAN800            = ownership of the physical effects space
SAO800            = ownership of the livestream mothership and SaaS failover
PSYCHO-Py800MCP   = ownership of measurement and experiment logs
```

One-line pitch:

> The 800-series is a local-first distributed cockpit system — lets a solo operator
> run multi-camera production, physical effects, OBS processing, and instrument measurement
> without a crew.

---

## OND800: Shooting Cockpit

A mech-style cockpit[^1] built around Raspberry Pi 5.
Handles NDI multi-camera control, OBS automation, and BLE event distribution to FAN800.

**Goal:** Put the operator back in command of their own production space.
While performing, one hand handles NDI multi-camera switching, BLE IoT funnel deployment,
and RTMP stream switching.

Strengths:
- Clear purpose — the vision maps directly to the technical stack
- Strong layer separation: SaaS / OBS / OND800 / FAN800 stay clearly divided
- `docs/interface_spec.md` acts as the single source of truth for FAN800 and SAO800 — prevents spec drift

[^1]: "Mech-style cockpit" references Mobile Suit Gundam. The operator controls the entire rig from a single pilot seat.

---

## FAN800: Physical Effects Funnels

Autonomous effects IoT platform on ESP32.
Receives event language from OND800 via BLE GATT, then drives lights, pyro, MIDI, and DMX autonomously.
If OND800 goes down, FAN800 keeps looping. FAN800 is the final physical safety line.

**Idea:** Replace the human crew with ESP32.[^2]
The stage assistant, the lighting board, the MIDI triggers, the DMX controller — all firmware.

Design highlights:
- Clean responsibility split between BLE and internal clock (BLE distributes rules; real-time timing stays in FAN800's internal RTC)
- Physical safety at the edge — even if upstream goes rogue, the endpoint can reject

[^2]: "Funnels" — also a Gundam reference. Autonomous weapons platforms that operate independently from the pilot.

---

## SAO800: Livestream Mothership Extension

Parasites on OBS. While OND800 is the operator's cockpit, SAO800 runs in the back — handling heavy compute, arsenal builds, failover control, and AI offload.

Handles:
- RTSP → NDI bridging (via GStreamer)
- BPM analysis
- NSFW sanitize (local edit converting to SFW output)
- AI offload
- Failover routing

Design highlights:
- Zero added cognitive load for OND800 (OND800 sends a slot number; SAO800 handles the rest)
- Parasites on OBS — doesn't build its own renderer

---

## PSYCHO-Py800MCP: Instrument MCP

Hooks oscilloscopes, logic analyzers, webcams, and microscopes into MCP —
so AI gets eyes on waveforms.

```
Human handles:  probing, GND connection, pressing Start once
AI handles:     waveform capture, FFT analysis, schematic cross-reference, next measurement point
```

Design highlights:
- "Accidents happen. That's in the design." — the spec says it plainly
- Evidence preservation is built in: HDF5 waveforms, SQLite logs, approval logs

---

## Local-First Architecture

SaaS is useful kit — not life support.
NDI, BLE, USB-MIDI, HDF5, SQLite, local LLM, OBS, GStreamer — the stack keeps running
even if the network or SaaS goes dark.
Minimum viable solo launch stays intact.

---

## The Metaphors Are the Spec

Mech cockpit, funnels, mothership, "waveform eyes" — these aren't decoration.
They're **cognitive UI for responsibility separation.**

```
OND800           = mech-style cockpit (operator's body extension)
FAN800           = funnels (autonomous physical effects units)
SAO800           = mothership (absorbs heavy work in the back)
PSYCHO-Py800MCP  = waveform eyes (AI observation and measurement implementation)
```

---

*ZeroRoomLab / @K_chachamaru — CC-BY 4.0 / Apache 2.0*
