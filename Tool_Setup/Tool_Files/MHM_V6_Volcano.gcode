;Dual Extruders - Multi-Hotend System
; V6 Standard | V6 Volcano
; code to run remotely
; M32 P !/0TOOLS/MHM_V6~1.GCO#

;update Extruder angles
M281 P0 L115 U60  

;Thermistor Settings
M305 P0 R4700 T100000 B4267 C0 ; Extruder 1
M305 P1 R4700 T100000 B4267 C0 ; Exutruder 2

;PID Settings
M301 E0 P24.67 I2.19 D69.45 ; Extruder 1
M301 E1 P26.54 I2.22 D79.31 ; Extruder 2

; BMG extruder settings
M92 T0 E407.6 ; Extruder 1
M92 T1 E407.6 ; Extruder 1

; Filament Load/Unload Settings
M604 T0 L480 U480 ; Extruder 1
M604 T1 L480 U480 ; Extruder 1

; Home offsets
M206 X-34 Y-17 ; XY offset
M851 X0 Y0 ; clear any probe offset

; Probe Z offset
M851 Z0.150 ; 

; Save it all
M500