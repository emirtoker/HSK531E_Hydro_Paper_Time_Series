
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_code.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/gsn_csm.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/wrf/WRFUserARW.ncl"
load "$NCARG_ROOT/lib/ncarg/nclscripts/csm/shea_util.ncl"

;***********************************************

begin
;***********************************************

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  wks = gsn_open_wks("png","hydro_makale_time_series")    ; open a workstation


; .txt Okuma 

  sig = ";"         ; .txt içindeki ayıraç                    

; 1 ----------------------------------------------------------------------------------
  filename1 = "/Users/emirtoker/Desktop/Dersler/Doktora_Ders/Projeler/Cuneyd_Hoca_Makale/time_series/aqua_results_qual.txt"
  lines1 = asciiread(filename1,-1,"string")       ; tamamını oku
  data1 = lines1(0:3393) 
  data1@_FillValue = -9999

  aqua = tofloat(str_get_field(data1, 7, sig))
  aqua@_FillValue = -9999

; 2 ----------------------------------------------------------------------------------
  filename2 = "/Users/emirtoker/Desktop/Dersler/Doktora_Ders/Projeler/Cuneyd_Hoca_Makale/time_series/smap_results_qual.txt"
  lines2 = asciiread(filename2,-1,"string")       ; tamamını oku
  data2 = lines2(0:1347) 
  data2@_FillValue = -9999

  smap = tofloat(str_get_field(data2, 7, sig))
  smap@_FillValue = -9999

; 3 ----------------------------------------------------------------------------------
  filename3 = "/Users/emirtoker/Desktop/Dersler/Doktora_Ders/Projeler/Cuneyd_Hoca_Makale/time_series/esa_results_qual.txt"
  lines3 = asciiread(filename3,-1,"string")       ; tamamını oku
  ;data3 = lines3(0:14486) 
  data3 = lines3(8826:14486) 
  data3@_FillValue = -9999

  esa = tofloat(str_get_field(data3, 5, sig))
  esa@_FillValue = -9999
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

 ; P ----------------------------------------------------------------------------------
  filename_P = "/Users/emirtoker/Desktop/Dersler/Doktora_Ders/Projeler/Cuneyd_Hoca_Makale/time_series/P.txt"
  lines_P = asciiread(filename_P,-1,"string")       ; tamamını oku
  data_P = lines_P(0:20453) 
  data_P@_FillValue = -9999

  P = tofloat(str_get_field(data_P, 4, sig))
  P@_FillValue = -9999

 ; PET ----------------------------------------------------------------------------------
  filename_PET = "/Users/emirtoker/Desktop/Dersler/Doktora_Ders/Projeler/Cuneyd_Hoca_Makale/time_series/PET.txt"
  lines_PET = asciiread(filename_PET,-1,"string")       ; tamamını oku
  data_PET = lines_PET(0:20453) 
  data_PET@_FillValue = -9999

  PET = tofloat(str_get_field(data_PET, 4, sig))
  PET@_FillValue = -9999

 ; Q_Cochem ----------------------------------------------------------------------------------
  filename_Q_Cochem = "/Users/emirtoker/Desktop/Dersler/Doktora_Ders/Projeler/Cuneyd_Hoca_Makale/time_series/Q_Cochem.txt"
  lines_Q_Cochem = asciiread(filename_Q_Cochem,-1,"string")       ; tamamını oku
  data_Q_Cochem = lines_Q_Cochem(0:20453) 
  data_Q_Cochem@_FillValue = -9999

  Q_Cochem = tofloat(str_get_field(data_Q_Cochem, 4, sig))
  Q_Cochem@_FillValue = -9999

