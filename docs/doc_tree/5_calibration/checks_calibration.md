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
This fan is internal to the 24V DC PSU and should be on when internal temperature is high or power loads are high. It is not specified in the config.

### Electronics Backpack Fans 
[See important note here]({{site.url}}/{{site.baseurl}}/2_assembly/14_electronics_backpack/0_electronics_backpack.html#assembly-notes). These fans should be on when the power is on. The stock fans are not controllable, therefore they are not specified in the config. However, if you switch them out, you could control them manually via a `[generic_fan]` section or based on the M8P MCU temperature using a `[temperature_fan]` section in printer.cfg. If they are too loud or you want to control them, you can upgrade to 4-pin PC fans like these [Noctua 4020 PWM Fans](https://www.noctua.at/en/products/nf-a4x20-pwm#hero). Just pay attention to how the connectors are wired, and take a look at the [M8P V2 Pinout]({{site.url}}/{{site.baseurl}}/assets/images/m8pv2_pinout.webp).


### Camera Fan
The Camera Fan should always be on. It runs on the same circuit as the logo LED, both of which are connected directly to the 24V PSU output.

### Part Cooling Fan
The three part cooling fans in the Cowl operate together on the same circuit and are simply called 'fan' by klipper and can be controlled via the "Miscellaneous" panel in the Mainsail Dashboard.

![]({{site.url}}/{{site.baseurl}}/assets/images/ui_fan.png)

#### Config Reference
```
[fan] # Part Cooling
pin: toolhead:gpio21
```

### Hotend Fan
The Hotend Fan should turn on when the nozzle temperature exceeds the value defined in printer.cfg. This value is 45°C by default. We will tune the nozzle temperature control parameters later, but for now if you heat the nozzle to ~50°C, you should hear the fan spin up, feel a slight breeze on your finger behind the hotend, and see the %[fan power] value increaase in the "Miscellaneous" panel in the Mainsail Dashboard.

![]({{site.url}}/{{site.baseurl}}/assets/images/ui_hotend_fan.png)

#### Config Reference
```
[heater_fan hotend_fan]
pin: toolhead:gpio13
heater: extruder
heater_temp: 45.0
```

### Bed Fans
The fans under the bed can help heat soak the build chamber when printing materials that like that envoronment. They also help cool the bed which helps release parts before scraping. The four fans operate together on the same circuit and are called 'bed fans' in the config and can be controlled via the "Miscellaneous" panel in the Mainsail Dashboard.

![]({{site.url}}/{{site.baseurl}}/assets/images/ui_bed_fan.png)

#### Config Reference
```
[fan_generic bed_fans]
pin: PF7
```

## Lights

### VERTIGO LED
This LED at the top of the front of the printer is connected directly to the 24V PSU output, so it's not specified in the config file.

### Nozzle and Cowl Cap Logo LED
These are on the same circuit and get power from the 5V RGB output on the toolhead board, however they are wired to +5V and GND so they are not controllable or specified in the config. 
There was no more room to add pins to the Cowl pogo pin connector, so it would be difficult to change them to RGB.

### Enclosure Lights
These are called 'House Lights' in the config and controllable via the "Miscellaneous" panel in the Mainsail Dashboard.

![]({{site.url}}/{{site.baseurl}}/assets/images/ui_house_lights.png)

#### Config Reference
```
[led house_lights]
white_pin: PA4
initial_WHITE: 1.0
```

## Endstops

### Trigger Check

1. First make sure all motors are disabled, by power cycling or sending ```M84``` in the Console in Mainsail. 
2. Move the Gantry Bar to the center of the Y axis and the Toolhead to the center of the X axis. 
3. With the Bed Lever engaged, lift all four Z Joints several centimeters off the bottom of their travel. Make sure you can access and depress the switch on the X, Y, and four Z Endstops. 
4. Refresh the endstop states in Mainsail > Machine Tab > Endstops Panel > Refresh Button.
>![]({{site.url}}/{{site.baseurl}}/assets/images/ui_endstop_loc.png)
5. The states should all be 'OPEN' in the Endstops Panel.
>![]({{site.url}}/{{site.baseurl}}/assets/images/ui_endstops.png)
6. One-by-one, hold each endstop switch down while clicking the Refresh button to verify that each switch triggers and corresponds to the proper label in the Endstops panel. 
>![]({{site.url}}/{{site.baseurl}}/assets/images/ui_endstops_triggered.png)

### Position Calibration


