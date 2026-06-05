---
title: Gantry Bar
layout: assembly
parent: Gantry
nav_order: 2
---

# Gantry Bar
![]({{site.url}}/{{site.baseurl}}/assets/images/gantry_bar.webp)

## Materials

| Hardware - XY Joint (for each side)                | Qty |   
|:---------------------------------------------------|:----| 
| Shoulder Screw - 25mmx5mm Shoulder - M4x4.5 Thread (M4x25mm) | 2   | 
| Bearing - F695                                     | 2   |
| Gates GT2 Toothed Idler Pulley - 6mm Belt          | 1   |
| M5x10x1 Washer                                     | 2   |
| M5x7x1 Washer (Washer M5)                          | 2   |
| M5x20 BHCS                                         | 1   | 
| M5x30 BHCS  [M5x35 BHCS for Side B]                | 1   | 
| M3x30 SHCS                                         | 1   | 
| M3x35 SHCS                                         | 1   | 
| M3x12 FHCS                                         | 4   | 
| M5 Roll-In Nut                                     | 1   |
| M5 Hex Nut                                         | 1   |
| M4 Hex Nut                                         | 2   |
| M3x5.7 Brass Insert                                | 2   | 
| **Hardware - X Axis**                              | **Qty** |   
|:---------------------------------------------------|:----| 
| Extrusion 2010-370-Z5-ZA25-XB345                   | 1   |
| MGN9H-300 Linear Guide                             | 1   |
| M3 Roll-In Nut                                     | 7   |
| M3x8 SHCS                                          | 7   |
| **Hardware - X Carriage Block**                    | **Qty** |   
|:---------------------------------------------------|:----|
| Magnet - 1/2in Countersunk                         | 4   |
| Magnet - 1/4in Countersunk                         | 2   |
| Makerbeam XL T-Nut                                 | 2   |
| M3x8 SHCS                                          | 1   |
| M3x30 SHCS                                         | 2   |
| M3x16 SHCS                                         | 2   |
| M3x8 FHCS                                          | 4   |
| M3 Cap Nut (Acorn Nut)                             | 3   |
| M2x16 SHCS                                         | 2   |
| M2x8 FHCS                                          | 2   |
| M2 Hex Nut                                         | 2   |

| Printed Parts                    | Qty |
|:---------------------------------|:----|
| <a href="https://github.com/AutomatedLayers/VertigoMk1/blob/main/hardware/STL/04%20XY%20Gantry/XY%20Joints/XY%20Joint%20A%20-%20Bottom.stl" target="_blank">XY Joint A - Bottom</a> | 1  |
| <a href="https://github.com/AutomatedLayers/VertigoMk1/blob/main/hardware/STL/04%20XY%20Gantry/XY%20Joints/XY%20Joint%20A%20-%20Carriage.stl" target="_blank">XY Joint A - Carriage</a> | 1  |
| <a href="https://github.com/AutomatedLayers/VertigoMk1/blob/main/hardware/STL/04%20XY%20Gantry/XY%20Joints/XY%20Joint%20A%20-%20Top.stl" target="_blank">XY Joint A - Top</a> | 1  |
| <a href="https://github.com/AutomatedLayers/VertigoMk1/blob/main/hardware/STL/04%20XY%20Gantry/XY%20Joints/XY%20Joint%20B%20-%20Bottom.stl" target="_blank">XY Joint B - Bottom</a> | 1  |
| <a href="https://github.com/AutomatedLayers/VertigoMk1/blob/main/hardware/STL/04%20XY%20Gantry/XY%20Joints/XY%20Joint%20B%20-%20Carriage.stl" target="_blank">XY Joint B - Carriage</a> | 1  |
| <a href="https://github.com/AutomatedLayers/VertigoMk1/blob/main/hardware/STL/04%20XY%20Gantry/XY%20Joints/XY%20Joint%20B%20-%20Top.stl" target="_blank">XY Joint B - Top</a> | 1  |
| <a href="https://github.com/AutomatedLayers/VertigoMk1/blob/main/hardware/STL/04%20XY%20Gantry/XY%20Joints/XY%20Joint%20B%20-%20Endstop%20Block%20-%20Accent.stl" target="_blank">XY Joint B - Endstop Block</a> | 1  |

## Animated Assembly

<iframe style='width:100%; height:621px;' src="https://www.youtube.com/embed/W9qf38xfoFk?si=WkttvpxSy8tU3iub" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

## Assembly Notes

 - **0:26** The M4 Nuts may not stay in their pockets, but they will be tightened into them soon, just don't lose them in the meantime.
 - **3:02** The assembly process is the same on this side but note from the video and the interactive model below that the locations of the toothed and smooth idlers are different. There is also no Endstop block on this side, so an M5x30 BHCS is used instead where the M5x35 BHCS is on side B.
 - **4:01** These M2 SHCS add a bit of rigidity. You can use glue when threading.
 - **4:30** See the magnet polarity information below. **Magnets are fragile! Do not over-tighten!**
 - **4:52** Installing these is easiest if each magnet is screwed down **one at a time**, otherwise they may attract, come loose from their pockets, snap together, and break. These are the magnets that should be used as a reference for others magnets, as described below. They are all the same polarity and relatively accessible. 

