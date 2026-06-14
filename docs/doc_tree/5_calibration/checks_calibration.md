---
title: Checks & Calibration
layout: default
nav_order: 5
---

# Checks & Calibration
At this point, ideally you have completed:
 - the Assembly Guide up to -- but not including -- the Enclosure section,
 - the Wiring Guide, having linked back and forth from the Z Endstops, Toolhead, and Electronics Backpack sections respectively,
 - the Firmware Setup, with the ability now to access your printer's Mainsail User Interface via web browser. 

Before you get printing, there are a few things left to 'check and calibrate'. Follow this guide in order and don't hesitate to reach out on [Discord](https://discord.gg/qCQRbnZ6) if you run into issues.

{: .note}
The **Config Reference** sections below refer to the lines in printer.cfg and macros.cfg where the relevant pins and parameters can be found. Unless an instruction says to 'FIRMWARE RESTART', simply save the config file you're working on without a restart and continue. These files can be edited directly from Mainsail in the Machine tab in the Navigation Sidebar.

{: .warning}
During this setup, you will move axes *manually* -- with your hands -- while the motors are disabled. **Manually moving connected steppers too quickly can generate current that can damage the electronics!** So go slow. 🐢

## Table of Contents

- [Fans](#fans)
- [Lights](#lights)
- [Endstops](#endstops)
- [Safety Switch](#safety-switch)
- [Stepper Movement](#stepper-movement)
- [Homing](#homing)
- [Axis Movement](#axis-movement)
- [Nozzle Cleaner Position](#nozzle-cleaner-position)
- [Filament Cutter Position](#filament-cutter-position)
- [Nozzle Probe](#nozzle-probe)
- [Force Sensors](#force-sensors)
- [Bed Scrape Test](#bed-scrape-test)
- [Heaters](#heaters)
- [Resonance Compensation](#resonance-compensation)
- [Bed Leveling (Z Tilt) Test](#bed-leveling-z-tilt-test)
- [Bed Mesh](#bed-mesh)

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
printer.cfg
:
[fan] # Part Cooling
pin: toolhead:gpio21
```

### Hotend Fan
The Hotend Fan should turn on when the nozzle temperature exceeds the value defined in printer.cfg. This value is 45°C by default. We will tune the nozzle temperature control parameters later, but for now if you heat the nozzle to ~50°C, you should hear the fan spin up, feel a slight breeze on your finger behind the hotend, and see the %[fan power] value increaase in the "Miscellaneous" panel in the Mainsail Dashboard.

![]({{site.url}}/{{site.baseurl}}/assets/images/ui_hotend_fan.png)

#### Config Reference
```
printer.cfg
:
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
printer.cfg
:
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
printer.cfg
:
[led house_lights]
white_pin: PA4
initial_WHITE: 1.0
```

## Endstops

### Trigger Check
1. First make sure all motors are disabled, by power cycling or sending ```M84``` in the Console in Mainsail. 
2. With your hands, move the Gantry Bar to the center of the Y axis and the Toolhead to the center of the X axis. 
3. With the Bed Lever engaged, lift all four Z Joints several centimeters off the bottom of their travel. Make sure you can access and depress the switch on the X, Y, and four Z Endstops. 
4. Refresh the endstop states in Mainsail > Machine Tab > Endstops Panel > Refresh Button.
>![]({{site.url}}/{{site.baseurl}}/assets/images/ui_endstop_loc.png)
5. The states should all be OPEN in the Endstops Panel.
>![]({{site.url}}/{{site.baseurl}}/assets/images/ui_endstops.png)
6. One-by-one, hold each endstop switch down while clicking the Refresh button to verify that each switch triggers and corresponds to the proper label in the Endstops panel. 
>![]({{site.url}}/{{site.baseurl}}/assets/images/ui_endstops_triggered.png)

#### Z Endstop Location - Top View
```        
            Rear
       z2 -------- z3
        |          |
 Side A |          | Side B
        |          | 
        z -------- z1
            Front
```

### X/Y Endstop Calibration
The X and Y endstops for the gantry have no adjustment mechanism, so you must check that both trigger as expected, first by moving the toolhead to the right up against the X endstop, then by sliding the gantry bar back until XY Joint A triggers the Y Endstop. Use the Endstops Panel in Mainsail to verify.

#### Config Reference
```
printer.cfg
:
[stepper_x]
:
endstop_pin: ^toolhead:LIMIT_X

[stepper_y]
:
endstop_pin: ^!PC15
```

### Z Endstop Calibration
Each Z Joint has its own M5 BHCS adjustment screw. All Z Joints need to be "as close as can reliably trigger" to the bottom of the frame. A good way to do this is to:
1. Make sure the bed is roughly horizontal and that the bed wheels are resting on the ramp platform.
2. Unscrew the adjustment screws so that they don't trigger the switches when the Z Joints are at the bottom of travel (leaving ~1-5mm showing on the bottom).
3. Carefully push down the front Z Joint Bar so that the Bed Lever disengages and the Front Z Joints are touching the bottom of the frame.
4. Push down the Rear Z Joints so that they are touching the bottom of the frame. The front of the bed shouldd tilt up slightly.
5. Turn each adjustment screw until the corresponding endstop is TRIGGERED in the Endstops Panel. You can use the LED on the PCB as a guide. Give each screw an additional full turn, which equates to 0.8mm of depth. Assuming a worst case limit switch tolerance of +/- 0.1mm , this should give a gap of ~0.7-0.8mm between each Z Joint and the frame when the Endstops are triggered. **These endstops are not used for levelling the bed**. They are used to prepare the bed to be levelled by the probe and to be scraped after a print.


#### Config Reference
```
printer.cfg
:
[stepper_z]
:
endstop_pin: !PF4

[stepper_z1]
:
endstop_pin:!PF3

[stepper_z2]
:
endstop_pin: !PF2

[stepper_z3]
:
endstop_pin: !PF1
```

## Safety Switch
Most printers have the ability to plow the nozzle through the build plate and cause damage if things aren't calibrated for functioning properly. Because of the negative Z travel required for scraping the bed on the Vertigo, we have a few additional safety mechanisms. The Safety Switch prevents crashes at the top of the Front Z Axes, particularly in the event that the nozzle probe does not trigger or the front steppers are not disabled when scraping the bed. This switch will put klipper into an 'Emergency Shutdown' state, from which a firmware restart is required.

1. Hold the Bed Lever down and manually move the Front Z Joint Bar up until the tooling ball is above the bed contact plate.
2. Carefully let the Bed Lever close without snapping shut. 
3. Set the Safety Switch adjustment screw on Front Z Joint B so that it protrudes ~0-1mm.
4. Slowly raise the Front Z Joint Bar up until the carriages -- particularly on side B -- are ~1-2mm below the bottom of the horizontal gantry frame extrusions. 
5. Turn the Safety Switch adjustment screw until the switch triggers and the system shuts down. 
6. Click 'Firmware Restart' in the power menu at the top right of the Mainsail Dashboard.
7. Disengage the Bed Lever and slowly lower the Front Z Joint Bar until the tooling ball is below the bed contact plate and carefully let the Bed Lever close without snapping shut. The Bed Lever should be resting on the Bed Lever Striker, with the tooling ball below the bed contact plate. **Omitting this step can break your printer!**

#### Config Reference
```
printer.cfg
:
[gcode_button bed_safety_button]
pin: ^PC4

press_gcode:
  {action_emergency_stop("Impending Doom Averted!")}
```

## Stepper Movement
We'll use Klipper's STEPPER_BUZZ command to safely test whether the specified motor moves in the expected direction. This command will enable the stepper, rotate it both directions a small amount 10 times, then disable the stepper. If the stepper does not move in the expected manner, you must check the wiring and pinning of the connectors of the affected stepper.

#### Stepper Locations - Top View
```        
            Rear
        x          y 
        |          |   
       z2 -------- z3
        |          |
 Side A |          | Side B
        |          | 
        z -------- z1
            Front
```

### Z Stepper Test
The Z steppers will be tested in numerical order, front then rear. All Z Joints should move downward first.

1. With your hands, raise the Front Z Joint Bar so that the Bed Lever is just above the Bed Lever Striker. It should stay there without without drooping, but you can also hold it up if you need to. The tooling ball must still be below the bed contact plate.
2. In the config, stepper_z corresponds to the front stepper on side A. This is the one we will test first. In Mainsail > Dashboard Tab > Console Panel, type (or paste) the command: `STEPPER_BUZZ STEPPER=stepper_z`.
3. Repeat the test for stepper_z1: `STEPPER_BUZZ STEPPER=stepper_z1`.
4. Manually raise Rear Z Joint A and run the test: `STEPPER_BUZZ STEPPER=stepper_z2`.
5. Manually raise Rear Z Joint B and run the test: `STEPPER_BUZZ STEPPER=stepper_z3`.

#### Config Reference
```
printer.cfg
:
## Z0 Stepper - Front Left
[stepper_z]
dir_pin: PE5
step_pin: PE6
enable_pin: !PC14                        # active-low EN
rotation_distance: 40
gear_ratio: 80:16
microsteps: 16
endstop_pin: !PF4
full_steps_per_rotation: 200
position_endstop: 250
position_max: 250
position_min: -160
homing_speed: 15
second_homing_speed: 3
homing_retract_dist: 0
homing_positive_dir: True

[tmc2209 stepper_z]
uart_pin: PC13
interpolate: True
run_current: 1.3
sense_resistor: 0.110
stealthchop_threshold: 0
:
[stepper_z1]
:
[tmc2209 stepper_z1]
:
```

### X/Y Stepper Test
1. With your hands, move the Gantry Bar to the center of the Y axis and the Toolhead to the center of the X axis. 
2. In the config, stepper_x corresponds to the stepper on side A. This is the one we will test first. In Mainsail > Dashboard Tab > Console Panel, type (or paste) the command: `STEPPER_BUZZ STEPPER=stepper_x`. The lower belt which is driven by stepper_x should first move toward the front of the printer. 
3. Repeat the test for stepper_y: `STEPPER_BUZZ STEPPER=stepper_y`. The upper belt on side B, driven by stepper_y should first move toward the rear of the printer.

#### Config Reference
```
printer.cfg
:
## X Stepper on Motor5 (A Motor)
[stepper_x]
dir_pin: PD7
step_pin: PG9
enable_pin: !PG11
microsteps: 32
rotation_distance: 40
full_steps_per_rotation: 200
endstop_pin: ^toolhead:LIMIT_X
position_min: 0
position_endstop: 255
position_max: 255
homing_speed: 60
homing_accel: 500
homing_retract_dist: 5
homing_positive_dir: True

[tmc5160 stepper_x]
cs_pin: PG10
spi_software_mosi_pin: PG6
spi_software_miso_pin: PG7
spi_software_sclk_pin: PG8
sense_resistor: 0.075
run_current: 2.2                         # abs max ~2.8A (stepper-limited)

## Y Stepper on Motor6 (B Motor)
[stepper_y]
dir_pin: PD3
step_pin: PD4
enable_pin: !PD6
microsteps: 32
rotation_distance: 40
endstop_pin: ^!PC15
full_steps_per_rotation: 200
position_min: 0
position_endstop: 255
position_max: 255
homing_speed: 60
homing_accel: 500
homing_retract_dist: 5
homing_positive_dir: True

[tmc5160 stepper_y]
cs_pin: PD5
spi_software_mosi_pin: PG6
spi_software_miso_pin: PG7
spi_software_sclk_pin: PG8
sense_resistor: 0.075
run_current: 2.2
```

### Extruder Stepper Test
This test is just to make sure the stepper on the Orbiter V2 Extruder is moving in the correct direction at roughly the correct speed. We will calibrate filament extrusion later.

1. Remove the Cowl.
2. Place a piece of non-transparent tape on the visible end of the extruder stepper shaft. 
3. In the Console, run `STEPPER_BUZZ STEPPER=extruder`. The tape should indicate that the stepper first rotate clockwise ~10° or a little less than 2 minute marks on an analog clock. Don't get scientific about this it's just a sanity check.
4. Remove the tape. Resist the urge to stick it on your cat.

#### Config Reference
```
printer.cfg
:
[extruder]
## Extruder movement
step_pin: toolhead:EXT_STEP
dir_pin: toolhead:EXT_DIR
enable_pin: !toolhead:EXT_EN
rotation_distance: 4.69                  # per Orbiter V2.0 Spec
microsteps: 32
full_steps_per_rotation: 200             # 1.8deg motor
:
[tmc2209 extruder]
uart_pin: toolhead:gpio15
interpolate: False
run_current: 0.85
sense_resistor: 0.110
stealthchop_threshold: 0
```

## Homing
The the mechanics of the Vertigo Mk1 require a specific homing order: Z -> Y -> X, as well as some config parameters that prepare the bed for print-related actions, like bed leveling and mesh probing.

### Z Axis Homing
To prepare for the first Z homing, each Z Joint must be lifted off its endstop so that the endstop is OPEN in the Endstops Panel in Mainsail.

1. Lift Z Joint A off its endstop and run `SET_STEPPER_ENABLE STEPPER=stepper_z` in the Console Panel. It's ok if the Bed Lever is at an angle as long as the tooling ball is below the bed contact plate. Repeat for all other Z Joints.
2. Be prepared to turn the power off or click 'Emergency Stop' at the top of the Mainsail Dashboard if the Z axes move in the wrong direction (up towards the toolhead).
3. Click the 'DEBUG HOME Z' button in the Calibration Panel in the Mainsail Dashboard.
>![]({{site.url}}/{{site.baseurl}}/assets/images/ui_debug_home_z.png)
>
>{: .note}
>DEBUG HOME Z is used because, as we will see and calibrate later, a standard G28 Z command will home to the endstops then raise the Front and Rear Z Joints so that the Bed Lever engages and couples to the bed contact plate.
4. Verify that the Z Joints are all at the bottom of their travel and that the endstops are triggered.

### X/Y Axis Homing
For the Vertigo, Y is always homed before X (because the filament cutter dowel extends a bit into the X travel of the toolhead). 

1. Position the Gantry Bar and Toolhead such that both endstops are OPEN in the Endstops Panel in Mainsail.
2. Be prepared to turn the power off or click 'Emergency Stop' at the top of the Mainsail Dashboard if the Z axes move in the wrong direction (up towards the toolhead).
3. Click the 'Home Y' button in the Toolhead Panel in the Mainsail Dashboard.
>![]({{site.url}}/{{site.baseurl}}/assets/images/home_y.png)
1. Click the 'Home X' button in the Toolhead Panel in the Mainsail Dashboard.
>![]({{site.url}}/{{site.baseurl}}/assets/images/home_x.png)

### Ready Bed Position
For any operations other than clearing the bed, it is necessary to first lift the Front Z Joint Bar so that the Bed Lever is engaged. The design allows the Bed Lever to engage with the tooling ball just below the bed contact plate to avoid a loud snap and potential denting of either the ball or plate. This behavior will be examined during this calibration. Ideally the default values here are good, but it's good to check and understand what's going on.

1. If following the guide in order, the Z Joints should all be at the bottom of travel. If not, click 'DEBUG HOME Z'. Double check that all Z Joints are down on the endstops.
2. In the Console, run `FORCE_MOVE_Z_FRONT DISTANCE=1` to raise the Front Z Joint Bar up by 1mm. You will see a readout that displays the total distance moved: `front pair now +[value] mm from nominal` (so far).
3. Keep moving the Front Z Joint Bar up until the Bed Lever engages and you can see a small gap between the Bed Lever and its striker. You can use values other than 1mm to get there and dial it in.
4. Use the value in the readout `front pair now +[value] mm from nominal` for the parameter `front_engage_distance:` in printer.cfg.
5. In the Console, run `FORCE_MOVE_Z_REAR DISTANCE=1` to move the Rear Z Joints up until the tooling ball is touching the bed contact plate. The bed should be tilted slightly forward; meaning the rear of the bed is slightly higher than the front of the bed, and the Bed Wheels are not be bearing weight.
>{: .note}
>The bed must be tilted slightly forward because Z_TILT_ADJUST probes the front of the bed first, then the rear of the bed. If it is tilted the other way, it's possible that the Safety Switch will trigger during the leveling process.
6. Use the value in the readout `rear pair now +[value] mm from nominal` for the parameter `rear_couple_distance:` in printer.cfg.
7. Save printer.cfg and 'FIRMWARE RESTART' to apply changes.
8. When the interface is available again, click the normal 'Home Z' button in the Toolhead Panel. After homing to the endstops, the front and rear Z axes should move independently to couple the bed to the Front Z Joints.
>![]({{site.url}}/{{site.baseurl}}/assets/images/home_z.png)

#### Config Reference
```
printer.cfg
:
[vertigo_z_homing]
front_steppers: stepper_z, stepper_z1
rear_steppers: stepper_z2, stepper_z3
front_engage_distance: 25                # mm to raise the FRONT pair to engage the lever
rear_couple_distance: 13                 # mm to raise the REAR pair to couple the bed
lift_speed: 25                           # mm/s for the isolated front/rear moves (raises + jogs)
lift_accel: 100                          # mm/s^2 for the isolated front/rear moves
max_print_z: 220                         # optional explicit kinematic Z after print-home
```

### Homing Sequence
If you've gotten this far, awesome! We're getting closer to our first print. You should now not need to be so concerned with the power switch or 'Emergency Stop' button.

1. Click the 'Disable Motors' button in the Toolhead Panel in Mainsail.
>![]({{site.url}}/{{site.baseurl}}/assets/images/disable_motors.png)
2. Repeat step 1 of the Z Axis Homing section above to position all Z Joints above their endstops.
3. Repeat Step 1 of the X/Y Homing section above to open those endstops.
4. Now, clicking the 'Home All' or the 'Home X' button should home all axes in the proper sequence: Z -> Y -> X. Feel free to try both. Once the axes are homed, they know where they are and will then re-home independently.

#### Config Reference
```
macros.cfg
:
[homing_override]
:
```

## Axis Movement
Now that the printer is homed, we'll do a quick manual 'jog' to confirm the Toolhead moves nominally in X and Y and the bed moves nominally in Z -- all from the Toolhead Panel in the Mainsail Dashboard. Movement consists of concentric rings of step-size buttons (e.g. 100, 10, 1, 0.1 mm). For the toolhead (X/Y Axes), the rings are divided into 4 sections with N, E, S, W corresponding to +Y, +X, -Y, -X respectively. For the bed (Z Axis), the rings above the 'Disable Motors' button move the bed in the 'negative direction' up towards the nozzle -- counterintuitive perhaps, but this is from the perspective of the nozzle. Each click moves the selected axis by the chosen step size -- start small. Everything must be homed first; if an axis isn't homed, Mainsail will refuse the move.

### Toolhead (X/Y) Jog Test
The Toolhead moves in X and Y. After homing, the Toolhead sits at the rear-right corner (the X and Y maximums), so we'll jog *away* from there, back toward the center.

1. Confirm all axes are homed from the previous section.
2. At the bottom of the Toolhead Panel, reduce Speed Factor to 50%.
3. In the Toolhead Panel, click the '-10mm X' ring section. The Toolhead should move toward side A (left), away from the endstop. Click '+10mm X' to send it back toward side B (right).
> ![]({{site.url}}/{{site.baseurl}}/assets/images/ui_xy_movement.png)
5. Repeat for Y.
>{: .important}
>Be aware of the Filament Cutter when jogging. It's possible to bump the dowel that extends into the toolhead movement area.
6. Try the other step sizes and jog each axis a little to confirm the moves feel smooth, with no grinding or skipped steps.

### Bed (Z) Jog Test
Before jogging Z, the Bed Lever must be engaged and the bed coupled to the contact plate. A standard 'Home Z' leaves the printer in exactly this state, so as long as you homed normally (not 'DEBUG HOME Z'), you're ready.

1. If the bed isn't already coupled, click 'Home Z' in the Toolhead Panel. 
> {: .warning}
>>  Whenever manually jogging the Z Axis with the Toolhead Panel, it is imperative to ensure the Bed Lever is engaged. Error checking in the `vertigo_z_homing` module should prevent jog moves from a 'decoupled' state. But you know... stuff happens. If the bed contact plate is ever above the tooling ball on the Bed Lever, do the following:  
>> - Disable Motors.
>> - Position the Front Z Joint Bar high enough above the bed contact plate to allow the Bed Lever to open.
>> - Open the Bed Lever.
>> - Move the bed or Z Joint Front Bar so that the tooling ball is below the bed contact plate. 
>> - Run a standard 'Home Z' command (G28 Z or 'Home Z' Button in Toolhead Panel). Z Axis jogging should now be 'unlocked'.  
2. Click the +1 mm button (above 'Disable Motors'). The bed should rise ~1 mm toward the nozzle.
> ![]({{site.url}}/{{site.baseurl}}/assets/images/ui_z_movement.png)
3. Click the -1 mm button (below 'Disable Motors'). The bed should lower ~1 mm away from the nozzle.
4. Move the bed up and down a few millimeters to confirm smooth, quiet travel. **Don't jog below where the Bed Lever touches the striker on the frame!**

#### Config Reference
```
printer.cfg
:
[printer]
kinematics: corexy
max_velocity: 1500                       # mm/s
max_accel: 40000                         # mm/s^2
max_z_velocity: 30                       # mm/s
max_z_accel: 100                         # mm/s^2
```
{: .note}
The per-axis jog limits -- how far the toolhead and bed are allowed to travel -- come from the `position_min` / `position_max` values in each `[stepper_*]` section shown in the Stepper Movement and Endstop Calibration sections above.

## Nozzle Cleaner Position
It's important to keep a clean nozzle for bed leveling, clean first layers, and pause/resume functionality.

1. Use the Toolhead Panel to jog X and Y until the nozzle is centered on the silicone nozzle plug (a repurposed Revo Nozzle Sock).
2. Adjust the vertical position of the Nozzle Cleaner so that the nozzle presses into the plug.
3. Jog the X axis -10mm and check that the tip of the nozzle is not below the base of the silicone brush teeth. Readjust the Nozzle Cleaner if necessary.
4. Jog the X axis +10mm, back to the plug.
5. Enter the X and Y positions from the Toolhead Panel into `variable_plug_pos_x:` and `variable_plug_pos_y:` in macros.cfg.
6. Save macros.cfg.

#### Config Reference
```
macros.cfg
:
[gcode_macro _macro_variables]
:
# ---- Purge / wipe / plug settings ----
variable_plug_pos_x: 18
variable_plug_pos_y: -29
variable_wipe_dist: 15
variable_wipe_speed: 50                          # mm/s -> mm/min after conversion
variable_wipe_plug_dx: 12.1                      # distance between plug pos and wipe/brush center
```

## Filament Cutter Position
The filament cutter is designed to be integrated with an automatic filament swapping system (MMU/AFC/AMS, etc.). Without one of these systems, it can still help prevent clogs by allowing you to remove filament cold, so that hot, melted filament only moves in one direction. The Vertigo uses a dowel-slot method to cut filament because the razor will not get stuck like mechanisms that rely on a spring to return the razor lever. (This has been observed in Bambu printers for example.)

1. Ensure the Toolhead is homed.
2. Use the Toolhead Panel to jog Y such that the Toolhead is clearly to the rear of the Filament Cutter dowel on the right side (side B) of the printer.
3. Jog X and Y until the slot in the cutter arm is horizontally aligned and ~2mm from the end of the Filament Cutter dowel.
4. Adjust the vertical position of the Nozzle Cleaner so that the dowel is aligned with the vertical center of the cutter arm slot.
5. Enter the X and Y positions from the Toolhead Panel into `variable_cut_pos_x:` and `variable_cut_pos_y:` in macros.cfg.
6. Test the default `variable_cut_attach_y_dist:` paramter in the Config Reference below by jogging in the negative Y direction by this amount to engage filament cutter dowel. The end of the dowel should be protruding protruding ~1-2mm out the back of the cutter arm. Edit `variable_cut_attach_y_dist:` as necessary and jog the Toolhead in +Y to disengage the Filament Cutter.
7. Save macros.cfg and 'FIRMWARE RESTART' to apply changes.
8. When the interface is available again, click 'Home All' and test by running `CUT_FILAMENT` in the Console.

#### Config Reference
```
macros.cfg
:
[gcode_macro _macro_variables]
:
# ---- Filament cutter settings ----
variable_cut_pos_x: 249.5
variable_cut_pos_y: 18
variable_cut_attach_y_dist: 20
variable_cut_dx: 22
variable_cut_dy: 23
```

## Nozzle Probe
The Hitchcock Toolhead uses E3D's high accuracy nozzle probe to level the bed and provide an absolute reference for the printers Z origin. 

{: .note}
Here is the [E3D PZ Probe Documentation](https://e3d-online.com/pages/revo-support-voron-pz-probe). Scrolling down to the presets section is particularly helpful, but there is a lot of information there to help with sensitivity tuning.

1. With everything homed, we'll go to the first probe point specified in `[z_tilt]` to test. Run `G90` then `G1 X125 Y5 F6000` in the Console.
2. Remove the Cowl so you can easily access the nozzle and PZ Probe Controller.
3. Press the preset button on othe PZ Probe Controller on the side of the Toolhead until you are in **Preset 4**. The LEDs on the controller board will change as you cycle through presets. Use the images below for reference.
>![]({{site.url}}/{{site.baseurl}}/assets/images/pz_presets.png)
>![]({{site.url}}/{{site.baseurl}}/assets/images/pz_probe_controller.png)
4. Test the probe by tapping the nozzle from underneath with a hex key or the back of your fingernail. The trigger LED should light up when tapped.
5. First we'll do a trial run, then we'll do the real thing. Hold something hard and relatively wide and flat under the nozzle i.e. a coaster, phone, etc. We will run a command and you will tap the nozzle as the bed starts moving. The bed is expected to stop and the Console will report the measured nozzle Z position. Be ready to click 'Emergency Shutdown' or power off if the bed does not stop at the tap. Here we go.
6. In the Console, run `PROBE SAMPLES=1` and tap the nozzle firmly before the bed gets there. If the bed keeps moving, shutdown and troubleshoot the probe using the docs provided in the notes above or reach out to us on discord.
7. Now that we know the probe is working, it's time to test it with the bed. 
> {: .warning}
> Just wanted to reiterate the warning in the Bed (Z) Jog Test section above before moving the bed.
8. Move the bed up until it's about 10mm from the nozzle. Make sure your nozzle is over the bed; if it is not, something is off and you will need to troubleshoot before probing.
9. One of the nice things about having an extruder that is magnetically mounted to the gantry is that it should not be catastrophic if the next step fails. The extruder plate should pop off and the safety switch should eventually trigger if you don't get to shutdown in time. If the safety switch triggers before the nozzle touches the bed, you will need to adjust the parameters mentioned in the [Ready Bed Position]({{site.url}}/{{site.baseurl}}/doc_tree/5_calibration/checks_calibration.html#ready-bed-position) section above so that the bed tilts forward at the 'Ready Position' after Z Homing.
10. Run the single probe command again: `PROBE SAMPLES=1`. Either the bed will stop, or you'll have a teeny tiny panic attack. Either way, everything is going to be ok. 

#### Config Reference
```
printer.cfg
:
[smart_effector]
pin: ^!toolhead:PROBE_TRIGGER
x_offset: 0
y_offset: 0
#z_offset: 0
speed: 15                                # default 10
samples: 3
sample_retract_dist: 2
lift_speed: 15
samples_result: median
samples_tolerance: 0.020
samples_tolerance_retries: 3
recovery_time: 0.4
```

## Force Sensors
These are used to detect stuck parts on the print bed so that multiple attempts can be made and more time for cooling can be allowed to increase the rate of successful part ejection. In this section we will go over the functionality of the scraper bar, the force sensors, and corresponding gcode macros and parameters.

### Trigger Check
1. Navigate to Mainsail UI > Machine Tab > Endstops panel and click the 'Refresh' button in the bottom right.
2. Endstop FORCE_SENSOR should be OPEN.
3. Refresh (Query) the endstops again while firmly pressing up on the Force Sensor Rocker. Now FORCE_SENSOR should be TRIGGERED.
> ![]({{site.url}}/{{site.baseurl}}/assets/images/ui_endstops_force_sensor.png)
4. Release the pressure, query, and ensure the endstop state again shows OPEN.

### Force Sensor Probe Parameter Verification
The Vertigo Mk1 Bed Scrape function is similar to a nozzle probing action. The `SCRAPE_BED` macro does essentially the same thing as a probing move to a maximum travel distance. Either it completes the full travel or gets stuck on a part. If the scraper gets stuck on a part this means the part requires more force than the sensor is calibrated to provide; the sensor circuit is broken, the endstop triggers, and a number of retries will be attempted with user-specified pauses between them. If the part is still stuck after all the retries, the bed will return to a horizontal 'ready state', pause the queue, and prompt the user to clear the bed the old-fashioned way. Similar to previous testing, we will first check the the config values against the physcal system, do a "trial run," then send it for the real thing. 

1. Run `PAUSE` in the Console to get the toolhead out of the way.
2. Click the 'DEBUG HOME Z' button in the Calibration Panel in the Mainsail Dashboard. Again, do a sanity check that all 4 Z Joints are at the bottom of their travel and the Bed Lever is disengaged.
3. Run `FORCE_MOVE_Z_REAR DISTANCE=1` as a relatively save check that the Rear Z Joints are moving up and the bed is starting to tilt forward.
4. To get the bed vertical, run `FORCE_MOVE_Z_REAR DISTANCE=170`. At this location it should be clear that the wedges on the Scraper Bar align with the Force Sensor Rocker. 
5. Run `FORCE_MOVE_Z_REAR DISTANCE=20`. The Scraper Modules should all be engaged, with razors touching the print surface. Here we can simulate a stuck part by pushing up from underneath one of the Scraper Wings (as close to the scraper's linear guide carraige as you can get) and again querying the Endstops Panel to be extra certain that the Force Sensor will trigger through contact with the Scraper Bar.
6. Continuing our upwards journey, run `FORCE_MOVE_Z_REAR DISTANCE=200`. This pushes the rear Z axis up to the default `scrape_threshold_z_pos: 390`. Past this point the bed is considered scraped and the Force Sensors function switches to 'safety mode', explained further in the next step. If the Force Sensors trigger at any point up to this value, retries will be attemped according to the config parameters, as referenced below.
> {: .important}
> The last upward move will be calibrated. The default total distance from the endstop is `scrape_distance: 400`. The console readout should show `rear pair now +390.000 mm from nominal`. Under normal operation, if for some reason the Force Sensors trigger between here and the previous distance, the bed is still considered fully scraped; the bed will return to 'ready state', and print queues will continue without issue. However because we are using a 'FORCE_MOVE' AND nearing the end of travel, some caution is required. 
7. Run `FORCE_MOVE_Z_REAR DISTANCE=1` and query the endstops for a trigger. Repeat until the scrapers are at the end of the bed or the FORCE_SENSOR endstop is TRIGGERED. 
> - If the scrapers are at the end of the bed and the FORCE_SENSOR is OPEN -> Use the value in the readout `rear pair now +[value] mm from nominal` for the parameter `scrape_distance:` in printer.cfg.
> - In the unlikely event that FORCE_SENSOR is TRIGGERED -> subtract 7 from the value in the readout `rear pair now +[value] mm from nominal` and use the result for the parameter `scrape_distance:` in printer.cfg.
>
> {: .note}
> The value of ~7mm comes from the designer's testing and the long tolerance chain between the rear Z steppers and the Force Sensor circuit break.
>
> {: .note}
> It turns out that the Force Sensors can have something of a dual functionality. It is technically possible to raise the `scrape_distance:` well beyond the physical upward travel limit of the rear Z axes, thus guaranteeing that the Force Sensors will trigger at the end of each bed scrape. Remember, above the `scrape_threshold_z_pos:`, this is considered a successful scrape and everything continues as normal. Ultimately, the designers decided to do it this way to hopefully reduce the repetitious load on the Z axes and increase the machines longevity, time between repairs, etc. Ideally, most parts become easier to release with cooling and require low force and few retries. However, if you'd rather get a free test of the Force Sensor functionality with each scrape, then that option is available.
8. The bed has now achieved the dizzying heigts of Vertigo and would kindly like to be lowered back to earth. Oblige it by clicking 'Home Z' in the Toolhead Panel.
9. Save printer.cfg and 'FIRMWARE RESTART'.

#### Config Reference
```
printer.cfg
:
[force_sensor_probe]
endstop_name: force_sensor
pin: ^PA7                                # NC switch to GND: pullup, no invert
rear_steppers: stepper_z2, stepper_z3
front_steppers: stepper_z, stepper_z1
scrape_speed: 15.0                       # mm/s, rear-pair travel speed (up & down)
scrape_accel: 100                        # mm/s^2 for the isolated rear-only moves
scrape_threshold_z_pos: 390              # mm TOTAL travel; a trigger at/above this = fully scraped
scrape_distance: 400                     # mm full scrape travel; reaching it (trigger or not) = fully scraped (> threshold)
retries: 3                               # sub-threshold attempts allowed; REFILLS whenever an attempt digs deeper
retry_tolerance: 1.0                     # mm; a gain at/below this doesn't count as progress
max_total_attempts: 20                   # absolute safety cap on total attempts
delay_with_pressure: 1.0                 # s to dwell while still loaded, BEFORE retracting
delay_between_retries: 1.0               # s to dwell AFTER retract, before the next attempt
retract_distance: 5.0                    # mm to back off (descend) between retries
rehome_gcode: _HOME_Z_RAW
# on_scraped_gcode:                       # optional, runs after a successful scrape + home
on_failed_gcode: _SCRAPE_FAIL_MENU       # stuck below threshold -> blocking Mainsail prompt + PAUSE
```

### Scrape Force Calibration
In the [Force Sensors](http://localhost:4000/doc_tree/2_assembly/07_auxiliary_modules_2/1_force_sensors.html) section of the Assembly Guide, we left off with ~2 full turns on the Force Sensor adjustment screw, or about ~1mm of compression. This is a good amount of force for continuity and functionality testing, but we'll crank it up a bit now that we're getting ready to scrape parts.

During initial testing, it was found that ~10-15 lbf (~44-65 N) per side is a good start for force needed to trigger the sensors. This should only require 1-2 additional full turns clockwise on each sensor adjustment screw. Remember, it shouldn't require an enormous amount of force to eject parts. Press the sensors with your thumb and query the endstops to get an idea of the force being applied -- use good judgement.

{: .important}
The adjustment on both sides must be equal.

{: .warning}
Setting the Force Sensors too strong can prevent them from triggering when they should and possibly damage your printer.

**Optional** Procedure for Scrape Force Calibration:
1. Power OFF the printer.
2. Unscrew the Force Sensors from the frame.
3. Remove the external wires from the WAGO connectors.
4. Attach the leads from a multimeter to each WAGO connector, completing the circuit.
5. Grab the most accurate scale you have.
6. Turn the multimeter on and set it to 'continuity mode'.
7. Press the Force Sensor rocker onto the scale and note the weight at which the multimeter's beep stops. In the US, you're looking for ~10-15 lb, and for everywhere else, ~4.5-6.5 kg.
8. Re-install the Force Sensors and power ON.

## Bed Scrape Test
The 'meat and potatoes' of the Vertigo.

Here's what to expect when this macro runs:
- The Z axes should home to the endstops, decoupling the bed from the Front Z Joints.
- The Rear Z Joints should move upwards and
  - rotate the bed vertically,
  - bring the Scraper Bar wedges into contact with the Force Sensors, 
  - and scrape the bed.
- When the full `scrape_distance` has been traversed, the Rear Z Joints should again home to the endstops, returning the bed to ~horizontal.
- The bed should return to 'ready position', coupled with the Front Z Joints.

1. Click 'SCRAPE BED' in the Part Ejection Panel in Mainsail.
> ![]({{site.url}}/{{site.baseurl}}/assets/images/ui_scrape_bed.png)
2. Give your Vertigo a high-five. 

#### Config Reference
```
macros.cfg
:
[gcode_macro SCRAPE_BED]
:
```

## Heaters
The extruder and bed contain heating elements and temperature sensors that are used to control them.

{: .important}
Now is a good time to sanity check that the temperature sensors are reading something close to ambient temperature; you may want to use an external thermometer if you are unsure. These can be found in the Temperatures Panel in Mainsail.
> ![]({{site.url}}/{{site.baseurl}}/assets/images/ui_temps.png)

### Extruder PID Tuning
PID Control is a widely used control algorithm. It works best when calibrated for a specific target. Kalico provides the option to save different PID tuning parameters to temperature-specific profiles. 

{: .note}
Kalico also provides [Model Predictive Control](https://docs.kalico.gg/MPC.html) as an alternative to PID. This may become the default in future updates to the Vertigo config.

1. First, let's check that the heater actually heats and the temperature sensor measures the change. Set a safe target of 50°C in the Temperatures Panel. Since the PID is not calibrated for this target, there will be some oscillation around the target temperature. However, if you see no change, or change is measured in the wrong sensor, **immediately power OFF** and check your wiring and heater components.
2. Assuming the nozzle is still on the plug, jog the toolhead +100 X to move it into the air.
3. In the Console, run  `PID_CALIBRATE`.

#### Config Reference
```
printer.cfg
:
[extruder]
:
## Extruder temperature
heater_pin: toolhead:EXT_HEATER
sensor_type: ATC Semitec 104NT-4-R025H42G
sensor_pin: toolhead:TH0
control = pid
pid_kp = 22.684
pid_ki = 2.881
pid_kd = 44.658
pid_version = 1
pid_target = 215.00
pid_tolerance = 0.0200
min_extrude_temp: 90
min_temp: 10
max_temp: 300
```

### Bed PID Tuning
PID control is quite sufficient for the bed. This is the same process as the extruder.

1. Again, set a safe target of 50°C in the Temperatures Panel. The aluminum bed is a much larger thermal mass, so heating it will take substantially longer. Again, if you see no change, or change is measured in the wrong sensor, **immediately power OFF** and check your wiring and heater components.
2. 

## Resonance Compensation
Resonance compensation is a deep subject, but basically everything is a spring. The [`[input_shaper]`](https://en.wikipedia.org/wiki/Input_shaping) is a relatively sophisticated attempt to mitigate some of the cosmetic defects or "vertical fine artifacts (VFA)" in printed parts by compensating for this 'springy-ness'.  



## Bed Leveling (Z Tilt) Test

## Bed Mesh


