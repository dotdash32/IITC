# IITC

Intra- and Inter- Tool Changer for Budget 3D Printers

Designed as a mostly printable add-on to the Ender 3 or other V-slot based machines.

The IITC is designed to be cheap to make, widely capable, and easily modifiable.  As such, this Github includes the STLs to print the device, as well as the Fusion 360 files used to create them.

[![Tech Demo](http://img.youtube.com/vi/5y99OYjvCSE/0.jpg)](http://www.youtube.com/watch?v=5y99OYjvCSE)

## Current Progress

The files are currently in development!  While everything *mostly* works on my machine, there are printability and longevity improvements going on.  See the Projects page for a more up to date version of current progress.

## Features

While none of these ideas are completely novel, the combination of these creates a new and very capable machine.

### Intra- Tool Changes

Intra tool changes are between tools on the same tool group, or head.  This is facilitated by the tilting of the head back and forth, and is similar to [MakerTech 3D's Dual Switching Extruder](https://www.makertech3d.com/products/dual-switching-extruder-non-proforge).  Inside a job, this is the most common type of tool change, and is done with just GCode commands.

It rides on bearings for smooth operation and longevity of printed parts.  It uses a kinematic mount, inspired by the [E3D ToolChanger](https://e3d-online.com/pages/toolchanger), but uses socket head cap screws (SHCS) to reduce cost and mounting space.  With entirely standard components, a highly repeatable attachment platform is made.

### Inter- Tool Changes

Inter tool changes are between different tool groups.  These are manually facilitated, allowing the machine to change between different types of tools.  Switching out symmetric nozzles for a dedicated flexible hot end, or mounting a laser engraver or pen plotter.  This is similar to the [XChange](https://www.kickstarter.com/projects/printermods/xchange-v10-hot-swap-tool-changing-for-every-3d-printer) or [Mutant](https://whambamsystems.com/mutant).  However, this combines with the Intra switches to have a more capable machine.

### Tool Ecosystem

The kinematic mount and angle are the same between 1, 2, and 4 position mounts.  Tool groups can still be used on mounts with fewer or more positions, so tool groups are compatible between machines even if they have different numbers of extruders enabled.  This is intended so that a shop with multiple printers can expand flexible capacity without needing to upgrade every mainboard to dual extrusion.

### Remote Tool Changes

A Bowden style servo actuates the tilting motion through a wire rope and spring guides.  The mass of the servo is moved to the rigid frame, thus reducing the mass of the toolhead.  This is inspired by the [Jubilee](https://jubilee3d.com/index.php?title=Main_Page), and uses similar parts.  

### Automatic Z Probing

The kinematic mount gives the Inter tool changes high repeatability, but when spring loaded, the kinematic mount acts like a [Renishaw CNC probe](https://www.renishaw.com/en/kinematic-mounts--25938).  Thus, the nozzle can be used as a probe like a CR-6 and detect any bed surface.  
