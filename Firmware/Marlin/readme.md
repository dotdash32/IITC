# Marlin Firmware Setup

## Sample Configs

Dotdash32's configs are available on their fork of [MarlinFirmware](https://github.com/dotdash32/Marlin).  Specifically of interest are the (mostly) updated and designed versions to run this tool changer for the [SKR 2](https://github.com/dotdash32/Marlin/tree/Ender3_skr2) and before it broke, [SKR 1.4T](https://github.com/dotdash32/Marlin/tree/Ender3_skr14Turbo).

There are also bug-fix branches, but are not always updated unless Dotdash has a problem and needs to submit a bug report.

## How to Setup your own Config (2 Position)

These are the key elements to enable in order to get the tool changer up and running.  It's not possible to have an example config for every board (and hard to check if they work on a student budget :\\ ).  While every configuration will be different, these will hopefully give a good guide to get started.  It is recommended that you start with a configuration that works for your printer and controller board BEFORE you start changing things.

Marlin currently only supports up to 2 Positions, since the main element (`SWITCHING_NOZZLE`) only supports 2 positions.

TODO: Each section will have a note in parenthesis about when it is needed. (??)

### Config.h

- Enable Switching Nozzle (2 Pos)

  - `#define EXTRUDERS 2`

  - `#define SWITCHING_NOZZLE`

  - `#define NUM_SERVOS 1` (or 2 if also using BL Touch)

  - `#define SERVO_DELAY { 150 }` or change to fit your servo's speed

  - `#define EDITABLE_SERVO_ANGLES`

- Enable Adjustable Temp Sensors (1, 2 Pos)

  - `#define TEMP_SENSOR_X 1000`

  - `#define TEMP_SENSOR_1 1000`
  
- Adjust Min and Max Temps
  - Change `#define HEATER_X_MINTEMP  nnn` and `#define HEATER_X_MAXTEMP nnn` to reflect the extremes of ALL tools.  This does decrease safety, but is one cost of having only some settings at compile.

- Enable Separate PID settings

  - `#define PID_PARAMS_PER_HOTEND`

  - Change `DEFINE_Kn_LIST` to 2 entries for each of the three settings.

- Ensure Thermal Protections

  - `#define THERMAL_PROTECTION_HOTENDS`.  This is really important for safety!  Especially with pluggable hot ends, if a cable is loose, this can prevent fires.

- Enable second extruder

  - `#define E1_DRIVER_TYPE` to be whatever is in your controller board.

  - `#define DISTINCT_E_FACTORS` for non-symmetric extruders

  - Update "default values" to include 5 values.  There are several, so be sure to check them all.

    - `DEFAULT_AXIS_STEPS_PER_UNIT`

    - `DEFAULT_MAX_FEEDRATE`

    - `DEFAULT_MAX_ACCELERATION`

- Probe Settings (For Kinematic Mount Probing)

  - Set Pin (`#define Z_MIN_PROBE_USES_Z_MIN_ENDSTOP_PIN` if using Z end stop)

  - `#define FIX_MOUNTED_PROBE` (technically that or `#define NOZZLE_AS_PROBE`, but that has more restrictions)

  - `#define NOZZLE_TO_PROBE_OFFSET { 0, 0, 0}`, this will be changed by each GCode file (especially the Z offset)

  - `#define Z_AFTER_PROBING 5` or some other value.  This is important to ensure that the tool doesn't switch too close to the bed and smash a tool into the bed

  - `#define Z_PROBE_LOW_POINT -2` or similar value to give some space for multi probes

  - `#define Z_AFTER_HOMING 5` like `Z_AFTER_PROBING`, keeps nozzle from smashing into the bed

- Homing and Offsets

  - `#define Z_AFTER_HOMING 5` (it's technically in the homing section of config.h)

  - `#define Z_MIN_POS -2` Allow secondary tools to have a negative Z offset

  - `#define MANUAL_Z_HOME_POS 0` Set home position at probe trigger point

  - `#define Z_SAFE_HOMING`

- SD Card (tool offset folder)

  - `#define SDSUPPORT`

### Configuration_adv.h

- Adjustable Temp Sensors 

  - Check Temp Sensor 1000, but will be set in GCode files

- SD Card (tool offset folder)

  - `#define SD_PROCEDURE_DEPTH 2`, allow access 1 folder down

  - `#define SD_MENU_CONFIRM_START` (optional, but incredibly useful, IMO)

- Baby Stepping

  - `#define BABYSTEPPING`

  - do we `#define BABYSTEP_XY`? TODO

- Emergency Parser

  - `#define EMERGENCY_PARSER`, Not required, but useful.

- Tool Change Raise

  - `#define TOOLCHANGE_ZRAISE 2` or other setting to clear any parts

- Custom Menu

  - Not required, but pretty useful if you need to switch a bunch of hot ends often.
