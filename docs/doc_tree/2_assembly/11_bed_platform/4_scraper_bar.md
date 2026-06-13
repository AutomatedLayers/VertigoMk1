---
title: Scraper Bar
layout: assembly
parent: Bed Platform
nav_order: 4
---

# Scraper Bar

![]({{site.url}}/{{site.baseurl}}/assets/images/scraper_bar.webp)


## Materials

| Hardware                                           | Qty |   
|:---------------------------------------------------|:----| 
| Extrusion - 1010-300                               | 1   |
| Makerbeam M3 T-Nut                                 | 14  |
| Magnet - 1/4in Cube                                | 2   |
| Plastic Scraper                                    | 7   |
| Magnet - 6x3mm                                     | 21  |
| M1.5x10 Dowel                                      | 28  |
| Linear Spring                                      | 2   |
| M3x5.7 Brass Insert                                | 10  |
| M3x25 SHCS                                         | 4   |
| M3x20 SHCS                                         | 2   |
| M3x16 SHCS                                         | 8   |
| M3x10 SHCS                                         | 15  |
| M2x8 FHCS                                          | 4   |

| Printed Parts                         | Qty |
|:--------------------------------------|:----|
| <a href="https://github.com/AutomatedLayers/VertigoMk1/blob/main/hardware/STL/06%20Bed%20Platform/Scraper%20Bar/Linear%20Spring%20Bushing%20Inner%20-%20Q2.stl" target="_blank">Linear Spring Bushing Inner</a> | 2 |
| <a href="https://github.com/AutomatedLayers/VertigoMk1/blob/main/hardware/STL/06%20Bed%20Platform/Scraper%20Bar/Linear%20Spring%20Bushing%20Outer%20-%20Q2.stl" target="_blank">Linear Spring Bushing Outer</a> | 2 |
| <a href="https://github.com/AutomatedLayers/VertigoMk1/blob/main/hardware/STL/06%20Bed%20Platform/Scraper%20Bar/Scraper%20Bar%20Height%20Adjustment%20Block%20-%20Accent%20-%20Q2.stl" target="_blank">Scraper Bar Height Adjustment Block</a> | 2 |
| <a href="https://github.com/AutomatedLayers/VertigoMk1/blob/main/hardware/STL/06%20Bed%20Platform/Scraper%20Bar/Scraper%20Bar%20Wing%20A.stl" target="_blank">Scraper Bar Wing A</a> | 1 |
| <a href="https://github.com/AutomatedLayers/VertigoMk1/blob/main/hardware/STL/06%20Bed%20Platform/Scraper%20Bar/Scraper%20Bar%20Wing%20B.stl" target="_blank">Scraper Bar Wing B</a> | 1 |
| <a href="https://github.com/AutomatedLayers/VertigoMk1/blob/main/hardware/STL/06%20Bed%20Platform/Scraper%20Bar/Scraper%20Bar%20Wing%20Dog%20Bone%20-%20Q2.stl" target="_blank">Scraper Bar Wing Dog Bone</a> | 2 |
| <a href="https://github.com/AutomatedLayers/VertigoMk1/blob/main/hardware/STL/06%20Bed%20Platform/Scraper%20Bar/Scraper%20Bar%20Wing%20Frame%20Wedge%20A%20-%20Accent.stl" target="_blank">Scraper Bar Wing Frame Wedge A</a> | 1 |
| <a href="https://github.com/AutomatedLayers/VertigoMk1/blob/main/hardware/STL/06%20Bed%20Platform/Scraper%20Bar/Scraper%20Bar%20Wing%20Frame%20Wedge%20B%20-%20Accent.stl" target="_blank">Scraper Bar Wing Frame Wedge B</a> | 1 |
| <a href="https://github.com/AutomatedLayers/VertigoMk1/blob/main/hardware/STL/06%20Bed%20Platform/Scraper%20Bar/Scraper%20Module%20Bed%20Cam%20-%20Q7.stl" target="_blank">Scraper Module Bed Cam</a> | 7 |
| <a href="https://github.com/AutomatedLayers/VertigoMk1/blob/main/hardware/STL/06%20Bed%20Platform/Scraper%20Bar/Scraper%20Module%20End%20Effector%20-%20Q7.stl" target="_blank">Scraper Module End Effector</a> | 7 |
| <a href="https://github.com/AutomatedLayers/VertigoMk1/blob/main/hardware/STL/06%20Bed%20Platform/Scraper%20Bar/Scraper%20Module%20Frame%20Mount%20-%20Q7.stl" target="_blank">Scraper Module Frame Mount</a> | 7 |

## Animated Assembly

<iframe style='width:100%; height:621px;' src="https://www.youtube.com/embed/beljLD9yPFU?si=ZPCdjsPRfDH1dlFw&amp;start=569" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>

## Assembly Notes

 - **10:09** This insert is to keep the adjutment screw from coming out when using it to raise or lower the Scraper Bar. It will rotate with the screw.
 - **10:33** It's recommended to use some glue on the threads of these M2x8 FHCS.
 - **10:52** The Linear Spring should extend and retract with minimal friction. **Be careful not to pull too much of the spring out; it will coil up on itself and be difficult to untangle or could damage the spring.**
 - **11:04** Refer to the magnetic polarity information below for details. **Note the orientation of the Wedge when the magnet is installed**.
 - **12:47** Only one end of the scraper bar is screwed in. This allows the distance between the carriages on the bed rails to define the distance between the Scraper Bar Wings. Scraper Modules should fit roughly centered between the two Scraper Bar Wings, with minimal gap between them, able to be independently articulated.
 - **13:24** Scraper Modules should not be tight against the bed. All the blades should just touch the print surface. Check for gaps between the blades and the print surface on either side of the Scraper Bar to make it level.
 - **13:40** Use a 1.5mm or 2mm Hex Key. It will be difficult to get the key into the spring clip if the Scraper Bar is too far forward.
 - **13:57** Ideally the Scraper Bar should return on its own, even when the bed is vertical. The magnets will ensure the Scraper Bar returns when vertical and prevent any unsightly stick slip.
 - **14:23** You may apply a bit of threadlocker on the Kinematic Seatbelt screws now. This is more useful on side A, as side B will be locked in place.
 - **14:30** The M3 in the Dowel Cap on side A does **not** need loosening here. Keep it snug.
 - **14:30** Reminder that only side B has Seatbelt Locks

---
#### Magnet Polarity

<img src="{{site.url}}/{{site.baseurl}}/assets/images/force_sensor_magnet_polarity.svg" width="100%" alt="">

---
## Interactive Views

#### Scraper Bar
<div class="online_3d_viewer"
    model="https://media.githubusercontent.com/media/AutomatedLayers/VertigoMk1/main/docs/assets/3d/bed_scraper.glb"
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

#### Scraper Module
<div class="online_3d_viewer"
    model="https://media.githubusercontent.com/media/AutomatedLayers/VertigoMk1/main/docs/assets/3d/bed_scraper_module.glb"
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