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

{: .note}
The materials listed below are for one Endstop Pod.

| Hardware                                           | Qty |   
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

## Animated Assembly
<iframe style='width:100%; height:621px;' src="https://www.youtube.com/embed/QfOSu2yNCmc?si=UZh_bVq0Q3KChDJH" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

## Steps

### 1. Assemble and Install the Z Endstop Pods
 - Plug **Z-69** into the connector on the Z Enstop Switch PCB.
 - Sandwich the Z Endstop Switch PCB between the Z Enstop Pod and Z Endstop Pod Cap, ensuring the wires route around the screw stud. A tiny dab of glue can be used to keep the asssembly together if it's an issue during install.
 - Insert 2 **M3 Roll-In Nuts** into the inside slot of the lower side frame extrusion on side B as shown.
 - Loosely attach the Z Endstop Pod to the frame using 2 **M3x20 FHCS**. Don't tighten yet.
 - Slide the Z Endstop Pod under the endstop adjustment screw of Front Z Joint B.
 - Lower the Front Z Joint Bar to make sure the endstop adjustment screw presses the switch.
 - Tighten the Z Endstop Pod mounting screws.
 - Route the Z Endstop Pod wires through the extrusion slots as shown, installing cable covers as you go.
 - Repeat this for all 4 Z Endstop pods using the cables listed above, making sure to check that the corresponding Z Endstop Adjustment Screw presses the switch at the bend in the lever. **The height of the endstop adjustment screws will be calibrated later**.

{: .note}
The Z Endstop Pods will need to be installed with the mounting FHCS screws entering from the other side when installed on side A.

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
    model="{{site.url}}/{{site.baseurl}}/assets/3d/z_endstop.glb"
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

