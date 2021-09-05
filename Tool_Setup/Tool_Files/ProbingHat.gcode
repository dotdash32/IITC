; Probing Hat
; A dedicated Probing hat, with kinematic mount pasive probe in T0 and microswitch in T1.
; Code to run remotely
; M32 P !/0TOOLS/PROBIN~1.GCO#


; ; Home Offset
; M206 X-31 Y-5
; ;Z offset
; M851 Z0.25
; ; T1 X/Y Offset
; M218 T1 X27 Y-5
; ; T1 Z offset (measured with G30)
; M218 T1 Z-2.69

; Try again, but switch the servo angles
M281 P0 U115 L60  

;Home Offset
M206 X-6 Y-11

; Z offest: there isn't one for the microswitch
M851 Z0

; T1 X/Y offset
