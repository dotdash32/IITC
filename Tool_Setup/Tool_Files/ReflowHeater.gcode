; Reflow PCB Heater
; code to run remotely
; M32 P !/0TOOLS/REFLOW~1.GCO#

M305 P0 R4700 T100000 B4092 C0 ; Extruder 1
M305 P1 R4700 T100000 B4092 C0 ; Extruder 2

M301 E0 P50.0 I2.0 D80.0 ; Extruder 1
M301 E1 P50.0 I2.0 D80.0 ; Extruder 2