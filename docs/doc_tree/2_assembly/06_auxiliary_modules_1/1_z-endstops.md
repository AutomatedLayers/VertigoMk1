---
title: Z Endstops
layout: assembly
parent: Auxiliary Modules Pt. 1
nav_order: 2
---

# Z Endstops
![]({{site.url}}/{{site.baseurl}}/assets/images/z_endstop.webp)

{: .important}
This is the first section where cables are installed, so it's a good time to check out the section of the Wiring Guide: [Understanding the Wiring Diagram & Cable Spec]({{site.url}}/{{site.baseurl}}/doc_tree/3_wiring/wiring.html#understanding-the-wiring-diagram--cable-spec)

## Materials

| Hardware (for 1 of 4 pods)                         | Qty |   
|:---------------------------------------------------|:----| 
| Z Endstop Switch PCB                               | 1   |
| M3 Roll-In Nut                                     | 2   |
| M3x20 FHCS                                         | 2   |

| Cables                               | 
|:-------------------------------------|
| Z-68                                 |
| Z-69                                 |
| Z-70                                 |
| Z-71                                 |

| Printed Parts                         | Qty |
|:--------------------------------------|:----|
| <a href="https://github.com/AutomatedLayers/VertigoMk1/blob/main/hardware/STL/10%20Auxilliary%20Modules%20%26%20Cable%20Routing/Endstops%20%26%20Cable%20Routing/Cable%20Cover%2010mm%20-%20Q4.stl" target="_blank">Cable Cover 10mm</a> | 2  |
| <a href="https://github.com/AutomatedLayers/VertigoMk1/blob/main/hardware/STL/10%20Auxilliary%20Modules%20%26%20Cable%20Routing/Endstops%20%26%20Cable%20Routing/Cable%20Cover%2025mm%20-%20Q4.stl" target="_blank">Cable Cover 25mm</a> | 4  |
| <a href="https://github.com/AutomatedLayers/VertigoMk1/blob/main/hardware/STL/10%20Auxilliary%20Modules%20%26%20Cable%20Routing/Endstops%20%26%20Cable%20Routing/Cable%20Cover%2055mm%20-%20Q8.stl" target="_blank">Cable Cover 55mm</a> | 2  |
| <a href="https://github.com/AutomatedLayers/VertigoMk1/blob/main/hardware/STL/10%20Auxilliary%20Modules%20%26%20Cable%20Routing/Endstops%20%26%20Cable%20Routing/Cable%20Cover%20240mm%20-%20Q2.stl" target="_blank">Cable Cover 240mm</a> | 2  |
| <a href="https://github.com/AutomatedLayers/VertigoMk1/blob/main/hardware/STL/10%20Auxilliary%20Modules%20%26%20Cable%20Routing/Endstops%20%26%20Cable%20Routing/Cable%20Gutter%20-%20Z%20Endstop%20Center.stl" target="_blank">Cable Gutter - Z Endstop Center</a> | 1  |
| <a href="https://github.com/AutomatedLayers/VertigoMk1/blob/main/hardware/STL/10%20Auxilliary%20Modules%20%26%20Cable%20Routing/Endstops%20%26%20Cable%20Routing/Z%20Endstop%20Pod%20-%20Q4.stl" target="_blank">Z Endstop Pod</a> | 4  |
| <a href="https://github.com/AutomatedLayers/VertigoMk1/blob/main/hardware/STL/10%20Auxilliary%20Modules%20%26%20Cable%20Routing/Endstops%20%26%20Cable%20Routing/Z%20Endstop%20Pod%20Cap%20-%20Q4.stl" target="_blank">Z Endstop Pod Cap</a> | 4  |

## Animated Assembly
<iframe style='width:100%; height:621px;' src="https://www.youtube.com/embed/QfOSu2yNCmc?si=UZh_bVq0Q3KChDJH" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

## Assembly Notes

{: .important}
>**0:15** These are **NOT** the cables that come in the packages with the endstop PCBs. The correct cables will be labeled and packaged with the rest of the cable bundles.

 - **0:24** Sandwich the Z Endstop Switch PCB between the Z Enstop Pod and Z Endstop Pod Cap, ensuring the wires route around the screw stud. A tiny dab of glue can be used to keep the pod and cap together if it's an issue during install.
 - **0:53** This step is only for aligning the Z Endstop Pod, not for adjusting the height of the Z Joint at endstop trigger.
 - **1:37** These two cable covers are separate because the 9mm belt attached to this tensioner runs close to the extrusion. The gap between these cable covers should roughly match the gap in the tensioner where the 9mm toothed idler sits.
 - **2:16** The Z Endstop Pods will need to be installed with the mounting FHCS screws entering from the other side when installed on side A.  They are designed with this "symmetry" in mind -- also noted at 2:26.


<!-- ## Steps

### 1. Assemble and Install the Z Endstop Pods
 - Plug Z-69 into the connector on the Z Enstop Switch PCB.
 - Sandwich the Z Endstop Switch PCB between the Z Enstop Pod and Z Endstop Pod Cap, ensuring the wires route around the screw stud. A tiny dab of glue can be used to keep the pod and cap together if it's an issue during install.
 - Insert 2 M3 Roll-In Nuts into the inside slot of the lower side frame extrusion on side B as shown.
 - Loosely attach the Z Endstop Pod to the frame using 2 M3x20 FHCS. Don't tighten yet.
 - Slide the Z Endstop Pod under the endstop adjustment screw of Front Z Joint B.
 - Lower the Front Z Joint Bar to make sure the endstop adjustment screw presses the switch at the bend in the lever.
 - Tighten the Z Endstop Pod mounting screws.
 - Route the Z Endstop Pod wires through the extrusion slots as shown, installing cable covers as you go.
 - **Position the 25mm and 10mm along the front-facing slot of the lower rear extrusion such that the gap between them leaves room for the Z-axis belt that will come up from the tensioner**
 - Repeat this for all 4 Z Endstop pods using the cables listed above, making sure to check that the corresponding Z Endstop Adjustment Screw presses the switch at the bend in the lever. **The height of the endstop adjustment screws will be calibrated later**. -->

<!-- {: .note}
The Z Endstop Pods will need to be installed with the mounting FHCS screws entering from the other side when installed on side A. -->

#### Z Enstop Cable Location on printer

```        
            Rear
      Z-70 ------ Z-71
        |          |
 Side A |          | Side B
        |          | 
      Z-68 ------ Z-69
            Front
```

## Interactive View
<div class="online_3d_viewer"
    model="https://media.githubusercontent.com/media/AutomatedLayers/VertigoMk1/main/docs/assets/3d/z_endstop.glb"
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

