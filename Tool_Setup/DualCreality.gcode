;Dual Extruders - double creality MK8 hotends
; code to run remotely
; M32 P !/0TOOLS/DUALCR~1.GCO#

M206 X-34 Y-12 ; XY offset
; M851 X-34 Y-12 ; match probe, no longer needed in M2.0.8.1+
M218 T0 X0 Y0 Z0 ; reset T0 offset

M851 Z1.35; probe depth - high force

M218 T1 X38 Y3 ; rough XY offset for T1
M218 T1 Z0.1; Z offset

; From calibration test:
; T1 X is .4 too +
; T1 Y is .4 too -
; M218 T1 X38.2 Y2.6 ; fine offset for T1

; From recalibration test:
; T1 X is .6 too -
; T1 Y is .2 too +

;M218 T1 X37.6 Y2.0 ; fine offset for T1

; From recalibration test:
; T1 X is .2 too -
; T1 Y is 1.2 too +

;M218 T1 X37.4 Y3.2 ; fine offset for T1

; From recalibration test:
; T1 X is .2 too -
; T1 Y is 1.2 too +

M218 T1 X37.2 Y2.0 ; fine offset for T1

M281 P0 L145 U40 ; update extruder angles, just in case lol

;Thermistor Settings
M305 P0 R4700 T100000 B3950 C0 ; Extruder 1
M305 P1 R4700 T100000 B3950 C0 ; Exutruder 2

;PID Settings
M301 E0 P24.67 I2.19 D69.45 ; Extruder 1
M301 E1 P26.54 I2.22 D79.31 ; Extruder 2

M117 Dual CR HEs Loaded
M150 U255 B255 ; color indicator!
G4 P500 ; wait a half second for light