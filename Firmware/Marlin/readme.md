# Marlin Firmware Setup

## Sample Configs

Dotdash32's configs are available on their fork of [MarlinFirmware](https://github.com/dotdash32/Marlin).  Specifically of interest are the (mostly) updated and designed versions to run this tool changer for the [SKR 2](https://github.com/dotdash32/Marlin/tree/Ender3_skr2) and before it broke, [SKR 1.4T](https://github.com/dotdash32/Marlin/tree/Ender3_skr14Turbo).

There are also bug-fix branches, but are not always updated unless Dotdash has a problem and needs to submit a bug report.

## How to Setup your own Config (1 Position)

These are the key elements to enable in order to get the tool changer up and running.  It's not possible to have an example config for every board (and hard to check if they work on a student budget :\\ ).  While every configuration will be different, these will hopefully give a good guide to get started.  It is recommended that you start with a configuration that works for your printer and controller board BEFORE you start changing things.

This section describes changes needed to enable Inter Changes, switching between different tool groups.  For a single position tool changer (Inter only), follow this section (1 Pos). For a Inter and Intra tool changer, also read the following sections (2 Pos).

Marlin currently only supports up to 2 Positions, since the main element (`SWITCHING_NOZZLE`) only supports 2 positions.  If there is need for more tools (i.e. 4 Position tilter), a more expandable system like RRF or Klipper is ideal, since they can handle secondary control boards.

### Configuration.h (1 Pos)

- Enable Adjustable Temp Sensors

  - `#define TEMP_SENSOR_0 1000` This can then be changed with `M305` in each GCode tool offset file
  
- Adjust Min and Max Temps
  - Change `#define HEATER_X_MINTEMP  nnn` and `#define HEATER_X_MAXTEMP nnn` to reflect the extremes of ALL tools.  This does decrease safety, but is one cost of having only some settings at compile.

- Ensure Thermal Protections

  - `#define THERMAL_PROTECTION_HOTENDS`.  This is really important for safety!  Especially with pluggable hot ends, if a cable is loose, this can prevent fires.

- Probe Settings (For Kinematic Mount Probing)

  - Set Pin (`#define Z_MIN_PROBE_USES_Z_MIN_ENDSTOP_PIN` if using Z end stop)

  - `#define FIX_MOUNTED_PROBE` (technically that or `#define NOZZLE_AS_PROBE`, but that has more restrictions)

  - `#define NOZZLE_TO_PROBE_OFFSET { 0, 0, 0}`, this will be changed by each GCode file (especially the Z offset)

  - `#define Z_AFTER_PROBING 5` or some other value.  This is important to ensure that the tool doesn't switch too close to the bed and smash a tool into the bed

  - `#define Z_PROBE_LOW_POINT -2` or similar value to give some negative travel room

  - `#define Z_AFTER_HOMING 5` like `Z_AFTER_PROBING`, keeps nozzle from smashing into the bed

- Homing and Offsets

  - `#define Z_AFTER_HOMING 5` (it's technically in the homing section of config.h)

  - `#define Z_MIN_POS -2` Allow secondary tools to have a negative Z offset

  - `#define MANUAL_Z_HOME_POS 0` Set home position at probe trigger point

  - `#define Z_SAFE_HOMING` Required for homing with a probe

- SD Card 

  - `#define SDSUPPORT` Use an SD card to store tool offset GCode files

### Configuration_adv.h (1 Pos)

- Adjustable Temp Sensors

  - Check Temp Sensor 1000 values, but will be set in GCode files

- SD Card (tool offset folder)

  - `#define SD_PROCEDURE_DEPTH 2`, allow access 1 folder down

  <!-- - `#define SD_MENU_CONFIRM_START` (optional, but incredibly useful, IMO) -->

- Baby Stepping

  - `#define BABYSTEPPING`

  - TODO: `#define BABYSTEP_XY` does this help?

<!-- - Emergency Parser

  - `#define EMERGENCY_PARSER`, Not required, but useful. -->

- Custom Menu

  - Not required, but pretty useful if you need to switch a bunch of hot ends often.

  - Either `#define CUSTOM_MENU_MAIN` or `#define CUSTOM_MENU_CONFIG`

## Intra Tool Changes Config (2 Position)

Further changes needed to enable servo switching of tools (Intra changes).  This does require a controller board capable of driving at least 2 extruder steppers and a servo.

### Configuration.h (2 Pos)

- Enable Switching Nozzle

  - `#define EXTRUDERS 2` Enable dual extrusion

  - `#define SWITCHING_NOZZLE` Specific tool change methodology

  - `#define NUM_SERVOS 1` (or 2 if also using BL Touch)

  - `#define SERVO_DELAY { 150 }` or change to fit your servo's speed

  - `#define EDITABLE_SERVO_ANGLES` This makes it much faster to dial in settings
  
- Enable Adjustable Temp Sensors

  - `#define TEMP_SENSOR_1 1000` Enable second custom thermistor

- Enable Separate PID settings

  - `#define PID_PARAMS_PER_HOTEND` Allow non-symmetric hot end control loops

  - Change `DEFINE_Kn_LIST` to 2 entries for each of the three settings.

- Enable second extruder

  - `#define E1_DRIVER_TYPE` to be whatever is in your controller board.

  - `#define DISTINCT_E_FACTORS` for non-symmetric extruders

  - Update "default values" to include 5 values.  There are several, so be sure to check them all.

    - `DEFAULT_AXIS_STEPS_PER_UNIT`

    - `DEFAULT_MAX_FEEDRATE`

    - `DEFAULT_MAX_ACCELERATION`

### Configuration_adv.h (2 Pos)

- Tool Change Raise

  - `#define TOOLCHANGE_ZRAISE 2` or other setting to clear any parts