; _Q_Lobith ----------------------------------------------------------------------------------
  filename_Q_Lobith = "/Users/emirtoker/Desktop/Dersler/Doktora_Ders/Projeler/Cuneyd_Hoca_Makale/time_series/Q_Lobith.txt"
  lines_Q_Lobith = asciiread(filename_Q_Lobith,-1,"string")       ; tamamını oku
  data_Q_Lobith = lines_Q_Lobith(0:20453) 
  data_Q_Lobith@_FillValue = -9999

  Q_Lobith = tofloat(str_get_field(data_Q_Lobith, 4, sig))
  Q_Lobith@_FillValue = -9999

; _T ----------------------------------------------------------------------------------
  filename_T = "/Users/emirtoker/Desktop/Dersler/Doktora_Ders/Projeler/Cuneyd_Hoca_Makale/time_series/T.txt"
  lines_T = asciiread(filename_T,-1,"string")       ; tamamını oku
  data_T = lines_T(0:20453) 
  data_T@_FillValue = -9999

  T = tofloat(str_get_field(data_T, 4, sig))
  T@_FillValue = -9999  

; GW_Output_Moselle ----------------------------------------------------------------------------------
  filename_GW_Output_Moselle = "/Users/emirtoker/Desktop/Dersler/Doktora_Ders/Projeler/Cuneyd_Hoca_Makale/time_series/GW_Output_Moselle.txt"
  lines_GW_Output_Moselle = asciiread(filename_GW_Output_Moselle,-1,"string")       ; tamamını oku
  data_GW_Output_Moselle = lines_GW_Output_Moselle(0:11564) 
  data_GW_Output_Moselle@_FillValue = -9999

  GW_Output_Moselle = tofloat(str_get_field(data_GW_Output_Moselle, 4, sig))
  GW_Output_Moselle@_FillValue = -9999

; GW_Grace ----------------------------------------------------------------------------------
  filename_GW_Grace = "/Users/emirtoker/Desktop/Dersler/Doktora_Ders/Projeler/Cuneyd_Hoca_Makale/time_series/Grace_2009_2016.txt"
  lines_GW_Grace = asciiread(filename_GW_Grace,-1,"string")       ; tamamını oku
  data_GW_Grace = lines_GW_Grace(0:160) 
  data_GW_Grace@_FillValue = -9999

  GW_Grace = tofloat(str_get_field(data_GW_Grace, 5, sig))
  GW_Grace@_FillValue = -9999

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  aqua_step = toint(ispan(0,3393,1))
  smap_step = toint(ispan(0,1347,1))
  ;esa_step = toint(ispan(0,14486,1))
  esa_step = toint(ispan(0,5660,1))

  P_step = toint(ispan(0,20453,1))
  PET_step = toint(ispan(0,20453,1))
  Q_Cochem_step = toint(ispan(0,20453,1))
  Q_Lobith_step = toint(ispan(0,20453,1))
  T_step = toint(ispan(0,20453,1))
  GW_Output_Moselle_step = toint(ispan(0,11564,1))
  GW_Grace_step = toint(ispan(0,160,1))

; AQUA RES ---------------------------------------------------------------------- 

  res_aqua = True                            ; Set basic res_aquaources both will use
  res_aqua@tmXUseBottom = False
  res_aqua@tmXBAutoPrecision = False
  res_aqua@tmXBLabelAngleF    =    0.                 ; angle labels

  res_aqua@vpXF            = 0.1            ; The left side of the box location
  res_aqua@vpWidthF        = 0.85            ; The Width of the plot box
  res_aqua@vpHeightF       = 0.065            ; The height of the plot box
  res_aqua@tmXBMode        = "Explicit"       ; Define own tick mark labels.
  res_aqua@tmXBValues = (/196.,561.,927.,1291.,1657.,2022.,2388.,2755.,3118./)
  res_aqua@tmXBLabels = (/"2002","2003","2004","2005","2006","2007","2008","2009","2010","2011"/)


  ;res_aqua@tmXBTickSpacingF = 8

  res_aqua@tmXTOn          = False            ; turn off the top tick marks
  res_aqua@xyLineThicknesses = 2             ; increase line thickness
  res_aqua@gsnDraw         = False           ; Don't draw individual plot.
  res_aqua@gsnFrame        = False           ; Don't advance frame.
  ;res_aqua@tmXBLabelAngleF = -90    ; tilt the XB labels 45 degrees
  
  res_aqua@vpYF           = 0.975         ; The top side of the plot box loc
  res_aqua@xyLineColor    =  "blue"       ; set line color
  ;res_aqua@trYMaxF        = 300                   ; axis max
  ;res_aqua@trYMinF        = 100                    ; axis min
  res_aqua@gsnLeftString   = "AQUA SM"
  res_aqua@tiYAxisString = "(g/cm~S~3~N~)"

  res_aqua@tmYLMode          = "Explicit"                ; explicit labels
  res_aqua@tmYLValues        = (/300,200,100/)  
  res_aqua@tmYLLabels        = (/"300","200","100"/)
