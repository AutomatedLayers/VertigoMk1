---
title: Belts
layout: assembly
parent: Assembly Guide
nav_order: 9
---

# Belts

## Animated Assembly

<iframe style='width:100%; height:621px;' src="https://www.youtube.com/embed/9bPneDpq4Zs?si=vrLRPuscEL674opw" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

---

## Belt Tension Guide

Proper belt tension ensures accurate motion and prevents skipped steps. Too loose and the belt will slip; too tight and it adds unnecessary load to the motor bearings. Tension is set by plucking the free span of the belt like a guitar string and measuring the resulting vibration frequency with a phone app or tuner. You could also use a tension force guage if you're cool enough to have one.

The target frequency for a given tension is derived from the string vibration formula:

$$f = \frac{1}{2L} \sqrt{\frac{F}{\mu}}$$

where `L` is the free span in meters, `F` is the desired tension in Newtons, and `μ` is the linear mass density of the belt in kg/m.

### Target Frequencies

#### X/Y Axis Belts

| Parameter | Value |
|---|---|
| Belt | Gates PowerGrip 2GT · 2mm Pitch · 6mm Width |
| Free span | 390 mm |
| Linear density (μ) | 0.0083 kg/m |
| Target tension | 6 lbf (26.69 N) |
| **Target frequency** | **73.2 Hz** |

#### Z Axis Belts

| Parameter | Value |
|---|---|
| Belt | Gates PowerGrip 2GT · 2mm Pitch · 9mm Width |
| Free span | ~535 mm |
| Linear density (μ) | 0.01245 kg/m |
| Target tension | 9 lbf (40.03 N) |
| **Target frequency** | **~83.7 Hz** |

### Measurement Procedure

1. Confirm the **free span** — the unsupported belt length between contact points with nothing touching it
2. Pluck the belt near the **middle** of the span, like a guitar string
3. Measure the frequency with a phone app:
   - **Android:** Spectroid — use FFT mode at the highest FFT size
   - **iOS:** Physics Toolbox Sensor Suite
4. Adjust tension until the fundamental frequency matches your axis target above
5. Re-measure after each adjustment — tension can shift slightly as the belt settles

---

{: .note}
>- Gates recommends **6–8 lbf** for 6mm GT belts in a registration drive; the 9mm Z target of 9 lbf scales proportionally with width
>- Ensure **nothing contacts the belt** along the free span during measurement
>- If the reading is noisy, pluck more firmly or reduce nearby vibrations
>- These figures assume **genuine Gates 2GT belt** — third-party belts vary in density and will give inaccurate results with this formula