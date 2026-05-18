---
title: Front Z Joints
layout: assembly
parent: Z Joints
nav_order: 2
---

# Front Z Joints
![]({{site.url}}/{{site.baseurl}}/assets/images/z_joints_front.webp)

## Materials

| Hardware (for each side)                  | Qty |   
|:------------------------------------------|:-- -| 
| Extrusion 2020-320                        | 1   |
| M3x10Lx6W Hex Standoff (Coupling Hex Nut) | 2   |
| Spherical Bearing - GE5C                  | 1   |
| M5x20 BHCS                                | 1   | 
| M5x40 BHCS                                | 1   | 
| M3x16 SHCS                                | 4   | 
| M3x25 SHCS                                | 4   | 
| M3x35 SHCS                                | 2   | 
| M3x40 SHCS                                | 2   | 
| M3x5.7 Brass Insert                       | 2   | 
| M3x4.3 Brass Insert (4.5)                 | 2   | 
| M5 Roll-In Nut                            | 1   |
| [***Side B Only** M3x10 SHCS]              | [1] | 

| Printed Parts                    | Qty |
|:---------------------------------|:-- -|
| <a href="https://github.com/AutomatedLayers/VertigoMk1/blob/main/hardware/STL/03%20Z%20Joints/Belt%20Clamps/Belt%20Clamp%20Bottom%20-%20Accent%20-%20Q4.stl" target="_blank">Belt Clamp Bottom</a> | 2   |
| <a href="https://github.com/AutomatedLayers/VertigoMk1/blob/main/hardware/STL/03%20Z%20Joints/Belt%20Clamps/Belt%20Clamp%20Top%20-%20Accent%20-%20Q4.stl" target="_blank">Belt Clamp Top</a> | 2   |
| <a href="https://github.com/AutomatedLayers/VertigoMk1/blob/main/hardware/STL/03%20Z%20Joints/Front%20Z%20Joints/Front%20Joint%20-%20Spherical%20Bearing%20Block%20-%20Accent%20-%20Q2.stl" target="_blank">Spherical Bearing Block</a> | 2   |
| <a href="https://github.com/AutomatedLayers/VertigoMk1/blob/main/hardware/STL/03%20Z%20Joints/Front%20Z%20Joints/Front%20Joint%20A%20-%20Carriage%20Block%20-%20Multi.stl" target="_blank">Front Joint A - Carriage Block</a> | 1   |
| <a href="https://github.com/AutomatedLayers/VertigoMk1/blob/main/hardware/STL/03%20Z%20Joints/Front%20Z%20Joints/Front%20Joint%20A%20-%20Endstop%20Adjustment.stl" target="_blank">Front Joint A - Endstop Adjustment</a> | 1   |
| <a href="https://github.com/AutomatedLayers/VertigoMk1/blob/main/hardware/STL/03%20Z%20Joints/Front%20Z%20Joints/Front%20Joint%20A%20-%20Middle%20Support.stl" target="_blank">Front Joint A - Middle Support</a> | 1   |
| <a href="https://github.com/AutomatedLayers/VertigoMk1/blob/main/hardware/STL/03%20Z%20Joints/Front%20Z%20Joints/Front%20Joint%20A%20-%20Rear%20Cover.stl" target="_blank">Front Joint A - Rear Cover</a> | 1   |
| <a href="https://github.com/AutomatedLayers/VertigoMk1/blob/main/hardware/STL/03%20Z%20Joints/Front%20Z%20Joints/Front%20Joint%20B%20-%20Carriage%20Block%20-%20Multi.stl" target="_blank">Front Joint B - Carriage Block</a> | 1   |
| <a href="https://github.com/AutomatedLayers/VertigoMk1/blob/main/hardware/STL/03%20Z%20Joints/Front%20Z%20Joints/Front%20Joint%20B%20-%20Endstop%20Adjustment.stl" target="_blank">Front Joint B - Endstop Adjustment</a> | 1   |
| <a href="https://github.com/AutomatedLayers/VertigoMk1/blob/main/hardware/STL/03%20Z%20Joints/Front%20Z%20Joints/Front%20Joint%20B%20-%20Middle%20Support.stl" target="_blank">Front Joint B - Middle Support</a> | 1   |
| <a href="https://github.com/AutomatedLayers/VertigoMk1/blob/main/hardware/STL/03%20Z%20Joints/Front%20Z%20Joints/Front%20Joint%20B%20-%20Rear%20Cover.stl" target="_blank">Front Joint B - Rear Cover</a> | 1   |

## Animated Assembly

<iframe style='width:100%; height:621px;' src="https://www.youtube.com/embed/2lDIZEWfpks?si=Or_HjbJ9XdGpA31k"  title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

## Assembly Notes

 - **1:10** Both The M5x20 BHCS and M3x10 SHCS thread into plastic. They will be used to adjust the height of the Z Joints when the endstop and safety switch are triggered, respectively. Skip the glue until that calibration is done. Side A has no M3x10 SHCS safety switch position screw, so the Endstop Adjustment printed part looks a bit different on side A and B.
 - **2:40** If it's tricky to slide the Z Joints into the extrusion with the roll-in nuts attached, just unscrew them and insert them into the extrusion first.
 - **2:43** This can be dialed in later when the Front Z Joints are attached to the rails.

<!-- ### 1. Assemble Front Z Joint
 - Press in 2 M3x5.7 Brass Inserts to the Front Joint B Carriage Block.
 - Slide the M3x10 Coupling Nut into the rear slot in the Front Joint B Carriage Block.
 - Push in 2 M3x25 SHCS as shown.
 - Use 2 M3x25 SHCS to attach the Front Joint B Rear Cover.
 - Press in 2 M3x4.3 Brass Inserts to the Front Joint B Endstop Adjustment.
 - Thread a M5x20 BHCS into the Front Joint B Endstop Adjustment. The proper location of this screw will be adjusted later.
 - **[*Side B Only** Thread a M3x10 SHCS into the Front Joint B Endstop Adjustment. The proper location of this screw will be adjusted later**]**.
 - Slide the Front Joint B Middle Support into place and fasten it with 2 M3x40 SHCS.
 - Slide the M3x10 Coupling Nut into the front slot in the Front Joint B Carriage Block.
 - Push in 2 M3x35 SHCS as shown.
 - Use 2 M3x16 SHCS to attach a belt clamp to the top and bottom of the Front Joint B Carriage Block.
 - Press the Spherical Bearing GE5C into the Front Joint Spherical Bearing Block.
 - Make sure the slot in the printed bearing block points toward the belt clamps.
 - Push an M5x40 BHCS through the spherical bearing and Z Joint, and thread it into an M5 Roll-In Nut but do not tighten.

### 2. Assemble Front Z Joint Bar
 - Repeat Step 1 for Front Z Joint A.
 - Slide the Z Joints onto either end of the Extrusion 2020-320 such that the roll-in nuts enter the extrusion slot.
 - Leave about 1mm on each side and snug the M5x40 BHCS but still do not tighten yet.
 - Attach the Front Z Joint Bar to the Z Axis Linear Carriages by first tightening the captive fasteners, then the outer fasteners.
 - Make sure the gaps are about even on both ends of the extrusion and that the Front Z Joint Bar slides freely up and down the Z Axis.
 - Finally you get to tighten the M5x40 BHCS . -->

## Interactive View
<div class="online_3d_viewer"
    model="{{site.url}}/{{site.baseurl}}/assets/3d/front_z_joints.glb"
    backgroundcolor="244, 246, 250"
    camera="
    0, 0.35460301851425213, 0.5353489231611536,
    0, 0.31849222391429477, 0.14661257197666216,
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