res_aqua@tmXBLabelFontHeightF = 0.01 ; Change font height of labels.
res_aqua@tmYLLabelFontHeightF = 0.01 ; Change font height of labels.
res_aqua@gsnLeftStringFontHeightF = 0.01 ; Change font height of labels.
res_aqua@tiYAxisFontHeightF = 0.012

; SMAP RES ---------------------------------------------------------------------- 

  res_smap = True                            ; Set basic res_smapources both will use
  res_smap@tmXUseBottom = False
  res_smap@tmXBAutoPrecision = False
  res_smap@tmXBLabelAngleF    =    0.                 ; angle labels

  res_smap@vpXF            = 0.1              ; The left side of the box location
  res_smap@vpWidthF        = 0.85             ; The Width of the plot box
  res_smap@vpHeightF       = 0.065           ; The height of the plot box
  res_smap@tmXBMode        = "Explicit"       ; Define own tick mark labels.
  res_smap@tmXBValues = (/276.,642.,1007./)
  res_smap@tmXBLabels = (/"2016","2017","2018"/)
  res_smap@tmXBTickSpacingF = 8

  res_smap@tmXTOn          = False            ; turn off the top tick marks
  res_smap@xyLineThicknesses = 2             ; increase line thickness
  res_smap@gsnDraw         = False           ; Don't draw individual plot.
  res_smap@gsnFrame        = False           ; Don't advance frame.
  ;res_smap@tmXBLabelAngleF = -90    ; tilt the XB labels 45 degrees

  res_smap@vpYF           = 0.850       ; The top side of the plot box loc
  res_smap@xyLineColor    =  "blue"       ; set line color
  res_smap@trYMaxF        =  0.5                    ; axis max
  res_smap@trYMinF        =  0.1                    ; axis min
  res_smap@gsnLeftString   = "SMAP SM"   
  res_smap@tiYAxisString = "(cm~S~3~N~/cm~S~3~N~)"

  res_smap@tmYLMode          = "Explicit"                ; explicit labels
  res_smap@tmYLValues        = (/0.5,0.3 ,0.1 /)  
  res_smap@tmYLLabels        = (/"0.5 ","0.3 ","0.1 "/)
  res_smap@tmXBLabelFontHeightF = 0.01 ; Change font height of labels.
  res_smap@tmYLLabelFontHeightF = 0.01 ; Change font height of labels.
  res_smap@gsnLeftStringFontHeightF = 0.01 ; Change font height of labels.
  res_smap@tiYAxisFontHeightF = 0.012

