---
title: Firmware
layout: default
nav_order: 4
---

# Firmware
The first Vertigo machines have been running Kalico which is a forked version of Klipper Firmware. That is the installation presented in this guide. You can read more about the project and its efforts to improve upon Klipper in the [Kalico Documentation](https://docs.kalico.gg/Features.html). As of April 2026, Vertigo can still run on Klipper and the [Klipper Documentation](https://www.klipper3d.org/) is a good place to start if you prefer that firmware.

{: .note}
[BigTreeTech Manta M8P Documentation](https://github.com/bigtreetech/Manta-M8P/blob/master/V2.0/BIGTREETECH%20MANTA%20M8P%20V2.0%20User%20Manual.pdf) contains information related to the printer controller (mainboard)

### 1. Install Kalico OS
 - Ensure sure the Raspberry Pi CM4 module is properly installed into the Manta M8P Mainboard
 - Insert one of the **SD Cards** into your computer
 - Download, install, and run the [Raspberry Pi Imager](https://www.raspberrypi.com/software/)
 - In the **Device** tab, select **Raspberry Pi 4**, and click **NEXT**

![]({{site.url}}/{{site.baseurl}}/assets/images/os_install_1.png)

- In the **OS** tab, scroll down and select **Other specific-purpose OS**

![]({{site.url}}/{{site.baseurl}}/assets/images/os_install_2.png)

- Select **3D Printing**

![]({{site.url}}/{{site.baseurl}}/assets/images/os_install_3.png)

- Select **Mainsail OS**

![]({{site.url}}/{{site.baseurl}}/assets/images/os_install_4.png)

- Select The latest Mainsail image and click **NEXT**

![]({{site.url}}/{{site.baseurl}}/assets/images/os_install_5.png)

- In the **Storage** tab, select **SDHC Card** and click **NEXT**

![]({{site.url}}/{{site.baseurl}}/assets/images/os_install_6.png)