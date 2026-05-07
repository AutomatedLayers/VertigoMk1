---
title: XY Drives
layout: assembly
parent: Gantry
nav_order: 3
---

# XY Drives
![]({{site.url}}/{{site.baseurl}}/assets/images/xy_drive.webp)

## Materials

{: .note}
The materials listed below are for each side.

| Hardware                                           | Qty |   
|:---------------------------------------------------|:----| 
| Stepper Motor - LDO-42STH48-2804AC                 | 1   |
| GT2 20T Timing Pulley - 6mm Belt                   | 1   |
| Bearing - F695                                     | 6   |
| M5x10x1 Washer                                     | 6   |
| Shoulder Screw - 25mmx5mm Shoulder - M5x9.5 Thread | 2   |
| M5 x 40 BHCS                                       | 3   |
| M5 Roll-In Nut                                     | 5   |
| M3x40 SHCS                                         | 4   |
| M3x30 SHCS                                         | 4   |
| M3x5.7 Brass Insert                                | 3   | 


## Animated Assembly
<iframe style='width:100%; height:621px;' src="https://www.youtube.com/embed/ccUepr55wgw?si=n45WT-qfufjVqsDe" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

## Steps

### 1. Assemble XY Drive Housing A
 - Insert 3 **M3x5.7 Brass Insert** into the XY Drive Housing A - Bottom
 - Slide the XY Drive Housing A - Top, then the XY Drive A Cam Slider onto the XY Drive A Cam
 - Use an **M3x30 SHCS** to attach the XY Drive A Cam Cap to the bottom of the XY Drive A Cam
 - Turn the assembly upside down and push 2 **Shoulder Screw - 25mmx5mm Shoulder - M5x9.5 Thread** into the XY Drive Housing A - Top
 - On the shoulder screw nearest the center of the assembly, place an XY Drive Spacer (printed part), an **M5x7x1 Washer**, an idler made from 2 **Bearings - F695**, and another **M5x7x1 Washer**
 - On the other shoulder screw, place another **Bearings - F695** idler with 2 **M5x7x1 Washers** on either side
 - Slide the XY Drive Housing A - Bottom onto the assembly over the shoulder screws and use 3 **M3x30 SHCS** to attach it. You may need to rotate the cam handle out of the way
 - Slide a **GT2 20T Timing Pulley - 6mm Belt** onto the shaft of the **Stepper Motor - LDO-42STH48-2804AC** with the **set screws at the end of the shaft**
 - Place the Pulley Offset Tool Side A onto the shaft-side face of the Stepper Motor so that the upper lip of the tool is against the teeth of the timing pulley
 - Push the timing pulley down until the shaft collar is againt the upper lip of the Pulley Offset Tool
 - Tighten the set screws to the shaft and remove the Pulley Offset Tool 
 - Make sure the connector of the stepper motor is pointing toward the cam handle and attach the stepper motor to the XY Drive Housing A assembly using 4 **M3x40 SHCS** through the 'sacrificial' XY Drive Clamp Plate. For now these can just be snug but don't be araid to clamp the crap out of the clamp plate when we get to belt tensioning.

### 2. Install XY Drive Housing A
 - Place 5 **M5 Roll-In Nuts** into the frame as shown and use the XY Drives Nut Alignment Tool to align the nuts
 - Place the XY Drive Housing A on the frame and tighten to snug the two shoulder screws
 - Use 3 **M5x40 BHCS** to secure the XY Drive Housing A to the frame
 - Optionally, cover the drive housing with the XY Drive A Lid

### 3. Assemble and Install XY Drive Housing B

{: .note}
> The assembly and install processes for side B are the same, however there are two positional differences:
> - The XY Drive Spacer and idler are flipped, so the spacer is on the bottom and idler on top.
> - The timing pulley is flipped such that the shaft collar is near the motor. The Pulley Offset Tool Side B is used in the same way, with the upper lip concentric with the teeth of the pulley, so the flange will be resting on the upper lip of the tool instead of the shaft collar.

## Interactive View
<div class="online_3d_viewer"
    model="{{site.url}}/{{site.baseurl}}/assets/3d/xy_drive.glb"
    backgroundcolor="244, 246, 250"
    camera="
    -0.27, 0.6, -0.37,
    -0.15, 0.51, -0.23, 
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