; ESA RES ---------------------------------------------------------------------- 
  res_esa = True                            ; Set basic res_esaources both will use
  res_esa@tmXUseBottom = False
  res_esa@tmXBAutoPrecision = False
  res_esa@tmXBLabelAngleF    =    0.                 ; angle labels

  res_esa@vpXF            = 0.1              ; The left side of the box location
  res_esa@vpWidthF        = 0.85             ; The Width of the plot box
  res_esa@vpHeightF       = 0.065          ; The height of the plot box
  res_esa@tmXBMode        = "Explicit"       ; Define own tick mark labels.
  res_esa@tmXBValues = (/732.,2558.,4384./)
  res_esa@tmXBLabels = (/"2005","2010","2015"/)
  res_esa@tmXBTickSpacingF = 8

  res_esa@tmXTOn          = False            ; turn off the top tick marks
  res_esa@xyLineThicknesses = 2             ; increase line thickness
  res_esa@gsnDraw         = False           ; Don't draw individual plot.
  res_esa@gsnFrame        = False           ; Don't advance frame.
  ;res_esa@tmXBLabelAngleF = -90    ; tilt the XB labels 45 degrees

  res_esa@vpYF           = 0.725       ; The top side of the plot box loc
  res_esa@xyLineColor    =  "blue"       ; set line color
  res_esa@trYMaxF        =  0.5                    ; axis max
  res_esa@trYMinF        =  0.1                    ; axis min
  res_esa@gsnLeftString   = "ESA SM"   
  res_esa@tiYAxisString = "(m~S~3~N~/m~S~3~N~)"

  res_esa@tmYLMode          = "Explicit"                ; explicit labels
  res_esa@tmYLValues        = (/0.5,0.3 ,0.1 /)  
  res_esa@tmYLLabels        = (/"0.5 ","0.3 ","0.1 "/)
res_esa@tmXBLabelFontHeightF = 0.01 ; Change font height of labels.
res_esa@tmYLLabelFontHeightF = 0.01 ; Change font height of labels.
res_esa@gsnLeftStringFontHeightF = 0.01 ; Change font height of labels.
res_esa@tiYAxisFontHeightF = 0.012

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


; P  ---------------------------------------------------------------------- 

  res_P = True                            ; Set basic res_esaources both will use
  res_P@tmXUseBottom = False
  res_P@tmXBAutoPrecision = False
  res_P@tmXBLabelAngleF    =    0.                 ; angle labels

  res_P@vpXF            = 0.1             ; The left side of the box location
  res_P@vpWidthF        = 0.85            ; The Width of the plot box
  res_P@vpHeightF       = 0.065           ; The height of the plot box
  res_P@tmXBMode        = "Explicit"       ; Define own tick mark labels.
  res_P@tmXBValues = (/3288.,6941.,10593.,14246.,17898./)
  res_P@tmXBLabels = (/"1960","1970","1980","1990","2000"/)
  res_P@tmXBTickSpacingF = 8

  res_P@tmXTOn          = False            ; turn off the top tick marks
  res_P@xyLineThicknesses = 2             ; increase line thickness
  res_P@gsnDraw         = False           ; Don't draw individual plot.
  res_P@gsnFrame        = False           ; Don't advance frame.
  ;res_P@tmXBLabelAngleF = -90    ; tilt the XB labels 45 degrees

  res_P@vpYF           = 0.600       ; The top side of the plot box loc
  res_P@xyLineColor    =  "blue"       ; set line color
  res_P@trYMaxF        =  40                    ; axis max
  res_P@trYMinF        =  0                    ; axis min
  res_P@gsnLeftString   = "P"   
  res_P@tiYAxisString = "(mm)"

  res_P@tmYLMode          = "Explicit"                ; explicit labels
  res_P@tmYLValues        = (/40,20,0/)  
  res_P@tmYLLabels        = (/"40","20","0"/)
res_P@tmXBLabelFontHeightF = 0.01 ; Change font height of labels.
res_P@tmYLLabelFontHeightF = 0.01 ; Change font height of labels.
res_P@gsnLeftStringFontHeightF = 0.01 ; Change font height of labels.
res_P@tiYAxisFontHeightF = 0.012

