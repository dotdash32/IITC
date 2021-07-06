# Main Tilters

The main bulk of the project is here, these are what do the dirty work.
There are 3 possible combinations, and each need slightly different materials.

## Common Parts

This topmost section is common to all tilters, so any set of tools can be attached to any tilter.
This is the Kinematic Mount, the set of six screw heads (SHCS) that create a unique resting position for the tool groups mating screws.

### Common Needed Materials

* 1x `Nut_Trap`
* 6x 8mm M3 SHCS
* 6x Thin M3 Nuts

## 1 Position Tilter

This tilter doesn't move, but gives any printer Inter-changes and automatic probing for just a few parts.
Two options, depending on which side of the tool should be used.
This enables a simpler machine to still run complex tool groups, just one tool at a time.

<!-- ![1 Pos Right](/images/1_Pos_Right.png){:width="10px"} ![1 Pos Left](/images/1_Pos_Left.png) -->

![<img src="/images/1_Pos_Right.png" width="150"/>](/images/1_Pos_Right.png)
![<img src="images/1_Pos_Left.png" width="300"/>](/images/1_Pos_Left.png)

### 1 Pos Needed Materials

* 1x `1_Pos_Main_XXX`
  * `_Right` is the near-stock hot end configuration for the Ender 3
  * `_Left` is the `T0` position for the 2 position holder.

Update: now easier to print!  Sections extend from the side plates downward, removing the need for supports.

## 2 Position Tilter

This is the mainstay of the project, 2 tools per tool group for intra-switches.

![2 Pos Tilter](/images/2_Pos_Tilter.png)

### 2 Pos Needed Materials

* 1x `2_Pos_Main`
* 1x `Stationary_Mount`
* 1x `Bearing_Internal_Spacer`
* 1x 20mm M5 SHCS
* 2x 105zz Bearings
* 1x Nylock M5 Nut
* 1x 5mm M3 SHCS

## 4 Position Tilter

This is not finished!
But in order to keep this option open, it needs to be at least partially designed for from the start.
It does not currently have provisions for a tilting cable, but that will hopefully change soon.

This enables front and back tilting as well, so 2 Position Tool Groups will work natively as well.
The issue is that it extends back and would collide with the vertical 2040 beams on the Ender 3.

![4 Pos Tilter](/images/4_Pos_Tilter.png)

### 4 Pos Needed materials

* 1x `4_Pos_Lower`
* 1x `4_Pos_Upper`
* 1x `Stationary_Mount`
* 2x `Bearing_Internal_Spacer`
* 2x 20mm M5 SHCS
* 4x 105zz Bearings
* 2x Nylock M5 Nut
* 1x 5mm M3 SHCS (subject to change)
