---
source: Downloads/2026-06-15_pi5-setup.md
license: CC-BY 4.0
author: 齋藤みつる (fusamofu)
version: 0.1.0
fold_signature: ψ → ∇φ → λ → Q
---

# OND800 Pi5 Initial Setup Log — 2026-06-15

## Status
- Pi5 (`ond@pi5-ond.local`): Raspberry Pi OS Lite (64-bit) flashed, SSH connected
- Password auth active; keypair creation planned for security hardening phase
- Heatsink: CPU with thermal compound, RP1/PMIC(Renesas)/Wi-Fi with thermal pad
- Wi-Fi unused — wired Ethernet only

## Setup Steps (via Claude Code on Pi5)

### 1. Locale fix (optional, low priority)
```bash
sudo apt-get install -y locales-all
sudo dpkg-reconfigure locales
```
Select ja_JP.UTF-8. Not required for operation — defer if needed.

### 2. System update + base tools
```bash
sudo apt update && sudo apt upgrade -y
sudo apt install -y git build-essential cmake pkg-config
sudo apt install -y python3-pip python3-venv python3-dev
sudo apt install -y v4l-utils
sudo apt install -y gstreamer1.0-tools gstreamer1.0-plugins-base \
  gstreamer1.0-plugins-good gstreamer1.0-plugins-bad \
  gstreamer1.0-plugins-ugly python3-gst-1.0
```

### 3. Claude Code on Pi5
- Check Node.js version requirements, then `npm install -g @anthropic-ai/claude-code`

### 4. Clone repo
```bash
git clone https://github.com/saitoomituru/OND800.git
cd OND800
```
`/ansible` in README is the planned home for Pi5 setup playbooks.

## Season 1 Goal
Minimum unit: power on → auto-detect USB cameras via udev/v4l2 → stream each at max resolution/fps as NDI.

### Key Technical Questions
- Does GStreamer `ndisink` build/run on Pi5 ARM64? (NDI SDK ARM64 support status)
- If yes: Python as process manager, launching per-camera GStreamer pipelines as subprocesses (process isolation — one dead camera doesn't affect others)

### Architecture
```
v4l2-ctl / pyudev    → camera detection + hotplug
GStreamer + ndisink  → camera → NDI (per process)
LVGL (C)             → operator panel (HyperPixel 4.0, separate process)
libwebsockets        → obs-websocket bridge
Python               → orchestration (detect → spawn+manage, loose coupling via local HTTP/WS)
```

## Hardware Notes
- Pi5 CPU(BCM2712)/RP1/PMIC(Renesas) heatsink installed
- Battery HAT: use Pi5-compatible model (PiSugar 3 series, USB-C PD input)
  Pi4-generation UPS HATs may have insufficient power draw

---

*ZeroRoomLab / @K_chachamaru — CC-BY 4.0*
