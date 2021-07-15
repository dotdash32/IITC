; Dual Extruders - Double Creality MK8 hotends
; code to run remotely
; M32 P !/0TOOLS/HEROME~1.GCO#

; This file should NOT be used, UI/UX problems

M281 P0 L60 U115 ; update extruder angles, just in case lol

;Thermistor Settings
M305 P0 R4700 T100000 B4092 C0 ; Extruder 1
M305 P1 R4700 T100000 B4092 C0 ; Exutruder 2

;PID Settings
M301 E0 P24.67 I2.19 D69.45 ; Extruder 1
M301 E1 P26.54 I2.22 D79.31 ; Extruder 2

; Home offset
M206 X7 Y-14 

; Z offset 
M851 Z0

; Rough T1 offset
M218 T1 X-40 Y-1

; T1 Z offset
M218 T1 Z-0.58

M500 ; save Settings
M117 HeroMeDual Loaded
M150 U255 B255 ; color indicator!
