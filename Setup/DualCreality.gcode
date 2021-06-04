;Dual Extruders - double creality MK8 hotends
; code to run remotely
; M32 P !/0TOOLS/DUALCR~1.GCO#

M206 X-34 Y-12 ; XY offset
; M851 X-34 Y-12 ; match probe, no longer needed in M2.0.8.1+
M218 T0 X0 Y0 Z0 ; reset T0 offset

M851 Z1.5; probe depth - high force

M218 T1 X38 Y3 ; rough XY offset for T1
M218 T1 Z-0.2; Z offset

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

M218 T1 X37.4 Y3.2 ; fine offset for T1

M281 P0 L145 U40 ; update extruder angles, just in case lol


M117 Dual CR HEs Loaded
M150 U255 B255 ; color indicator!
G4 P500 ; wait a half second for light