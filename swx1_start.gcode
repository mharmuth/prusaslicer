M117 Initializing
; Set coordinate modes
G90 ; use absolute coordinates
M83 ; extruder relative mode
; Reset speed and extrusion rates
M200 D0 ; disable volumetric e
M220 S100 ; reset speed
; Set print temps
M117 Heating nozzle & bed
M104 S160 ; set no-ooze nozzle temp while bed heats
M140 S[first_layer_bed_temperature] ; set heatbed temperature
M109 S160 ; wait until nozzle is warm to avoid bed damage
; Home
G1 Z3 F3000 ; move z up little to prevent scratching of surface
M117 Homing
G28 ; home all axes
; Present bed for final cleaning
G1 Z3 F3000 ; move z up little to prevent scratching of surface
G0 X155 Y310 F7200 ; Present bed for cleaning
; Wait for final bed heating
M190 S[first_layer_bed_temperature] ; wait for the bed to heat up
; Return to prime position and wait for nozzle to heat up
G1 Z3 F3000 ; move z up little to prevent scratching of surface
G1 X0 Y-2 F7200.0 ; go outside print area
M104 S[first_layer_temperature] ; set final nozzle print temp 
M109 S[first_layer_temperature] ; wait for the nozzle to heat up
; Prime line routine
M117 Printing prime line
M900 K0; Disable Linear Advance for prime line
G92 E0.0 ; reset extrusion distance
G1 Z0.2 F3000 ; lower nozzle to printing height
G1 E5 F1000 ; de-retract and push filament to trap ooze
G1 X0 Y-3 F7200 ; move to prime line position
G1 X20.0 E10 F7200.0 ; fat 20mm intro line @ 0.5
G1 X60.0 E3.2  F3600.0 ; thin +40mm intro line @ 0.08
G1 X100.0 E6  F3600.0 ; fat +40mm intro line @ 0.15
G1 E-0.8 F3000; retract to avoid stringing
G1 X99.5 E0 F3600.0 ; -0.5mm wipe action to avoid string
G1 X110.0 E0 F3600.0 ; +10mm intro line @ 0.00
G1 E0.8 F1500; de-retract
G92 E0.0 ; reset extrusion distance
; Final print adjustments
M117 Preparing to print
M92 E440.55 ; set e-steps
M420 S1 ; reload fade mesh bed leveling
M117 Print in progress