; PET  ---------------------------------------------------------------------- 

  res_PET = True                            ; Set basic res_esaources both will use
  res_PET@tmXUseBottom = False
  res_PET@tmXBAutoPrecision = False
  res_PET@tmXBLabelAngleF    =    0.                 ; angle labels

  res_PET@vpXF            = 0.1             ; The left side of the box location
  res_PET@vpWidthF        = 0.85            ; The Width of the plot box
  res_PET@vpHeightF       = 0.065           ; The height of the plot box
  res_PET@tmXBMode        = "Explicit"       ; Define own tick mark labels.
  res_PET@tmXBValues = (/3288.,6941.,10593.,14246.,17898./)
  res_PET@tmXBLabels = (/"1960","1970","1980","1990","2000"/)
  res_PET@tmXBTickSpacingF = 8

  res_PET@tmXTOn          = False            ; turn off the top tick marks
  res_PET@xyLineThicknesses = 2             ; increase line thickness
  res_PET@gsnDraw         = False           ; Don't draw individual plot.
  res_PET@gsnFrame        = False           ; Don't advance frame.
  ;res_PET@tmXBLabelAngleF = -90    ; tilt the XB labels 45 degrees

  res_PET@vpYF           = 0.475       ; The top side of the plot box loc
  res_PET@xyLineColor    =  "blue"       ; set line color
  res_PET@trYMaxF        =  6                    ; axis max
  res_PET@trYMinF        =  0                    ; axis min
  res_PET@gsnLeftString   = "PET"   
  res_PET@tiYAxisString = "(mm)"

  res_PET@tmYLMode          = "Explicit"                ; explicit labels
  res_PET@tmYLValues        = (/6,3,0/)  
  res_PET@tmYLLabels        = (/"6","3","0"/)
res_PET@tmXBLabelFontHeightF = 0.01 ; Change font height of labels.
res_PET@tmYLLabelFontHeightF = 0.01 ; Change font height of labels.
res_PET@gsnLeftStringFontHeightF = 0.01 ; Change font height of labels.
res_PET@tiYAxisFontHeightF = 0.012

  ; P  ---------------------------------------------------------------------- 

  res_Q_Cochem = True                            ; Set basic res_esaources both will use
  res_Q_Cochem@tmXUseBottom = False
  res_Q_Cochem@tmXBAutoPrecision = False
  res_Q_Cochem@tmXBLabelAngleF    =    0.                 ; angle labels

  res_Q_Cochem@vpXF            = 0.1              ; The left side of the box location
  res_Q_Cochem@vpWidthF        = 0.85             ; The Width of the plot box
  res_Q_Cochem@vpHeightF       = 0.065           ; The height of the plot box
  res_Q_Cochem@tmXBMode        = "Explicit"       ; Define own tick mark labels.
  res_Q_Cochem@tmXBValues = (/3288.,6941.,10593.,14246.,17898./)
  res_Q_Cochem@tmXBLabels = (/"1960","1970","1980","1990","2000"/)
  res_Q_Cochem@tmXBTickSpacingF = 8

  res_Q_Cochem@tmXTOn          = False            ; turn off the top tick marks
  res_Q_Cochem@xyLineThicknesses = 2             ; increase line thickness
  res_Q_Cochem@gsnDraw         = False           ; Don't draw individual plot.
  res_Q_Cochem@gsnFrame        = False           ; Don't advance frame.
  ;res_Q_Cochem@tmXBLabelAngleF = -90    ; tilt the XB labels 45 degrees

  res_Q_Cochem@vpYF           = 0.350       ; The top side of the plot box loc
  res_Q_Cochem@xyLineColor    =  "blue"       ; set line color
  res_Q_Cochem@trYMaxF        =  4020                    ; axis max
  res_Q_Cochem@trYMinF        =  10                    ; axis min
  res_Q_Cochem@gsnLeftString   = "Q_Cochem"   
  res_Q_Cochem@tiYAxisString = "(m~S~3~N~/s)"

  res_Q_Cochem@tmYLMode          = "Explicit"                ; explicit labels
  res_Q_Cochem@tmYLValues        = (/4020,2010,10/)  
  res_Q_Cochem@tmYLLabels        = (/"4020","2010","10"/)
