# Tool Setup

This folder includes files related to Tool setup.

See the [Tool Setup Proceedure](/Tool_setup/Tool_setup_proceedure.md) for a walk through of how to setup a tool, which links to the example Gcode for a [pen plotter](/Tool_setup/PlotterHead.gcode).

This folder mainly acts as a space to store all Dotdash's personal tool offsets, and track them.  They are stored in here and also on the printer SD card.

Eventually, this folder should also include links to video walkthroughs of how to assemble different tools.  

## Calling Tool Offsets

To use separate Gcode files like above, there are some config changes needed in Marlin.  

- Enable `SDSUPPORT`
- Set `SD_PROCEDURE_DEPTH` to 2
- Create file structure on SD Card

The file structure that has worked is below.  While not necessary to have a separate folder, it does keep everything organized, and easier to clean out the SD card if it gets full of prints.

```
SD Card
.
+-- 0TOOLS
|   +-- DualCreality.gcode
|   +-- PlotterHead.gcode
|   +-- OtherTools1.gcode
|   +-- OtherTools2.gcode
|   +-- ...
|   +-- OtherToolsN.gcode
+-- PrintJob1.gcode
+-- PrintJob2.gcode
+-- ...
+-- PrintJobN.gcode
```

`M32` can be used to call a specific program, and using the `P` flag allows the printer to continue to run a job.  So in your start Gcode you might put `M32 P !/0TOOLS/FILE.GCO#`, replacing `FILE.GCO` with the output from `M20`.  Since this command uses DOS 8.3 filenames, it can be hard to read, so keeping filenames distinct is important.

### Useful Commands
- `M20` List SD Card contents (`L` includes longfilename, which is more human readable)
- `M32` Run file (`P` sets subprogram, so another command can be called afterward)
- `M21` Attach SD Card (needed to see files from printer)
- `M22` Release SD Card (needed to see files from computer as external disk, if enable by bootloader)