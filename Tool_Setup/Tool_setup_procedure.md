# Tool setup Procedure

Caveats:

`T0`, the original tool, often called Extruder 1 in firmware, is active when homing.  This means that it's "deployed" position cannot interfere with X/Y end stops.

For this reason, the standard position is `T0` as X_MIN and Y_MIN tool. This moves the tool out of the way of X_MIN (on an i3 bed slinger) during homing, but this might change depending on your machine.  Change your servo positions to correct this and chooser a `T0` that does not interfere with end stops triggering.  The Slim_X_Stop also helps with this problem (on an Ender 3).

`T1`, `T2`, and `Tn` are subsequent tools, up until `n=6`, the maximum number supported in Marlin.  The IITC supports 1, 2, or 4 (coming soon) tools, but the `Tn` nomenclature is used to generalize the procedure.

## Useful Commands

- `M206` Home offset

- `M218` Tool offset

- `M851` Probe Offset

## Find X/Y of First Tool

1. Home Machine (at least XY)

2. Jog T0 to ideal X0 Y0 Position

    - This is likely the lower right corner of the bed

3. Set this position as `M206` Home offset

   - Usually need to invert the signs

   - If tool cannot reach X0 Y0, use an offset guide to find the “theoretical limits”.  Soft end stops should still respect the physical limits of your machine.

   - Set this same Position as XY Probe offset in `M851` if using Marlin 2.0.8.0 or lower

4. Ensure the machine now homes Z in proper location

   - If `Z_SAFE_HOMING` is enabled, should be in true center of bed

5. Check that the Soft Limits are correct with `M211`

   - Also good to jog to limits and make sure you cannot over travel!

## Find Z offset of First Tool

1. Reset Probe Z height with `M851 Z0`

2. Get a thin sheet place it under the homing probe position

   - Paper or shim stock is ideal for this.  You should measure the paper before hand, but most paper is around 0.004" or .1mm thick.

3. Home machine in Z (`G28 Z`)

4. Step up the Z until the paper just clears

   - See the exact Z position with `M114`.

5. Record this value in `M851 Z`

   - E.g. if you measure Z0.6 when the nozzle clears, record `M851 Z0.6`.

## Find Rough X/Y offset of Subsequent Tools

For the purposes of `Z_SAFE_HOMING` and probe sensitivity, I find it useful to roughly center the tool on the bed before probing.  This is primarily an artifact of my Ender 3 bed being unstable at the corners though.

1. Move to a clean section of the bed that is sufficiently rigid

   - Single rail V slot beds can be wobbly at the edges, better to move towards the center.

   - Using a round position (ie `X100 Y100`) will make this easier later

2. Create a mark with `T0`

   - for pen tools, a little dot is easy

   - For hot ends, paper and a little indent also works well

   - Soft powder or clay is useful, get any sort of indent.  You can also reform it to restart the process

3. Switch to Tool x (ie `T1` or `Tn`)

   - Be sure there is enough Z clearance before you change tools!  Consider bringing `T0` up ~5mm.

4. Jog to the approximate location

5. Record the difference in initial position and final position in `M218 Tn X Y`

   - `M114` recalls position

   - Use (Original Position) - (New Position)  to get the offset

   - To avoid moving away from the initial mark, switch back to `T0`, then apply the offset.  Be aware of Z clearance!

6. Check the ballpark estimate by switching back and forth

   - It's often useful to Home (`G28`), as the offset is applied to the current position, causing the `T0` offset to be pushed away from the initial mark.

   - This can be mitigated with by switching to `T0` then applying the offset, but it's easier to just re-home between switches

7. Repeat until you are satisfied with the rough offset.  This is rough, it just needs to be close, we'll fine tune it later.

## Find Z offsets of Subsequent Tools

<!-- Weird edge case: in vanilla (first pass) Marlin, the probing tool needs to be the lowest one.  This seems whack, so what if we use CNC coordinate systems to work around this and use a different offset?  (this has since been solved)-->

<!-- CAVEAT: `T1` must be LOWER than `T0` for this to work.  The first Tool must be the highest tool.  A workaround might be possible, or just design your tools better. -->

For maximum Z height flexibility, you want to define the `Z_MIN_POS -2` and `MANUAL_Z_HOME_POS 0`.  This lets any tool travel below the probe trigger point, within reason.  Since the IITC is designed to have one of the tools itself probe, so long as there is no significant mismatch in tool lengths, this should work.  Otherwise, increase the tolerance on `Z_MIN_POS`.

1. Home Z of first tool

2. Reset any offset with `M218 T1 Z0`

3. Move `T0` up until there will be sufficient clearance for tool change

4. Move the new tool down until it is zeroed

   - Use a piece of paper or shim stock for this, like in First Tool Z offsetting

5. Take the negative of this to use for `M218 Tn Z`

   - Easiest way to check the offset is to remember the number, switch back to `T0`, then apply new offset.  When switching back to `T1`, the offset will be applied and `T0` shouldn't slam into the bed.

6. Verify this offset with a test print.  

   - One strategy is to print 2 rectangles as a pseudo skirt with sufficient space between them.  It should print one, and then the other, allowing baby stepping while printing to dial in the height offsets of both tools.

     - 0 top/bottom layers
     - 0% infill
     - 10 perimeters
     - 1 layer thick
     - 10mm spacing between squares

The Z offset is probably more important than the X/Y offset for successful printing!  This needs to be dialed in well, or layers will not stack on top of each other well.  This can lead to de-lamination of support structures or overall bad part quality.  Take your time, and make sure the tools provide even layers.

## Fine Tune X/Y offset of Subsequent Tools

Cura's [Calibration Shapes](https://marketplace.ultimaker.com/app/cura/plugins/5axes/CalibrationShapes) plugin has a dual extruder calibration print, which is quite handy.  Be sure to disable Brim when printing.

### Pen tools

 draw some lines, fine tune the X/Y offsets

 Draw a line in X with both tools, then measure the offset between them.  Repeat and fine tune the offset.  Do the same in Y.  
