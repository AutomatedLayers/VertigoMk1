---
title: Wiring
layout: default
nav_order: 3
---

# Wiring

<!-- ![]({{site.url}}/{{site.baseurl}}/assets/images/EP_010_Header.webp) -->
<img src="{{site.url}}/{{site.baseurl}}/assets/images/EP_010_Header.webp" width="100%" alt="">

## Before You Start

The goal of this guide is to help you wire the printer carefully and consistently. That said, **electricity _can_ be dangerous**. Incorrect wiring or unsafe work practices can cause injury, damage components, start a fire, or worst of all, frighten your kitty. **You’ve got this — take your time, work safely, don’t skip steps, and double-check each step before moving forward.**

This printer is a DIY kit assembled from parts sourced from many suppliers across the world. Because of this, **hardware details may vary** between supplier batches or self-sourced parts. This can include component pinout, wire colors, connector styles, and other small differences. **Be careful about making assumptions based on appearance alone.** This guide provides the tools needed to verify each part, cable, and connection using the specification documents, which will be explained in the next section.

{: .important }
Some image text may appear small on this page. For a larger view, right-click the image and select "Open image in new tab".

## Understanding the Wiring Diagram & Cable Spec

Wiring is defined by two core documents: the **wiring diagram** and the **cable specification**.

### [**The Cable Specification**](https://github.com/AutomatedLayers/VertigoMk1/tree/main/electrical/Cable%20Spec%20%26%20Wiring%20Diagram) 

This document defines how each cable is manufactured, including its Z-code, length, wire gauge, color, pinout, and other relevant build details.

![]({{site.url}}/{{site.baseurl}}/assets/images/EP_020_Cable_Spec.webp)

<br>

**Cable Construction Examples**

Below are cables Z-11 and Z-36 as it appears in the cable specification, along with a photos of the construction for reference. Keep in mind that not every hardware component will have the physical Z-code label attached. In those cases, identify the cable by comparing its features to the cable specification, or consult the Wiring Diagram if you know where the component is being installed to easier identifiy the Z-code. 

<img src="{{site.url}}/{{site.baseurl}}/assets/images/EP_030_Cable_Example.webp" width="100%" alt="Cable specification example showing Z-11 and Z-36">

![]({{site.url}}/{{site.baseurl}}/assets/images/EP_035_Cable_Example.webp)

### [**The Wiring Diagram**](https://github.com/AutomatedLayers/VertigoMk1/tree/main/electrical/Cable%20Spec%20%26%20Wiring%20Diagram) 

This document defines how the cables terminate within the system, using symbols and Z-codes to identify connections.

![]({{site.url}}/{{site.baseurl}}/assets/images/EP_040_Wiring_Diagram.webp)

<br>

**Finding Z-Code Termination Points Example**

* Locate the Z-Code: There will be one located at each termination point for the cable
* Note the schematic label: This indicates the termination points using abbreviated names, separated by an underscore "_"
  * E.g. Z-11, TBDC24V[-]_PSU24V[-] indicates you can find the termination points at Terminal Block DC 24V [-] and the Power Supply Unit 24V [-]

**Tip:** Opening the PDF and using the find function is an easy way to navigate the Z-Code termination points.

![]({{site.url}}/{{site.baseurl}}/assets/images/EP_050_Wiring_Example.webp)

