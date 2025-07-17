# Summer Break Student Laptop Prep
## Backstory 
This was a quick script I created in 2020 during my time at a 1:1 school to prep devices for the upcoming school year. This script itself was executed from a flash drive.

I created this script because our department did not want to push a BIOS update via Microsoft Intune.

The model of laptop used at the school had a critical flaw that caused the motherboard to be bricked resulting in a few hundred devices needing to be sent out for repair. Fortunately, the devices were covered under warranty.

HP eventually released a BIOS update that fixed the cause of this issue and was installed on all devices.

The school district purchased a newer version of the laptop model in use making updates a bit more challenging since the devices appeared physically identical. Since the models specified in the script looked physically identical, the script checks to see what model the device is and runs the executable associated with that model.

*Although there are faster and more efficient ways to accomplish the tasks bellow, this script was a nice work around limitations to make my job easier at the time.*

## Tasks Executed
### Updating the BIOS
Over the summer, when devices were returned and needed to be prepped for new students, I created this script to launch the executable for the latest BIOS update at the time.

### Checking Windows Version
Winver was launched to make sure the device was checking into Intune and receiving Windows updates. If a device was behind several Windows versions, it was generally quicker to reimage the device.

### Deleting User Profiles
Advanced system properties were also launched to remove the former student's profile from the device.

### Updating Drivers
The script file also checks the devices specific model name and runs additional drivers for that specific device model.