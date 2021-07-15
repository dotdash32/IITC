# Selected GCode Reference

A few GCodes that are relevant for setting up different hot ends and extruders.  You should always check your Firmware reference ([Marlin](https://marlinfw.org/meta/gcode/), [RRF](https://duet3d.dozuki.com/Wiki/Gcode), [Klipper](https://www.klipper3d.org/G-Codes.html)), but this guide is mainly written for Marlin users.  Tools can be referenced by running subprograms (detailed in the parent [readme](/Tool_Setup/readme.md)), overwriting the base configuration.  Since RRF and Klipper support modular config files, it might make more sense to just edit the config file and restart the printer.

These are just a few settings, and this is not a comprehensive guide.  It can serve as a checklist of things to ensure you have all the necessary parameters changed for a new tool, but you should always consult the documentation to understand the command.  This is just a starting point!

## Tool Change

- `M280` Set servo angle, needs `Pn` index and `Snnn` angle
- `M281` Set servo up/down angle, needs `Pn` index and `Unnn`/`Lnnn` upper/lower limits
- `Tn` Change Tools, `n` = [0,6]

## Tool Offsets

- `M206` Home offset, set `T0`'s `G28` position relative to actual edge of bed
- `M218` Tool offset, set `Tn` position relative to `T0`
- `M851` Probe offset, set `T0` Z offset
- `M114` Report Position

## Extruder Options

- `M92` Set steps per unit (`Tn Exxx`)
- `M201` Set max acceleration (`Tn Exxx`)
- `M203` Set max feed rate (`Tn Exxx`)
- `M301` Set hot end PID (`En Pnnn Innn Dnnn` {`Tn` => `En`})
- `M305` Set Custom Thermistor Parameters (`Pn Bnnn Rnnn Tnnn` {`Tn` => `Pn`})

## Communication

- `M117` Display a message on LCD
- `M150` Set LED color (requires LED strip/Andon)

## EEPROM

- `M500` Save Settings (save to EEPROM)
- `M501` Restore Settings (load from EEPROM)
- `M502` "Factory" Reset (load from firmware)
- `M503` Report settings (echo all settings)
