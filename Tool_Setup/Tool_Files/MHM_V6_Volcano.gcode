;Dual Extruders - Multi-Hotend System
; V6 Standard | V6 Volcano
; code to run remotely
; M32 P !/0TOOLS/MHM_V6~1.GCO#

;update Extruder angles
M281 P0 L120 U60  

;Thermistor Settings
M305 P0 R4700 T100000 B4267 C0 ; Extruder 1
M305 P1 R4700 T100000 B4267 C0 ; Exutruder 2

;PID Settings
M301 E0 P30.0 I2.0 D50.0 ; Extruder 1
; M301 E0 P30.0 I15.0 D200.0 ; Extruder 1
M301 E1 P26.54 I2.0 D79.31 ; Extruder 2

; BMG extruder settings
M92 T0 E407.6 ; Extruder 1
M92 T1 E407.6 ; Extruder 2

; Filament Load/Unload Settings
M604 T0 L480 U480 ; Extruder 1
M604 T1 L480 U480 ; Extruder 2

; Home offsets
M206 X-27.5 Y-7 ; XY offset
M851 X0 Y0 ; clear any probe offset

; Probe Z offset
M851 Z0.30 ; .15 gave .23 thick first layer

; Rough XY offset
M218 T1 X32 Y1

; Tool Z offset
M218 T1 Z0.28
; t0 - 0.625 probe offset
; t1 - 1.30 probe offset (too high) -> 1.2 ideal 

; Fine XY offset
; was X32 Y1
; X - T1 1.0 <
; Y - T1 0.4 V

; Fine XY offset
; was X32.2 Y0.4
; X - T1 1.0 <
; Y - T1 0.2 ^

; Fine XY offset
; was X33.2 Y0.2
; X - T1 1.8 <
; Y - T1 0.4 ^

; Fine XY offset
; was X32.0 Y0.6
; X - T1 0.6 <
; Y - T1 0.0 X
M218 T1 X31.4 Y0.6



; Save it all
M500

M117 MHM v6 Volcano Loaded
M150 U255 B255 ; color indicator!
G4 P500 ; wait a half second for light