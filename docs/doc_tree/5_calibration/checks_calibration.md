---
title: Checks & Calibration
layout: default
nav_order: 5
---

# Checks & Calibration

Before you get printing, there are a few things left to 'check and calibrate'. At this point, ideally you have completed:
 - the Assembly Guide up to -- but not including -- the Enclosure section,
 - the Wiring Guide, having linked back and forth from the Z Endstops, Toolhead, and Electronics Backpack sections respectively,
 - the Firmware Setup, with the ability now to access your printer via the browser. 

The **Config Reference** sections below refer to the lines in printer.cfg where the relevant pins and parameters can be found.

## Fans

### PSU Fan
This fan is internal to the 24V DC PSU and should be on when internal temperature is high or power loads are high. It has no config in printer.cfg.

### Electronics Backpack Fans 
[See important note here]({{site.url}}/{{site.baseurl}}/2_assembly/14_electronics_backpack/0_electronics_backpack.html#assembly-notes). These fans should be on when the power is on. The stock fans are not controllable, but if you switch them out, you could control them manually via a `[generic_fan]` section or based on the M8P MCU temperature using a `[temperature_fan]` section in printer.cfg. If they are loud or you want to control them, you can upgrade to 4-pin PC fans like these [Noctua 4020 PWM Fans](https://www.noctua.at/en/products/nf-a4x20-pwm#hero). Just pay attention to how the connectors are wired.

### Camera Fan
The Camera Fan should always be on. It runs on the same circuit as the logo LED, both of which are connected directly to the 24V PSU output.

### Part Cooling Fan
The three part cooling fans in the Cowl are simply called 'fan' by klipper and can be controlled via the "Miscellaneous" panel in the Mainsail Dashboard.

![]({{site.url}}/{{site.baseurl}}/assets/images/ui_fan.png)

#### Config Reference
```
[fan] # Part Cooling
pin: toolhead:gpio21
```

### Hotend Fan
The Hotend Fan should turn on when the nozzle temperature exceeds the value defined in printer.cfg. This value is 45°C by default.

#### Config Reference
```
[heater_fan hotend_fan]
pin: toolhead:gpio13
heater: extruder
heater_temp: 45.0
```

## Lights
