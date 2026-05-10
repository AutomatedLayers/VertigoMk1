---
title: Belts
layout: assembly
parent: Assembly Guide
nav_order: 9
---

# Belts

## Animated Assembly

<iframe style='width:100%; height:621px;' src="https://www.youtube.com/embed/9bPneDpq4Zs?si=vrLRPuscEL674opw" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

## Belt Tension Guide

- Gates recommends **6–8 lb** for a 6mm GT belt in a registration drive (motion system)
- Ensure **nothing contacts the belt** along the span during measurement
- If the reading is noisy, pluck more firmly or reduce nearby vibrations
- The simplified formula `Hz = 28531 / span_mm` assumes genuine Gates 6mm GT3 density (0.0083 kg/m) — third-party belts may vary


**Belt:** Gates GT3 · 2mm Pitch · 6mm Width  
**Span:** 390mm · **Target Tension:** 6 lb · **Target Frequency:** 73.2 Hz

---

### The Equation

The fundamental relationship between belt tension and vibration frequency is the **string vibration formula**:

$$F = (2 \cdot L \cdot f)^2 \cdot \mu$$

Rearranged to solve for target frequency given a desired tension:

$$f = \frac{1}{2L} \sqrt{\frac{F}{\mu}}$$

| Variable | Meaning | Value |
|:---:|---|---|
| `f` | Target frequency | **73.2 Hz** |
| `L` | Free span length | **390 mm (0.390 m)** |
| `F` | Tension force | **6 lb (26.69 N)** |
| `μ` | Linear mass density | **0.0083 kg/m** (Gates 6mm GT3) |

---

### Simplified Calculation

For 6 lb of tension on a Gates 6mm GT3 belt:

$$\text{Hz} = \frac{28531}{\text{span (mm)}} = \frac{28531}{390} = \textbf{73.2 Hz}$$

---

### 🎯 Target

> Pluck the belt and tune to **73.2 Hz**

---

### Measurement Procedure

1. Confirm the **free span** — unsupported length between contact points (**390 mm**)
2. Pluck the belt near the **middle** of the span, like a guitar string
3. Measure the frequency with a phone app:
   - **Android:** Spectroid — use FFT mode at the highest FFT size
   - **iOS:** Physics Toolbox Sensor Suite
4. Adjust tension until the fundamental frequency reads **~73 Hz**
5. Re-measure after each adjustment — tension can shift slightly as the belt settles

---

