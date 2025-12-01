---
title: Bed Lever
layout: assembly
parent: Z Joints
nav_order: 3
---

# Bed Lever
![]({{site.url}}/{{site.baseurl}}/assets/images/bed_lever.webp)

## Materials

| Hardware                                  | Qty |   
|:------------------------------------------|:-- -|
| Channel Magnet - 40mm                     | 1   |
| Strike Plate - 40mm                       | 1   |
| Tension Spring - 25mm x 4mm               | 2   |
| Tooling Ball                              | 1   |
| M5 Hex Nut                                | 1   |
| M5x10x1 Washer                            | 1   |
| M3x60 Dowel                               | 2   |
| M5x60 D-Shaft                             | 1   |
| M5x16 BHSC                                | 2   |
| M3x12 SHSC                                | 2   |
| M3x10 FHSC                                | 4   |
| M2x8 SHSC                                 | 6   |
| M5 Roll-In Nut                            | 2   |
| M3 Roll-In Nut                            | 2   |
| M3 Hex Nut                                | 2   |


## Steps

### 1. Setup the Front Z Joint Bar

{: .note}
This is easiest to do with the Front Z Joint Bar Assembly or just the 2020-320 Extrusion detached from the main printer assembly.

 - Flip the Front Z Joint Bar upside down
 - Place 2 **M3 Roll-In Nuts** into the extrusion
 - Place 2 **M5 Roll-In Nuts** on the outside of the **M3 Roll-In Nuts**
 - Use the Bed Lever Frame Mount printed part to align the Roll-In Nuts. The whole assembly will be centered later on the extrusion

### 2. Assemble the Bed Lever

 - Drop a dab of red Loctite on the **Tooling Ball** thread
 - Place the **M5x10x1 Washer** on the Bed Lever printed part and screw the **Tooling Ball** through the washer and lever into an **M5 Hex Nut**
 - Use a cloth and pliers on the **Tooling  Ball** shank to tighten it to the Bed Lever
 - Push 2 **M3x60 Dowels** into the Bed Lever printed part. These add to the rigidity of the lever
 - Attach the **Strike Plate** to the lever using 2 **M3x10 FHCS** and 2 **M3 Hex Nuts**
 - On each outer side of the Bed Lever Frame Mount printed part, thread in an **M2x8 SHCS** until the end is flush with the inner face of the part
 - On each inner side of the frame mount, attach a **Tension Spring** using an **M2x8 SHCS**. The heads of these screws should be flush with the innermost printed surface
 - Position the Bed Lever printed part in the Frame Mount and push an **M5x60 D-Shaft** through both parts. The fit should be very snug in the lever
 - In the Frame Mount, thread in 2 **M3x12 SHCS** until the ends are just visible in the D-Shaft slotted hole
 - Place 2 **M2x8 SHCS** through the open end of the **Torsion Springs** and thread them into their holes in the Bed Lever, leveraging the **Torsion Springs** into the stretched position
 - Open the lever and lock it in the open position using the 2 outer **M2x8 SHCS**
  
### 3. Attach the Bed Lever to the Front Z Joint Bar

{: .warning }
The channel magnet is **STRONG**, and also rather fragile. Use caution with ferrous metal nearby, especially the strike plate that goes with the lever. Also, be careful not to overtighten the magnet's mounting screws; it will fracture.

 - Place the **Channel Magnet** into the Bed Lever Frame Mount printed part and loosely fasten it to the extrusion with 2 **M3x10 FHCS**
 - Screw 2 **M5x16 BHCS** loosely through the Bed Lever Frame Mount to the extrusion
 - Slide the Bed Lever Assembly until it is centered on the extrusion. The edge of the Frame Mount should be ~118mm from the end of the extrusion
 - Tighten the 2 **M3x10 FHCS** and 2 **M5x16 BHCS** to secure the assembly to the extrusion
 - Hold open the Bed Lever and loosen the two **M2x8 SHCS** position locks
 - **Carefully and Slowly** close the lever
 - Screw in the **M3x12 SHCS** on Side A until the head is on the stopper
 - Screw in the **M3x12 SHCS** on Side B until the screw just barely touches the **M5x60 D-Shaft**

{: .important}
Check for any play in the bed lever by trying to rock it across an imaginary axis from the fixed **M3x12 SHCS** on Side A to the corner of the strike plate on Side B. It is designed such that the magnet and strike plate -- installed at a slight angle -- create a line contact, analogous to 2 points. The fixed M3 screw provides a 3rd point contact. The lever is further constrained in Rz, X, and Y by the hinge. This means that the M3 screw on Side B is an overconstraint when the lever is closed. It is used to constrain the lever motion during the lever opening action. If there is play when the lever is closed, make sure the adjustable M3 screw is not pushing on the D-shaft and that the magnet and strike plate are properly installed. Check that no pieces of metal or debris got stuck under the magnet.

## Interactive View
<div class="online_3d_viewer"
    model="{{site.url}}/{{site.baseurl}}/assets/3d/bed_lever.glb"
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