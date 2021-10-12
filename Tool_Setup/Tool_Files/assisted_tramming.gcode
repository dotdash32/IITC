; Like G35 but with more feedback

G28 Z ; home z at least

G0 X30 Y30 F6000; front left
G30
G0 Z5

G0 X190 Y30 F6000 ; Front right
G30
G0 Z5

G0 X190 Y190 F6000 ; Back right
G30
G0 Z5

G0 X30 Y190 F6000 ; Back left
G30 
G0 Z5

G0 X117 Y117 ; return to center