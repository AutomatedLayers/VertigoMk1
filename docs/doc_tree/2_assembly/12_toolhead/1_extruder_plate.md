---
title: Extruder Plate
layout: assembly
parent: Toolhead
nav_order: 1
---

# Extruder Plate

![]({{site.url}}/{{site.baseurl}}/assets/images/toolhead_plate.webp)

{: .important}
Go to the [Configuring the Toolhead Board]({{site.url}}/{{site.baseurl}}/doc_tree/3_wiring/wiring.html#configuring-the-toolhead-board) section of the Wiring Guide to set up the toolhead board before install.

## Materials

| Hardware                                           | Qty |   
|:---------------------------------------------------|:----| 
| E3D Revo PZ Probe Coldside                         | 1   |
| E3D Revo Heatercore - Vertigo Mk1 edition          | 1   |
| E3D Revo Nozzle                                    | 1   |
| Toolhead Plate - CNC Steel                         | 1   |
| PTFE Tube - 2mm ID                                 | 1   |
| Torsion Spring                                     | 1   |
| Razor Blade: Excel 20005                           | 1   |
| LDO Orbiter Extruder                               | 1   |
| Magnet 1/4in Countersunk                           | 2   |
| Switch - D2HW                                      | 2   |
| M3x40 SHCS                                         | 2   |
| M3x30 SHCS                                         | 2   |
| M3x14 SHCS                                         | 1   |
| M3x8 SHCS                                          | 1   |
| M3x10 FHCS                                         | 4   |
| M2x16 SHCS                                         | 1   |
| M2x8 SHCS                                          | 4   |
| M2x8 FHCS                                          | 2   |
| M3 Nyloc Nut                                       | 3   |
| M2 Hex Nut                                         | 2   |
| M3x5.7 Brass Insert                                | 4   |
| Zip Tie                                            | 2   |


| Pogo Pin Cables                      | 
|:-------------------------------------|
| Z-102                                |
| Z-103                                |
| Z-104                                |
| **Heatercore Cables**                | 
| Z-108                                |
| Z-109                                |
| **X Endstop Cable**                  | 
| Z-100                                |
| **PZ Probe Controller Cable**        | 
| Z-107                                |
| **Extruder Motor Cable**             | 
| Z-101                                |

| Printed Parts                         | Qty |
|:--------------------------------------|:----|
| <a href="https://github.com/AutomatedLayers/VertigoMk1/blob/main/hardware/STL/07%20Hitchcock%20Toolhead/Toolhead/Razor%20Lever%20-%20Bottom.stl" target="_blank">Razor Lever - Bottom</a> | 1 |
| <a href="https://github.com/AutomatedLayers/VertigoMk1/blob/main/hardware/STL/07%20Hitchcock%20Toolhead/Toolhead/Razor%20Lever%20-%20Cap.stl" target="_blank">Razor Lever - Cap</a> | 1 |
| <a href="https://github.com/AutomatedLayers/VertigoMk1/blob/main/hardware/STL/07%20Hitchcock%20Toolhead/Toolhead/Razor%20Lever%20-%20Top.stl" target="_blank">Razor Lever - Top</a> | 1 |
| <a href="https://github.com/AutomatedLayers/VertigoMk1/blob/main/hardware/STL/07%20Hitchcock%20Toolhead/Toolhead/Toolhead%20Board%20Mount.stl" target="_blank">Toolhead Board Mount</a> | 1 |
| <a href="https://github.com/AutomatedLayers/VertigoMk1/blob/main/hardware/STL/07%20Hitchcock%20Toolhead/Toolhead/Toolhead%20Heatbreak%20Riser.stl" target="_blank">Toolhead Heatbreak Riser</a> | 1 |
| <a href="https://github.com/AutomatedLayers/VertigoMk1/blob/main/hardware/STL/07%20Hitchcock%20Toolhead/Toolhead/Toolhead%20Motor%20Arch.stl" target="_blank">Toolhead Motor Arch</a> | 1 |
| <a href="https://github.com/AutomatedLayers/VertigoMk1/blob/main/hardware/STL/07%20Hitchcock%20Toolhead/Toolhead/Toolhead%20Pogo%20Mount.stl" target="_blank">Toolhead Pogo Mount</a> | 1 |

## Animated Assembly

<iframe style='width:100%; height:621px;' src="https://www.youtube.com/embed/pYRgoibySGw?si=36XbUyoBYJCRIt-V" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

## Assembly Notes

 - **0:07** Unfortunately the wires that come with the standard E3D HeaterCore were not long enough to reach the toolhead board in our configuration. You must have the modified 'Vertigo Mk1' heater core, or modifiy the wires of your own to reach the board **at your won risk**.
 - **0:14** A tiny dab of Boron Nitride 'anti-seize' paste on the threads can help prevent the nozzle from unscrewing itself when printing for many continuous hours. This is also why the 'Wall Loop Direction' is set to 'Clockwise' in our [default Slicer settings]({{site.url}}/{{site.baseurl}}/doc_tree/7_slicer/slicer.html).
 - **1:00** **WIP** Torsion spring in animation is opposite-handed from the hardware kit, so it may be easier to install it from the top, but the principal is the same.
 - **1:43** The arrow is indicating that this hole should be visible.
 - **1:49** The lower M2x8 SHCS acts like a pin to push and pull the razor; it does not screw into anything.
 - **3:46** The flat side of the pogo connector should be on the open-ended side of the Pogo Mount, as shown in the video.
 - **4:21** Make sure the zip tie nub is under the Pogo Mount. It could interfere with the cowl if it is on the side.
 - **6:09** If you haven't already, go ahead and [configure the toolhead board]({{site.url}}/{{site.baseurl}}/doc_tree/3_wiring/wiring.html#configuring-the-toolhead-board).
 - **7:26** Continue to [Cowl]({{site.url}}/{{site.baseurl}}\doc_tree\2_assembly\12_toolhead\2_cowl.html)

## Interactive View
<div class="online_3d_viewer"
    model="https://media.githubusercontent.com/media/AutomatedLayers/VertigoMk1/main/docs/assets/3d/toolhead_plate.glb"
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
