This was a quick script I created in 2020 during my time at a 1:1 school and was ran from a flashdrive.\
Over the summer, devices were returned and were required to be prepped for new students.\

I created this script because our department did not want to push a BIOS update via Intune.
This particular model of of laptptop had a critical flaw that caused the motherboard to be bricked resulting in a few hundred devices needing to be sent out for repair.
HP did release a BIOS update that fixed the cause of this issue and was installed on all devices.

Over the summer, when devices were returned and needed to be prepped for new students, I created this script to launch the executable for the latest BIOS update at the time.
Winver was launched to make sure device was checking into Intune and receiving Windows updates.
If the WIndows version of the device was not current, it was set aside for additional work.
Advanced system properties were also launched to remove the former student's profile from the device.

Since, the models specified in the script looked physically identical, script checks to see what model the device is and runs the executable associated with that model.
This script also proved handy for updated other drivers for devices and can list additional models.