res_Q_Cochem@tmXBLabelFontHeightF = 0.01 ; Change font height of labels.
res_Q_Cochem@tmYLLabelFontHeightF = 0.01 ; Change font height of labels.
res_Q_Cochem@gsnLeftStringFontHeightF = 0.01 ; Change font height of labels.
res_Q_Cochem@tiYAxisFontHeightF = 0.012

  ; _Q_Lobith  ---------------------------------------------------------------------- 

;  res_Q_Lobith = True                            ; Set basic res_esaources both will use
;  res_Q_Lobith@tmXUseBottom = False
;  res_Q_Lobith@tmXBAutoPrecision = False
;  res_Q_Lobith@tmXBLabelAngleF    =    0.                 ; angle labels

;  res_Q_Lobith@vpXF            = 0.15            ; The left side of the box location
;  res_Q_Lobith@vpWidthF        = 0.70            ; The Width of the plot box
;  res_Q_Lobith@vpHeightF       = 0.04           ; The height of the plot box
;  res_Q_Lobith@tmXBMode        = "Explicit"       ; Define own tick mark labels.
;  res_Q_Lobith@tmXBValues = (/3288.,6941.,10593.,14246.,17898./)
;  res_Q_Lobith@tmXBLabels = (/"1960","1970","1980","1990","2000"/)
;  res_Q_Lobith@tmXBTickSpacingF = 8

;  res_Q_Lobith@tmXTOn          = False            ; turn off the top tick marks
;  res_Q_Lobith@xyLineThicknesses = 2             ; increase line thickness
;  res_Q_Lobith@gsnDraw         = False           ; Don't draw individual plot.
;  res_Q_Lobith@gsnFrame        = False           ; Don't advance frame.
;  ;res_Q_Lobith@tmXBLabelAngleF = -90    ; tilt the XB labels 45 degrees

;  res_Q_Lobith@vpYF           = 0.375       ; The top side of the plot box loc
;  res_Q_Lobith@xyLineColor    =  "blue"       ; set line color
;  res_Q_Lobith@trYMaxF        =  12000                    ; axis max
;  res_Q_Lobith@trYMinF        =  600                    ; axis min
;  res_Q_Lobith@gsnLeftString   = "Q_Lobith"   
;  res_Q_Lobith@tiYAxisString = "(?)"

;  res_Q_Lobith@tmYLMode          = "Explicit"                ; explicit labels
;  res_Q_Lobith@tmYLValues        = (/12000,6300,600/)  
;  res_Q_Lobith@tmYLLabels        = (/"12000","6300","600"/)
; es_Q_Lobith@tmXBLabelFontHeightF = 0.01 ; Change font height of labels.
; es_Q_Lobith@tmYLLabelFontHeightF = 0.01 ; Change font height of labels.
; es_Q_Lobith@gsnLeftStringFontHeightF = 0.01 ; Change font height of labels.
; es_Q_Lobith@tiYAxisFontHeightF = 0.01

  ; T  ---------------------------------------------------------------------- 

