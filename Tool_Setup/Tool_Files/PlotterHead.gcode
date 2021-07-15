; Demo File to follow along with Tool Setup Proceedure

; Find X/Y of First Tool
M206 X-35 Y-12; ; xy offset
; M851 X-35 Y-12 ; set probe xy to match home position, no longer needed in 2.0.8.1+

; Find Z offset of First Tool
M851 Z0.5 ; set probe z offset

; Find Rough X/Y Offset of Subsequent Tools
M218 T1 X34 Y3 ; rough T1 offset

; Find Z offsets of Subsequent Tools
M218 T1 Z-1.6 ; T1 z offset

M218 T1 X31 Y4 Z-1.6 ; T1 offset finalized