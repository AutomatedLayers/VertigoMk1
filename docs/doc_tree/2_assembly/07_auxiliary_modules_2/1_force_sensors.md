---
title: Force Sensors
layout: assembly
parent: Auxiliary Modules Pt. 2
nav_order: 1
---

# Force Sensors
![]({{site.url}}/{{site.baseurl}}/assets/images/force_sensor.webp)

## Materials

| Hardware (for each sensor)                         | Qty |   
|:---------------------------------------------------|:----| 
| WAGO Connector - 2-Pin                             | 2   |
| M5x20 Dowel Pin                                    | 2   |
| Die Spring                                         | 1   |
| Magnet Cube                                        | 1   |
| Magnet 6mm x 3mm                                   | 2   |
| Makerbeam XL T-Nut                                 | 1   |
| M3x45 SHCS (Stainless)                             | 1   |
| M3x5.7 Brass Insert                                | 1   |
| M3x12x1 Oversized Washer                           | 2   |
| M3x7x0.5 Washer                                    | 5   |
| M4x12x1 Washer                                     | 2   |
| M4x12x1 Nylon Washer                               | 2   |
| Wave Spring Washer                                 | 2   |
| M3 Nyloc Nut                                       | 2   |
| M3 Cap Nut (Acorn Nut)                             | 1   |
| PTFE Tube - 3mm ID x 4mm OD (cut from long piece)  | 10mm|

| Cables - Side A                      | 
|:-------------------------------------|
| Z-60                                 |
| Z-73                                 |
| Z-74                                 |
| **Cables - Side B**                  | 
| Z-61                                 |
| Z-75                                 |
| Z-76                                 |

| Printed Parts                         | Qty |
|:--------------------------------------|:----|
| <a href="https://github.com/AutomatedLayers/VertigoMk1/blob/main/hardware/STL/10%20Auxilliary%20Modules%20%26%20Cable%20Routing/Force%20Triggers/Force%20Sensor%20Frame%20Mount%20A%20-%20Accent.stl" target="_blank">Force Sensor Frame Mount A</a> | 1  |
| <a href="https://github.com/AutomatedLayers/VertigoMk1/blob/main/hardware/STL/10%20Auxilliary%20Modules%20%26%20Cable%20Routing/Force%20Triggers/Force%20Sensor%20Frame%20Mount%20B%20-%20Accent.stl" target="_blank">Force Sensor Frame Mount B</a> | 1  |
| <a href="https://github.com/AutomatedLayers/VertigoMk1/blob/main/hardware/STL/10%20Auxilliary%20Modules%20%26%20Cable%20Routing/Force%20Triggers/Force%20Sensor%20Plug%20-%20Q2.stl" target="_blank">Force Sensor Plug</a> | 2  |
| <a href="https://github.com/AutomatedLayers/VertigoMk1/blob/main/hardware/STL/10%20Auxilliary%20Modules%20%26%20Cable%20Routing/Force%20Triggers/Force%20Sensor%20Rocker%20-%20Q2.stl" target="_blank">Force Sensor Rocker</a> | 2  |
| <a href="https://github.com/AutomatedLayers/VertigoMk1/blob/main/hardware/STL/00%20Tools/Force%20Sensor%20Washer%20Setting%20Tool.stl" target="_blank">Force Sensor Washer Setting Tool</a> | 1  |


## Animated Assembly

<iframe style='width:100%; height:621px;' src="https://www.youtube.com/embed/C0KE_nT1YOo?si=bt00TVDFhj8J_SiP" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

## Assembly Notes

 - **0:29** See the magnet polarity information below. We will make sure the magnets in the Bed Scraper Bar attract to the Force Sensors when we get to that section.
 - **0:41** These two magnets are a just a low profile way of retaining the more powerful cube magnet just installed.
 - **1:54** Compression of wave spring washers is not to scale.
 - **2:13** The PTFE will need to be cut from the long section of 3mm ID tube in the kit.
 - **2:19** You may need to hold the PTFE (gently with pliers if necessary) and screw the M3 into it if it doesn't slide on.
 - **2:40** The gap here is just to see that the PTFE stays up against the M3 washer on the left when the brass insert is threadlocked in place.
 - **2:46** Threadlocker or glue of your choice will work fine.
 - **3:07** ~2-3mm should do. This is just to make some room in the printed tool in the next step.
 - **3:44** Ensure not to move Nyloc when fastening the cap nut. 
 - **3:50** Relax the spring, but not entirely. The T-nut should have ~2 full rotations of compression on the spring.
  
{: .note}
>**3:29** The principle function of this tool is to set the position of the Nyloc nut on the right, such that the fixed wwasher is 32.6mm from the same-sized washer on the other side, which also has a locating feature in the tool. The tool acts like a wrench for the Nyloc, so the nut should not rotate when the screw is turned. As the M3 is screwed into the Nyloc, the play (gap) between the Nyloc and the fixed washer is closed, eventually pushing the other washer up against its locating feature. When that happens, we're ready to move on and lock the fixed washer in place from the other side. Below is a more in-depth look at how the tool should be used.
> <iframe src="https://docs.google.com/presentation/d/e/2PACX-1vQnrFP9683292Te3UQBI_oM1244eqARZym0LYXcoMPTrTByoLInpAos08uLyxGXo-lPPDhYonXa4W9M/pubembed?start=false&loop=false&delayms=3000" frameborder="0" width="100%" height="400px" allowfullscreen="true" mozallowfullscreen="true" webkitallowfullscreen="true"></iframe>

 - **3:47** Decompress until the spring is only compressed ~1mm from full extension. The proper force will be calibrated in the Checks and Calibration section.
 - **4:33** Remove support material from Force Sensor Plug.
 - **5:12** Force Sensor Frame Mount should touch the rear vertical extrusion.
 - **5:15** Side B Force Sensor can be assembled now, but wait to install it until the Routing Pod section. Continue to [Y Endstop]({{site.url}}/{{site.baseurl}}/doc_tree/2_assembly/07_auxiliary_modules_2/2_y-endstop.html)

{: .note}
>The compression force of the 'sensors' will be adjusted in the Checks and Calibration section. Part of the complexity in the design of the 'force sensors' was to ensure that they could be:
>- adjusted for compression force without disassembly
>- made from cheap, off-the-shelf components, commonly found in 3D printers
>- repeatable after install, particularly with regard to the wire routing and conducting contacts

---
## Magnet Polarity

<img src="{{site.url}}/{{site.baseurl}}/assets/images/force_sensor_magnet_polarity.svg" width="100%" alt="">

---
## Continuity Testing

**Preprequisite:** 
* Set multimeter to continuity mode
* Multimeter continuity mode tested and working (beeps when touching leads)

**Test:**
* Insert the multimeter leads into the Wago connectors as shown.
* With no force applied to the rocker, the multimeter should beep.
* Apply force to the rocker. The beeping should stop, indicating the connection is broken.
* Release the rocker. The multimeter should beep again, confirming the connection has returned.

<span style="color:green">**Pass:** The multimeter beeps with no force, stops beeping when force is applied, and beeps again when the force is released.</span>

<img src="{{site.url}}/{{site.baseurl}}/assets/images/force_sensor_continuity_test.svg" width="100%" alt="">

---

## Interactive View
<div class="online_3d_viewer"
    model="https://media.githubusercontent.com/media/AutomatedLayers/VertigoMk1/main/docs/assets/3d/force_sensor.glb"
    backgroundcolor="244, 246, 250"
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
