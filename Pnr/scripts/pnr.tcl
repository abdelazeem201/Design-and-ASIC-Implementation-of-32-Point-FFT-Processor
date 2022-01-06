
loadConfig ./Default.conf
commitConfig
source ./MMMC.tcl
setDesignMode -process 130

floorPlan  -r 1 0.7 20.0 20.0 20.0 20.0
#loadIoFile FFT.io

addRing -nets {VCC GND} -follow core -stacked_via_top_layer metal8 -stacked_via_bottom_layer metal1 -layer {bottom metal1 top metal1 right metal2 left metal2} -width 3 -spacing 1
addStripe -nets {VCC GND} -layer metal8 -width 4 -direction Horizontal -set_to_set_distance 22 -spacing 2 -extend_to design_boundary -start_y 2 -stop_y 48
addStripe -nets {VCC GND} -layer metal7 -width 4 -direction Vertical -set_to_set_distance 20 -spacing 2 -extend_to design_boundary -start_x 7 -stop_x 98

sroute -allowLayerChange 1 -blockPinTarget nearestTarget -crossoverViaBottomLayer M1 -crossoverViaTopLayer M4 -layerChangeRange {M1 M4} -nets {VCC VGND}

#addWellTap -cell -fixedGap 30
addEndCap -precap FILLER4EHD -postcap FILLER4EHD -prefix EndCap
saveDesign ./saving/FFT_power.enc
timeDesign -prePlace -idealClock -drvReports -outDir ./reports/preplace_timing
timeDesign -prePlace -idealClock -hold -outDir ./reports/preplace_timing

setPlaceMode -clkGateAware true -congEffort medium -ignoreScan -timingDriven true
placeDesign
timeDesign -preCTS -idealClock -drvReports -outDir ./reports/place_timing
timeDesign -preCTS -idealClock -hold -outDir ./reports/place_timing

optDesign -preCTS 
saveDesign ./saving/FFT_Placed.enc
timeDesign -preCTS -idealClock -drvReports -outDir ./reports/postplace_timing
timeDesign -preCTS -idealClock -hold -outDir ./reports/postplace_timing

setCTSMode -moveGate true -opt true -optArea true -optLatency true -routeClkNet true -routeBottomPreferredLayer 1 -routeTopPreferredLayer 4
clockDesign -specFile ./Clock.ctstch
timeDesign -postCTS -drvReports -outDir ./reports/cts_timing
timeDesign -postCTS -hold -outDir ./reports/cts_timing
 
optDesign -postCTS 
saveDesign ./saving/FFT_cts.enc
timeDesign -postCTS -drvReports -outDir ./reports/postcts_timing
timeDesign -postCTS -hold -outDir ./reports/postcts_timing

routeDesign -globalDetail -viaOpt -wireOpt
timeDesign -postRoute -drvReports -outDir ./reports/route_timing
timeDesign -postRoute -hold -outDir ./reports/route_timing

optDesign -postRoute
optDesign -postRoute -hold
saveDesign ./saving/FFT_route.enc
timeDesign -postRoute -drvReports -outDir ./reports/postroute_timing
timeDesign -postRoute -hold -outDir ./reports/postroute_timing
 
addFiller -cell {FILLER1HD FILLER2HD FILLER3HD FILLER4EHD FILLER8EHD FILLER16EHD FILLER32EHD FILLER64EHD}

extractRC -outfile ./FFT_rc
write_sdf FFT.sdf
saveNetlist ./FFT.v -includePowerGround
report_power -leakage -outfile FFT.pwr
saveDesign ./saving/FFT.enc
set map /home/abdelhay_ali/Desktop/Abdelazeem/FFT_Processor/UMC130nm/dfii/streamOut.map
streamOut ./FFT.gds -units 100 -mapFile $map
