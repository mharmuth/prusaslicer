M300 S60 P10 ; chirp
M117 Printing complete
G4 ; wait
G92 E0 ; prepare to retract
G1 E-2.0 F3000; retract to avoid stringing
; Anti-stringing end wiggle
G91 ; use relative coordinates
G1 X-0.5 Y-0.5 F1200
G1 X1 Y1 F1200
; Raise nozzle and present bed
{if layer_z < max_print_height}G1 Z{z_offset+min(layer_z+10, max_print_height)}{endif} ; Move print head up
G90 ; use absolute coordinates
; Reset print setting overrides
M200 D0 ; disable volumetric e
M220 S100 ; reset speed factor to 100%
M221 S100 ; reset extrusion rate to 100%
M900 K0 ; reset linear acceleration
; Present bed for final cleaning
G0 X155 Y310 F12000 ; Present print
; Shut down printer
M106 S0 ; turn-off fan
M104 S0 ; turn-off hotend
M140 S0 ; turn-off bed
M150 P0 ; turn off led
M85 S0; deactivate idle timeout
M84 ; disable stepper
