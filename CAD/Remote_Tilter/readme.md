# Remote Tilter

STLs for Remote tilter, uses a servo to actuate the tool change.
Mounts to Nema-17 standard pattern (i.e. to default E3 extruder position)

## 35kg Servo

The current model uses a 35kg-cm servo, which is definitely over powered for the application.  
This is to avoid overheating and failure that was observed in [TeachingTech's Switching Nozzle Video](https://www.youtube.com/watch?v=ag7b9jOhlPY).

![Remote Tilter](/images/Remote_Tilter.png)

Future upgrades include testing to switch to a 20kg-cm servo which is half the price, or using a stalled DC motor with current limiting.
Other heat mitigation strategies include a 30mm fan, which has an included duct to redirect the air closely around the servo, or spare stepper motor heat sinks on the metal casing.

### Needed Materials

<!-- TODO: update this in main assembly file. -->

* 1x `Servo_mount`
* 1x `Horn_Top_Attachment`
* Nut mount system
  * 1x `Fanless_Nut_Keeper`

  OR
  * 1x `30mm_Fan_Mount`
  * 1x3010 Fan
* 1x 12mm M3 SHCS
* 5x 8mm M3 SHCS
* 4x Thin M3 Nuts
* 4x 16mm M4 SHCS
* 4x Std M4 Nuts
* 1x Standard Size RC Servo (tested with Annimos 35kg)
* 1x JST to Servo connection Cable
* 2x Spring Guides (from main assembly)

## Direct without Horn

An old version of the servo mount.
It mounts directly to the 25 tooth servo gear, hence the "Direct" name.
Needs either high precision, or to melt the teeth profile in.
This model is harder to work with, so is not fully supported, and is included for the sake of completeness, not convenience.

To melt, something like acrylic cement (for PLA, not recommended plastic) can be used.
Apply the cement liberally to the point of indentation, and then press onto the servo gear.
Let it set until dry, and you have a nice set of embedded teeth!