{: .important}
The Gantry Bar should slide easily along the full travel of the y-axis rails. If there are areas where you feel higher resistance than others, you may need to check the y-axis rail alignment, or possibly the alignment of the gantry extrusions on the frame.

<!-- ## Steps

### 1. Assemble XY Joint B
 - Insert an M3x5.7 Brass Insert and 2 M4 Hex Nuts into the XY Joint B - Bottom.
 - With the XY Joint B - Top, flipped upside down, insert one Shoulder Screw - 25mmx5mm Shoulder - M4x4.5 Thread through the XY Joint B - Top, an M5x7x1 Washer, a GT2 20T Toothed Idler, and another M5x7x1 Washer .
 - Insert another Shoulder Screw - 25mmx5mm Shoulder - M4x4.5 Thread through the XY Joint B - Top, an M5x10x1 Washer, an idler made from 2 Bearings - F695, and another M5x10x1 Washer.
 - Slide the XY Joint B - Bottom over the shoulder bolts and fasten the bolts to the M4 Hex Nuts.
 - Secure the top and bottom of the XY Joint B assembly with an M3x30 SHCS.
 - Insert an M3x5.7 Brass Insert into the XY Joint B - Carriage.
 - Join the XY Joint B - Carriage to the XY Joint B - Bottom along the box joints and fasten with an M3x35 SHCS.
 - Slide the Extrusion 2010-370-Z5-ZA25-XB345 into the XY Joint B assembly.
 - Place an M5 Roll-In Nut into the extrusion slot and use an allen wrench to align it with the hole nearest the end of the extrusion in the XY Joint B - Top.
 - Fasten the XY Joint B assembly to the extrusion with an M5x20 BHCS into the aligned roll-in nut.
 - Place an M5 Hex Nut in the XY Joint B - Carriage; place the Endstop Block into the XY Joint B with the flat side facing the extrusion, and secure the XY Joint B assembly to the extrusion with an M5x35 BHCS.
  -->
<!-- ### 2. Assemble XY Joint A -->



<!-- ### 3. Assemble and Install the Toolhead Carriage Block
 - Use 7 M3x8 SHCS and M3 Roll-In Nuts to install the MGN9H-300 Linear Guide, using the rail alignment tools.
 - Screw in 2 M2x16 SHCS to the Toolhead Carriage Block. These are only to increase rigidity.
 - Insert 3 M3 Cap Nuts into the top of the Toolhead Carriage Block.
 - Fasten the cap nuts to the assembly with an M3x8 SHCS in the rear and 2 M3x30 SHCS in the front.
 - Attach 2 Magnet-1/4in Countersunk to the Toolhead Carriage Block with 2 M2x8 FHCS and 2 M2 Hex Nuts. **FRAGILE! Don't over-tighten.**
   - **Note the magnet polarity before installation.**
   - Refer to the image below for polarity orientation, using the Magnet-1/2in Countersunk as the reference.
 - Loosely attach 2 Makerbeam XL T-Nuts to the Toolhead Carriage Block with 2 M3x16 SHCS.
 - Install the Toolhead Carriage Block assembly to the X-axis linear guide with 4 M3x8 FHCS, screwing each of them through a Magnet-1/2in Countersunk. This is easiest if each magnet is screwed down **ONE AT A TIME**, otherwise they may attract, come loose from their pockets, and break. -->

---
#### Magnet Polarity
<img src="{{site.url}}/{{site.baseurl}}/assets/images/carriage_magnet_polarity.svg" width="100%" alt="">

<!-- ### 4. Attach the Gantry Bar (X-axis) to the Y-Axis Carriages
 - Make sure the M5 Button Heads attaching the XY Joints to the X-axis extrusion are slightly loose, but still in the nuts. A half turn CCW should do.
 - Use 4 M3x12 FHCS to attach each XY Joint to the y-axis guide carriages.
 - Re-tighten the M5 Button heads. -->

---
## Interactive View
<div class="online_3d_viewer"
    model="https://media.githubusercontent.com/media/AutomatedLayers/VertigoMk1/main/docs/assets/3d/gantry_bar.glb"
    backgroundcolor="244, 246, 250"
    camera="
    -0.16462540259653796, 0.6947175468039145, 0.3110573203211509,
    -0.02628018914711079, 0.5102572622046775, 0.03436689342229495,
    0, 1, 0
    "
    environmentmap=
    "
    {{site.url}}/{{site.baseurl}}/assets/js/o3dv/envmaps/studio/px.png,
    {{site.url}}/{{site.baseurl}}/assets/js/o3dv/envmaps/studio/nx.png,
    {{site.url}}/{{site.baseurl}}/assets/js/o3dv/envmaps/studio/py.png,
    {{site.url}}/{{site.baseurl}}/assets/js/o3dv/envmaps/studio/ny.png,
    {{site.url}}/{{site.baseurl}}/assets/js/o3dv/envmaps/studio/pz.png,
    {{site.url}}/{{site.baseurl}}/assets/js/o3dv/envmaps/studio/nz.png
    "
    >
</div>