{: .warning }
When using these documents, always perform a quick check to confirm that you are using the [latest revision](https://github.com/AutomatedLayers/VertigoMk1/tree/main/electrical/Cable%20Spec%20%26%20Wiring%20Diagram) before proceeding.

![]({{site.url}}/{{site.baseurl}}/assets/images/EP_060_Check_Rev.webp)

<br>

## Z-Codes & Abbreviation Names

<br>

<img src="{{site.url}}/{{site.baseurl}}/assets/images/EP_070_Z-Codes_Backpack.webp" width="100%" alt="">

<img src="{{site.url}}/{{site.baseurl}}/assets/images/EP_080_Z-Codes_Toolhead.webp" width="100%" alt="">

<br>

## Configuring the Toolhead Board

### Install Jumpers and Fan Mosfet and Set Switches (for CAN Mode) on Toolhead Board

* Toolhead fans are set to 24V
* Setting GPIO20 to 3.3V is optional, but recommended
* Fan Mosfet is installed (Mosfet can be installed either orientation; just ensure all 6 pins are inserted)
* Toolhead board is set to CAN mode with switches on back of board
* Set CAN Bus 120 Ohm terminal resistor to ON position

![]({{site.url}}/{{site.baseurl}}/assets/images/EP_130_Toolhead_Jumpers_Mos_Switch.webp)

[Return to Extruder Plate assembly]({{site.url}}/doc_tree/2_assembly/12_toolhead/1_extruder_plate.html)

## Wiring The Electronics Backpack

### If this is your first visit, you are arriving from "[Assembly - Electronics Backpack - Vertigo MK1](https://youtu.be/X98VDksNd48?si=4Hsjn2eWTSBX0ba6)"

![]({{site.url}}/{{site.baseurl}}/assets/images/EP_090_Youtube_Electronics_Backpack.webp)

### 1. Install CM & Heatsink

![]({{site.url}}/{{site.baseurl}}/assets/images/EP_100_Install_CM.webp)

### 2. Install Jumpers on Main Board

**Jumpers are used to select the following settings:**

* All stepper drivers are set to 24V
* TMC5160T Pro drivers are set to SPI mode
* TMC2209 drivers are set to UART mode
* Bed fans are set to 24V
* E-Panel fans are set to 24V
* Enclosure LEDs are set to 24V
* CAN Bus 120 ohm jumper is installed (*smaller jumper than the others)

{: .warning }
Double-check all jumper settings before applying power — an incorrect configuration can permanently damage the board (the kind that can't be undone). We can tell you from experience an extra or misplaced jumper makes for a good firework show. 

![]({{site.url}}/{{site.baseurl}}/assets/images/EP_110_Install_Jumpers.webp)

### 3. Install Stepper Drivers

![]({{site.url}}/{{site.baseurl}}/assets/images/EP_120_Install_Stepper_Drivers.webp)

### 4. Install Terminal Block Bus Bars

* Cut terminal block bus bars to length
* Trim excess material from where the cut was made
* Install bus bars in terminal blocks as shown

{: .warning }
Double-check that each bus bar is cut to the correct node length. Trim any excess material between bus bars so they are not close to touching. When finished, it should match the image above.

![]({{site.url}}/{{site.baseurl}}/assets/images/EP_140_Install_Terminal_Block_BusBars.webp)

<img src="{{site.url}}/{{site.baseurl}}/assets/images/EP_145_Bus_Bar_Trim_Check.webp" width="100%" alt="">

### 5. Install Terminal Block Fasteners

![]({{site.url}}/{{site.baseurl}}/assets/images/EP_150_Terminal_Block_Fasteners.webp)

### 6. Install Terminal Block Covers

* Install terminal block covers for Terminal Block CAN (TBCAN) and Terminal Block Bed (TBB)
* We will leave the others uncovered for the next steps

![]({{site.url}}/{{site.baseurl}}/assets/images/EP_160_Terminal_Block_Covers.webp)

### 7. Check Fuse Amperage - IEC C14 Plug

* This step is a safety check to make sure the components have the correct fuse sizes for your region.
* Remove the fuse and verify that the amperage rating matches the value listed in the table.
* Re-install the fuse

{: .warning }
Do not assume the installed fuses are correct. An oversized fuse may not blow when a fault occurs, which can allow wires or components to overheat. This can damage the printer, create a fire hazard, or cause serious injury. Always verify the fuse size before applying power.

![]({{site.url}}/{{site.baseurl}}/assets/images/EP_170_Fuse_Check_IEC.webp)

### 8. Check Fuse Amperage - Bed Fuse (Z-07)

* This step is a safety check to make sure the components have the correct fuse sizes for your region.
* Remove the fuse and verify that the amperage rating matches the value listed in the table.
* Re-install the fuse

{: .warning }
Do not assume the installed fuses are correct. An oversized fuse may not blow when a fault occurs, which can allow wires or components to overheat. This can damage the printer, create a fire hazard, or cause serious injury. Always verify the fuse size before applying power.


![]({{site.url}}/{{site.baseurl}}/assets/images/EP_180_Fuse_Check_Bed.webp)

### 9. Check PSU's AC Input Voltage Switch

* This step is a safety check to make sure the PSU is set to accept the mains power for your region.
* Locate the switch on the side of the PSU
* Ensure it is set to the AC input voltage for your region.

{: .warning }
Do not assume the PSU's AC input voltage switch is set correctly. An incorrectly set switch can damage the printer, create a fire hazard, or cause serious injury. Always verify the PSU's AC input voltage switch setting before applying power.

![]({{site.url}}/{{site.baseurl}}/assets/images/EP_190_PSU_Switch_Check.webp)

### 10. Install Cables: Z-01, Z-02, Z-03, Z-11, Z-12

![]({{site.url}}/{{site.baseurl}}/assets/images/EP_200_Install_Cables-01.webp)

### 11. Install Cables: Z-04, Z-05, Z-06

![]({{site.url}}/{{site.baseurl}}/assets/images/EP_210_Install_Cables-02.webp)

### 12. Prepare Multimeter for Continuity Checks

* Set multimeter to continuity mode
* Touch the multimeter leads together - The multimeter should beep

{: .note }
Always test the continuity mode is reporting accurately by touching the two multimeter leads together - This should result in a beeping noise.

![]({{site.url}}/{{site.baseurl}}/assets/images/EP_220_Voltmeter_Continuity_Mode.webp)

<br>

### 13. Check for short between AC Live (L) & AC Neutral (N)

**Preprequisite:** 
* Power is disconnected
* Set multimeter to continuity mode
* Multimeter continuity mode tested and working (beeps when touching leads)

**Test:**
* Touch other lead to AC Live (L) bus bar
* Touch one lead to AC Neutral (N) bus bar

<span style="color:green">**Pass:** No Sound</span>

<span style="color:red">**Fail:** Multimeter Beeps</span>

![]({{site.url}}/{{site.baseurl}}/assets/images/EP_230_Continuity Test-01.webp)

### 14. Check for short between AC Neutral (N) & AC Earth (⏚)

**Preprequisite:** 
* Power is disconnected
* Set multimeter to continuity mode
* Multimeter continuity mode tested and working (beeps when touching leads)

**Test:**
* Touch one lead to AC Neutral (N) bus bar
* Touch other lead to AC Earth (⏚) bus bar

<span style="color:green">**Pass:** No Sound</span>

<span style="color:red">**Fail:** Multimeter Beeps</span>

![]({{site.url}}/{{site.baseurl}}/assets/images/EP_240_Continuity Test-02.webp)

### 15. Check for short between AC Live (L) & AC Earth (⏚)

**Preprequisite:** 
* Power is disconnected
* Set multimeter to continuity mode
* Multimeter continuity mode tested and working (beeps when touching leads)

**Test:**
* Touch one lead to AC Live (L) bus bar
* Touch other lead to AC Earth (⏚) bus bar

<span style="color:green">**Pass:** No Sound</span>

<span style="color:red">**Fail:** Multimeter Beeps</span>

![]({{site.url}}/{{site.baseurl}}/assets/images/EP_250_Continuity Test-03.webp)

### 16. Check for short between PSU's DC(+) & DC(-)

**Preprequisite:** 
* Power is disconnected
* Set multimeter to continuity mode
* Multimeter continuity mode tested and working (beeps when touching leads)

**Test:**
* Touch one lead to DC(+) bus bar
* Touch other lead to DC(-) bus bar

<span style="color:green">**Pass:** No Sound</span>

<span style="color:red">**Fail:** Multimeter Beeps</span>

![]({{site.url}}/{{site.baseurl}}/assets/images/EP_260_Continuity Test-04.webp)

### 17. Check for continuity between IEC C14 plug & PSU for AC Live (L)

**Preprequisite:** 
* Power is disconnected
* Set multimeter to continuity mode
* Multimeter continuity mode tested and working (beeps when touching leads)

**Test:**
* Touch one lead to IEC C14 Plug's (L) pin
* Touch other lead to PSU's AC (L) input

<span style="color:green">**Pass:** Multimeter Beeps</span>

<span style="color:red">**Fail:** No Sound</span>

![]({{site.url}}/{{site.baseurl}}/assets/images/EP_270_Continuity Test-05.webp)

### 18. Check for continuity between IEC C14 plug & PSU for AC Neutral (N)

**Preprequisite:** 
* Power is disconnected
* Set multimeter to continuity mode
* Multimeter continuity mode tested and working (beeps when touching leads)

**Test:**
* Touch one lead to IEC C14 Plug's (N) pin
* Touch other lead to PSU's AC (N) input

<span style="color:green">**Pass:** Multimeter Beeps</span>

<span style="color:red">**Fail:** No Sound</span>

![]({{site.url}}/{{site.baseurl}}/assets/images/EP_280_Continuity Test-06.webp)

### 19. Check for continuity between IEC C14 plug & PSU for AC Earth (⏚)

**Preprequisite:** 
* Power is disconnected
* Set multimeter to continuity mode
* Multimeter continuity mode tested and working (beeps when touching leads)

**Test:**
* Touch one lead to IEC C14 Plug's (⏚) pin
* Touch other lead to PSU's AC (⏚) input

<span style="color:green">**Pass:** Multimeter Beeps</span>

<span style="color:red">**Fail:** No Sound</span>

![]({{site.url}}/{{site.baseurl}}/assets/images/EP_290_Continuity Test-07.webp)

### 20. Preparing for First Power ON

![]({{site.url}}/{{site.baseurl}}/assets/images/EP_300_Clean_Work_Area.webp)

{: .warning }
Don’t wire electronics in a cluttered area, as it greatly increases the risk of accidentally shorting something.

### Always prioritize your safety and the safety of those around you
* Wear safety glasses, and make sure anyone observing nearby does the same.
* Anyone working close enough to accidentally contact electrical components should wear insulating gloves.
* Be prepared. The odds may be low, but they are not zero. Keep a fire extinguisher nearby in case of faulty components or a wiring mistake.

![]({{site.url}}/{{site.baseurl}}/assets/images/EP_310_Personal_Protective_Equipment.webp)

![]({{site.url}}/{{site.baseurl}}/assets/images/EP_320_Magic_Smoke.webp)

![]({{site.url}}/{{site.baseurl}}/assets/images/EP_330_Discharge_Capacitors.webp)

{: .note}
In the following steps, the power supply unit (PSU) will be turned on. After the PSU is turned off, wait several minutes before handling any electronics to allow the capacitors to fully discharge.

### 21. Adjusting PSU to 24V

Now that you are working safe and responsibly, lets get on with it!

**Prerequisite:** Power is disconnected, jumpers installed, PSU power switch checked, fuses checked, continuity checks all passed

* **① Safety First:** Ensure you and others around you observing are wearing the appropriate PPE. Also have your safety equipment on hand.
* **②** Set voltmeter to DC Voltage Mode, choosing the lowest limit that is >=24V. In our image, that number is 200.
* **③** Connect the voltmeter's leads to the corresponding polarity terminals on the 24V lift lever terminal block: red lead to V+ and black lead to V−.
* **④** Connect power cable and power ON. A LED should light up on 24V PSU. Voltmeter should now have a reading close to 24V.
* **⑤** Adjust the potentiometer on the 24V PSU until voltmeter reads 24V.
* **⑥** Power OFF and disconnect the power cable. Remove the voltmeter from the 24V terminal block.

<img src="{{site.url}}/{{site.baseurl}}/assets/images/EP_340_PSU_Adjust.webp" width="100%" alt="">
<!-- ![]({{site.url}}/{{site.baseurl}}/assets/images/EP_340_PSU_Adjust.webp) -->

### 22. Install Terminal Block Covers

* Install terminal block covers for Terminal Block AC Power (TBAC) and Terminal Block DC Power (TBDC)

![]({{site.url}}/{{site.baseurl}}/assets/images/EP_350_Terminal_Block_Covers_Power.webp)

### 23. Install Cables: Z-13, Z-15, Z-17, Z-19

![]({{site.url}}/{{site.baseurl}}/assets/images/EP_360_Install_Cables-03.webp)

### 24. Install Cables: Z-14, Z-16, Z-18, Z-20

![]({{site.url}}/{{site.baseurl}}/assets/images/EP_370_Install_Cables-04.webp)

### 25. Install Cables: Z-07, Z-08, Z-09, Z-10, Z-21, Z-22

![]({{site.url}}/{{site.baseurl}}/assets/images/EP_380_Install_Cables-05.webp)

### 26. Install Cables: Z-23, Z-24, Z-26

![]({{site.url}}/{{site.baseurl}}/assets/images/EP_390_Install_Cables-06.webp)

### 27. Assembling Peripheral Blocks

* Feed cables through peripheral block
* Connector should be held snug by peripheral block when pushed into place.
  * Evauluate the fit
    * **Too Tight:** stop & reprint - scale part larger
    * **Good Fit:** Part snaps into place and is secure (doesn't pop out)
    * **Too Loose:** Dab of hot glue on back or Reprint - Scale part smaller
* Optional: Apply labels or indicators at connector.
* Apply zip-ties

![]({{site.url}}/{{site.baseurl}}/assets/images/EP_400_Peripheral_Block_Note.webp)

{: .note}
Before zip typing cables in next steps, you can add indicators or simply the Z-codes on the connector with sharpie. Otherwise, the cables can be identified using a continuity test as they are connected to the main board in later steps - Hold off plugging them in for now! A paperclip provides good access for the female connectors.

![]({{site.url}}/{{site.baseurl}}/assets/images/EP_410_Peripher_Block_Assembly.webp)

![]({{site.url}}/{{site.baseurl}}/assets/images/EP_420_Peripher_Block_Fit_Check.webp)

![]({{site.url}}/{{site.baseurl}}/assets/images/EP_430_Peripher_Block_ZipTies-01.webp)

![]({{site.url}}/{{site.baseurl}}/assets/images/EP_440_Peripher_Block_ZipTies-02.webp)

### 28. Install Cables: Z-42, Z-43, Z-44, Z-45

![]({{site.url}}/{{site.baseurl}}/assets/images/EP_450_Install_Cables-07.webp)

### 29. Install Cables: Z-27, Z-28

![]({{site.url}}/{{site.baseurl}}/assets/images/EP_460_Install_Cables-08.webp)

### 30. Install Cables: Z-34, Z-35, Z-32/33

![]({{site.url}}/{{site.baseurl}}/assets/images/EP_470_Install_Cables-09.webp)

### 31. Install Cables: Z-29, Z-30, Z-31

![]({{site.url}}/{{site.baseurl}}/assets/images/EP_480_Install_Cables-10.webp)

### 32. Install Cables: Z-40, Z-41

![]({{site.url}}/{{site.baseurl}}/assets/images/EP_490_Install_Cables-11.webp)

### 33. Install Cables: Z-38, Z-39

![]({{site.url}}/{{site.baseurl}}/assets/images/EP_500_Install_Cables-12.webp)

### 34. Install Cables: Z-36, Z-37

![]({{site.url}}/{{site.baseurl}}/assets/images/EP_510_Install_Cables-13.webp)


### 35. Continue and Finish "[Assembly - Electronics Backpack - Vertigo MK1](https://youtu.be/X98VDksNd48?si=C-eXoOUd_zGN5yOZ&t=408)"

<img src="{{site.url}}/{{site.baseurl}}/assets/images/EP_520_Continue_Youtube_Electronics_Backpack.webp" width="100%" alt="">

<!-- ![]({{site.url}}/{{site.baseurl}}/assets/images/EP_520_Continue_Youtube_Electronics_Backpack.webp) -->

<br>

### 36. Install Cables: Z-25, Z-48, Z-49, Z-53, Z-54, Z-55, Z-56, Z-60, Z-61, Z-114

![]({{site.url}}/{{site.baseurl}}/assets/images/EP_530_Install_Cables-14.webp)

### 37. Unplug Toolhead's XT30 Connector

![]({{site.url}}/{{site.baseurl}}/assets/images/EP_540_Unplug_Toolhead.webp)

### 38. Checking Toolhead Power

* **Safety First:** Ensure you and others around you observing are wearing the appropriate PPE. Also have your safety equipment on hand
* Ensure the toolhead is unplugged
* Set voltmeter to DC Voltage Mode, choosing the lowest limit that is >=24V. In our image, that number is 200
* Power ON the printer
* Touch the voltmeter's leads to the XT30 connector as shown - **Approach from the outside as to not cause an accidental short**
  * Black to Black
  * Red to Blue
* The voltmeter should read a positive 24V
* Power OFF the printer

<span style="color:green">**Pass:** Voltmeter reads **positive +24V**</span>

<span style="color:red">**Fail:** Voltmeter reads **negative -24V**, or any other value</span>

{: .warning }
Polarity matters! Make sure you are touching the correct leads to the correct points. This is the last safety check to save your toolhead board.

![]({{site.url}}/{{site.baseurl}}/assets/images/EP_545_Toolhead_Power_Check.webp)

## Continue to the [Firmware Guide]({{site.url}}\doc_tree\4_firmware\firmware.html)

This concludes the electronics backpack wiring required for firmware installation. We will integrate the remaining components in later steps.

{: .warning }
At this stage, only the cables that we have covered should be connected.