;   res_T = True                            ; Set basic res_esaources both will use
;   res_T@tmXUseBottom = False
;   res_T@tmXBAutoPrecision = False
;   res_T@tmXBLabelAngleF    =    0.                 ; angle labels
; 
;   res_T@vpXF            = 0.15            ; The left side of the box location
;   res_T@vpWidthF        = 0.70            ; The Width of the plot box
;   res_T@vpHeightF       = 0.04           ; The height of the plot box
;   res_T@tmXBMode        = "Explicit"       ; Define own tick mark labels.
;   res_T@tmXBValues = (/3288.,6941.,10593.,14246.,17898./)
;   res_T@tmXBLabels = (/"1960","1970","1980","1990","2000"/)
;   res_T@tmXBTickSpacingF = 8
; 
;   res_T@tmXTOn          = False            ; turn off the top tick marks
;   res_T@xyLineThicknesses = 2             ; increase line thickness
;   res_T@gsnDraw         = False           ; Don't draw individual plot.
;   res_T@gsnFrame        = False           ; Don't advance frame.
;   ;res_T@tmXBLabelAngleF = -90    ; tilt the XB labels 45 degrees
; 
;   res_T@vpYF           = 0.275       ; The top side of the plot box loc
;   res_T@xyLineColor    =  "blue"       ; set line color
;   res_T@trYMaxF        =  30                    ; axis max
;   res_T@trYMinF        =  0                    ; axis min
;   res_T@gsnLeftString   = "T"   
;   res_T@tiYAxisString = "(?)"
; 
;   res_T@tmYLMode          = "Explicit"                ; explicit labels
;   res_T@tmYLValues        = (/30,15,0/)  
;   res_T@tmYLLabels        = (/"30","15","0"/)
; res_T@tmXBLabelFontHeightF = 0.01 ; Change font height of labels.
; res_T@tmYLLabelFontHeightF = 0.01 ; Change font height of labels.
; res_T@gsnLeftStringFontHeightF = 0.01 ; Change font height of labels.
; res_T@tiYAxisFontHeightF = 0.01

  ; GW_Output_Moselle  ---------------------------------------------------------------------- 

  res_GW_Output_Moselle = True                            ; Set basic res_esaources both will use
  res_GW_Output_Moselle@tmXUseBottom = False
  res_GW_Output_Moselle@tmXBAutoPrecision = False
  res_GW_Output_Moselle@tmXBLabelAngleF    =    0.                 ; angle labels

  res_GW_Output_Moselle@vpXF            = 0.1              ; The left side of the box location
  res_GW_Output_Moselle@vpWidthF        = 0.85             ; The Width of the plot box
  res_GW_Output_Moselle@vpHeightF       = 0.065           ; The height of the plot box
  res_GW_Output_Moselle@tmXBMode        = "Explicit"       ; Define own tick mark labels.
  res_GW_Output_Moselle@tmXBValues = (/693.,2520.,4346.,6172.,7998.,9825./)
  res_GW_Output_Moselle@tmXBLabels = (/"1980","1985","1990","1995","2000","2005"/)
  res_GW_Output_Moselle@tmXBTickSpacingF = 8

  res_GW_Output_Moselle@tmXTOn          = False            ; turn off the top tick marks
  res_GW_Output_Moselle@xyLineThicknesses = 2             ; increase line thickness
  res_GW_Output_Moselle@gsnDraw         = False           ; Don't draw individual plot.
  res_GW_Output_Moselle@gsnFrame        = False           ; Don't advance frame.
  ;res_GW_Output_Moselle@tmXBLabelAngleF = -90    ; tilt the XB labels 45 degrees

  res_GW_Output_Moselle@vpYF           = 0.225       ; The top side of the plot box loc
  res_GW_Output_Moselle@xyLineColor    =  "blue"       ; set line color
  res_GW_Output_Moselle@trYMaxF        =  67.4                 ; axis max
  res_GW_Output_Moselle@trYMinF        =  66.4                   ; axis min
  res_GW_Output_Moselle@gsnLeftString   = "GW_Output"   
  res_GW_Output_Moselle@tiYAxisString = "(m)"

  res_GW_Output_Moselle@tmYLMode          = "Explicit"                ; explicit labels
  res_GW_Output_Moselle@tmYLValues        = (/67.4,66.9,66.4/)  
  res_GW_Output_Moselle@tmYLLabels        = (/"67.4","66.9","66.4"/)
