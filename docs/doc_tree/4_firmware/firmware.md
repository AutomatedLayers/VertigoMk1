---
title: Firmware
layout: default
nav_order: 4
---

# Firmware
The first Vertigo machines have been running Kalico which is a forked version of Klipper Firmware. That is the installation presented in this guide. You can read more about the project and its efforts to improve upon Klipper in the [Kalico Documentation](https://docs.kalico.gg/Features.html). As of April 2026, Vertigo can still run on Klipper and the [Klipper Documentation](https://www.klipper3d.org/) is a good place to start if you prefer that firmware.

{: .note}
[BigTreeTech Manta M8P Documentation](https://github.com/bigtreetech/Manta-M8P/blob/master/V2.0/BIGTREETECH%20MANTA%20M8P%20V2.0%20User%20Manual.pdf) contains information related to the printer controller (mainboard)

### 1. Install Mainsail OS
 - Ensure sure the Raspberry Pi CM4 module is properly installed into the Manta M8P Mainboard
 - Insert one of the **SD Cards** into your computer
 - Download, install, and run the [Raspberry Pi Imager](https://www.raspberrypi.com/software/)
 - In the **Device** tab, select **Raspberry Pi 4**, and click **NEXT**

![]({{site.url}}/{{site.baseurl}}/assets/images/os_install_1.png)

- In the **OS** tab, scroll down and select **Raspberry Pi OS (Other)**, 

![]({{site.url}}/{{site.baseurl}}/assets/images/os_install_2.png)

- Select **Raspberry Pi OS Lite (64-bit)** click **NEXT**

![]({{site.url}}/{{site.baseurl}}/assets/images/os_install_3.png)

- In the **Storage** tab, select the SD Card you inserted and click **NEXT**

![]({{site.url}}/{{site.baseurl}}/assets/images/os_install_4.png)

- We left Pi Connect off, but you do you and click **NEXT**

![]({{site.url}}/{{site.baseurl}}/assets/images/os_install_5.png)

- Enter **"vertigo-host"** or whatever emerges from your mind's eye and click **NEXT**

![]({{site.url}}/{{site.baseurl}}/assets/images/os_install_6.png)

- Specify your locale and click **NEXT**

![]({{site.url}}/{{site.baseurl}}/assets/images/os_install_7.png)

- Set the username and password you'll use for SSH login and click **NEXT**

![]({{site.url}}/{{site.baseurl}}/assets/images/os_install_8.png)

- Enter your Wi-Fi info and click **NEXT**

![]({{site.url}}/{{site.baseurl}}/assets/images/os_install_9.png)

- Enable SSH and click **NEXT**

![]({{site.url}}/{{site.baseurl}}/assets/images/os_install_10.png)

- Double check the device and operating system and click **WRITE**

![]({{site.url}}/{{site.baseurl}}/assets/images/os_install_11.png)

- Grab a coffee, meditate, contemplate the vastness of the universe

![]({{site.url}}/{{site.baseurl}}/assets/images/os_install_12.png)

- Click **FINISH** and eject your SD Card

![]({{site.url}}/{{site.baseurl}}/assets/images/os_install_13.png)

- Insert the SD card with the Pi OS image into the compute module slot as shown

![]({{site.url}}/{{site.baseurl}}/assets/images/sd_cards.png)

{: .note}
Keep the electronics panel off for now; you will need to access the mainboard to flash the firmware.

### 2. Setup the SBC with Klipper, Mainsail, and other software
- Turn on the machine, take a few deep breaths, and recite some positive affirmations
- Open a terminal on your computer and SSH into the printer host

```
ssh vertigo@vertigo-host
```  

{: .note}
If the hostname is not found, check the username and hostname from the previous section. You may need to troubleshoot the network connection by logging into your router. Also, make sure you're using the latest Raspberry Pi Imager. Older versions would default to a different hosstname.

- Download the setup script, make it executable, and run it. You will be prompted for the password created in the previous section
  
```
curl -L -o "vertigo_setup.sh" "https://raw.githubusercontent.com/AutomatedLayers/VertigoMk1/refs/heads/main/software/vertigo_setup.sh"
chmod +x vertigo_setup.sh
sudo ./vertigo_setup.sh
```

