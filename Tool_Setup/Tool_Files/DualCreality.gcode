;Dual Extruders - double creality MK8 hotends
; code to run remotely
; M32 P !/0TOOLS/DUALCR~1.GCO#

;update Extruder angles
M281 P0 L115 U60  

;Thermistor Settings
M305 P0 R4700 T100000 B4092 C0 ; Extruder 1
M305 P1 R4700 T100000 B4092 C0 ; Exutruder 2

;PID Settings
M301 E0 P24.67 I2.19 D69.45 ; Extruder 1
M301 E1 P26.54 I2.22 D79.31 ; Extruder 2

; Home offsets
M206 X-34 Y-17 ; XY offset
; M851 X-34 Y-12 ; match probe, no longer needed in M2.0.8.1+

; Probe Z offset
M851 Z0.300

; Rough T1 Offset
M218 T1 X38 Y3 ; rough XY
M218 T1 Z0.30 ; Z offset ; +.3->+0.6

; Old offset
; M218 T1 X37.6 Y2.0 ; fine offset for T1

; From recalibration test:
; T1 X is .2 too -
; T1 Y is 1.2 too +

;M218 T1 X37.4 Y3.2 ; fine offset for T1

; From recalibration test:
; T1 X is .2 too -
; T1 Y is 1.2 too +

M218 T1 X37.2 Y2.0 ; fine offset for T1

; From recalibration test:
; T1 X is 1.4 too +
; T1 Y is 0.6 too -

M218 T1 X38.6 Y1.4

M500 ; save settings
M117 Dual CR HEs Loaded
M150 U255 B255 ; color indicator!
G4 P500 ; wait a half second for light