res_GW_Output_Moselle@tmXBLabelFontHeightF = 0.01 ; Change font height of labels.
res_GW_Output_Moselle@tmYLLabelFontHeightF = 0.01 ; Change font height of labels.
res_GW_Output_Moselle@gsnLeftStringFontHeightF = 0.01 ; Change font height of labels.
res_GW_Output_Moselle@tiYAxisFontHeightF = 0.01

  ; GW_Grace  ---------------------------------------------------------------------- 

  res_GW_Grace = True                            ; Set basic res_esaources both will use
  res_GW_Grace@tmXUseBottom = False
  res_GW_Grace@tmXBAutoPrecision = False
  res_GW_Grace@tmXBLabelAngleF    =    0.                 ; angle labels

  res_GW_Grace@vpXF            = 0.1             ; The left side of the box location
  res_GW_Grace@vpWidthF        = 0.85            ; The Width of the plot box
  res_GW_Grace@vpHeightF       = 0.063           ; The height of the plot box
  res_GW_Grace@tmXBMode        = "Explicit"       ; Define own tick mark labels.
  res_GW_Grace@tmXBValues = (/9.,32.,56.,80.,103.,123.,141.,158./)
  res_GW_Grace@tmXBLabels = (/"2003","2005","2007","2009","2011","2013","2015","2017"/)
  res_GW_Grace@tmXBTickSpacingF = 8

  res_GW_Grace@tmXTOn          = False            ; turn off the top tick marks
  res_GW_Grace@xyLineThicknesses = 2             ; increase line thickness
  res_GW_Grace@gsnDraw         = False           ; Don't draw individual plot.
  res_GW_Grace@gsnFrame        = False           ; Don't advance frame.
  ;res_GW_Grace@tmXBLabelAngleF = -90    ; tilt the XB labels 45 degrees

  res_GW_Grace@vpYF           = 0.100       ; The top side of the plot box loc
  res_GW_Grace@xyLineColor    =  "blue"       ; set line color
  res_GW_Grace@trYMaxF        =  72.5                 ; axis max
  res_GW_Grace@trYMinF        =  62.1                  ; axis min
  res_GW_Grace@gsnLeftString   = "GW_Grace"   
  res_GW_Grace@tiYAxisString = "(m)"

  res_GW_Grace@tmYLMode          = "Explicit"                ; explicit labels
  res_GW_Grace@tmYLValues        = (/72.5,67.3,62.1/)  
  res_GW_Grace@tmYLLabels        = (/"72.5","67.3","62.1"/)
res_GW_Grace@tmXBLabelFontHeightF = 0.01 ; Change font height of labels.
res_GW_Grace@tmYLLabelFontHeightF = 0.01 ; Change font height of labels.
res_GW_Grace@gsnLeftStringFontHeightF = 0.01 ; Change font height of labels.
res_GW_Grace@tiYAxisFontHeightF = 0.01

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

  aqua_plot = gsn_csm_xy(wks,aqua_step,aqua,res_aqua)
  smap_plot = gsn_csm_xy(wks,smap_step,smap,res_smap)
  esa_plot = gsn_csm_xy(wks,esa_step,esa,res_esa)
  P_plot = gsn_csm_xy(wks,P_step,P,res_P)
  PET_plot = gsn_csm_xy(wks,PET_step,PET,res_PET)
  Q_Cochem_plot = gsn_csm_xy(wks,Q_Cochem_step,Q_Cochem,res_Q_Cochem)
  ;Q_Lobith_plot = gsn_csm_xy(wks,Q_Lobith_step,Q_Lobith,res_Q_Lobith)
  ;T_plot = gsn_csm_xy(wks,T_step,T,res_T)
  GW_Output_Moselle_plot = gsn_csm_xy(wks,GW_Output_Moselle_step,GW_Output_Moselle,res_GW_Output_Moselle)
  GW_Grace_plot = gsn_csm_xy(wks,GW_Grace_step,GW_Grace,res_GW_Grace)

  draw(aqua_plot) 
  draw(smap_plot)
  draw(esa_plot)
  draw(P_plot)
  draw(PET_plot)
  draw(Q_Cochem_plot)
  ;draw(Q_Lobith_plot)
  ;draw(T_plot)
  draw(GW_Output_Moselle_plot)
  draw(GW_Grace_plot)

  frame(wks)                            ; now frame the plot   

;-----------------------------------------------------------------------

end
