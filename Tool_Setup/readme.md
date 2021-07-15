# Tool Setup

This folder includes files related to Tool setup.

See the [Tool Setup Procedure](/Tool_Setup/Tool_setup_procedure.md) for a walk through of how to setup a tool, which links to the example GCode for a [pen plotter](/Tool_Setup/PlotterHead.gcode).  Additionally, see the [Selected GCode Reference](/Tool_Setup/Selected_Gcode_Reference.md) for commonly used GCodes during individual tool groups.

This folder mainly acts as a space to store all Dotdash's personal tool offsets, and track them.  They are stored in here and also on the printer SD card.  Specifically, the extension [FileSync](https://marketplace.visualstudio.com/items?itemName=CatStarwind.filesync) is used to keep the subfolder `Tool_Files` in sync with the SD card.  This is certainly handy to set up on everyone's personal forks, but might not be overly useful.  It does require creating a new VSCode workspace path to the folder to work.

## Calling Tool Offsets

To use separate GCode files like above, there are some config changes needed in Marlin.  

- Enable `SDSUPPORT`
- Set `SD_PROCEDURE_DEPTH` to 2
- Create file structure on SD Card

The file structure that has worked is below.  While not necessary to have a separate folder, it does keep everything organized, and easier to clean out the SD card if it gets full of prints.

```none
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

`M32` can be used to call a specific program, and using the `P` flag allows the printer to continue to run a job.  So in your start GCode you might put `M32 P !/0TOOLS/FILE.GCO#`, replacing `FILE.GCO` with the output from `M20`.  Since this command uses DOS 8.3 filenames, it can be hard to read, so keeping filenames distinct is important.

### Useful Commands

- `M20` List SD Card contents (`L` includes long filename, which is more human readable)
- `M32` Run file (`P` sets subprogram, so another command can be called afterward)
- `M21` Attach SD Card (needed to see files from printer)
- `M22` Release SD Card (needed to see files from computer as external disk, if enable by boot-loader)

## FileSync

Using the [FileSync](https://marketplace.visualstudio.com/items?itemName=CatStarwind.filesync) extension allows a Github synced set of Tool offset GCode files to be also stored on an SD card.  It is very useful to have some sort of MSC (access SD card like an external storage device from your computer) for this to work efficiently.  Steps to set up:

1. Download and install the extension (from VSCode extension manager)

2. Ensure the `.code-workspace` file includes a path directly to the Tool Offset folder of interest

    - for example:

    ```code-workspace
    {
        "path": "./Tool_Setup/Tool_Files"
    },
    ```

3. Edit the VSCode `settings.json` file to meet the Source/Destination specs of the Extensions

    - for example:

    ```json
    "filesync.mappings": [
        { "source": "/PATH_TO_IITC_REPO/Tool_Setup/Tool_Files", 
            "destination": "/Volumes/SKR_14T/0tools"} 
    ],
    ```

4. Double check everything is working by looking at the FileSync output from the VSCode terminal
