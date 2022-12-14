EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 7
Title "D-Jetronic ECU Tester"
Date "2022-10-15"
Rev "2.1"
Comp "(C) Britishideas 2021-2022"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Regulator_Switching:LM2596S-5 U?
U 1 1 60487041
P 4000 5750
AR Path="/60487041" Ref="U?"  Part="1" 
AR Path="/60479334/60487041" Ref="U2"  Part="1" 
F 0 "U2" H 3650 5500 50  0000 C CNN
F 1 "LM2596S-5" H 4300 5500 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:TO-263-5_TabPin3" H 4050 5500 50  0001 L CIN
F 3 "http://www.ti.com/lit/ds/symlink/lm2596.pdf" H 4000 5750 50  0001 C CNN
F 4 "LM2596S-5.0/NOPB" H 4000 5750 50  0001 C CNN "manf#"
	1    4000 5750
	1    0    0    -1  
$EndComp
$Comp
L power:+12V #PWR?
U 1 1 60487047
P 3250 5500
AR Path="/60487047" Ref="#PWR?"  Part="1" 
AR Path="/60479334/60487047" Ref="#PWR017"  Part="1" 
F 0 "#PWR017" H 3250 5350 50  0001 C CNN
F 1 "+12V" H 3265 5673 50  0000 C CNN
F 2 "" H 3250 5500 50  0001 C CNN
F 3 "" H 3250 5500 50  0001 C CNN
	1    3250 5500
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 6048704D
P 5300 5500
AR Path="/6048704D" Ref="#PWR?"  Part="1" 
AR Path="/60479334/6048704D" Ref="#PWR022"  Part="1" 
F 0 "#PWR022" H 5300 5350 50  0001 C CNN
F 1 "+5V" H 5315 5673 50  0000 C CNN
F 2 "" H 5300 5500 50  0001 C CNN
F 3 "" H 5300 5500 50  0001 C CNN
	1    5300 5500
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 60487053
P 4000 6150
AR Path="/60487053" Ref="#PWR?"  Part="1" 
AR Path="/60479334/60487053" Ref="#PWR019"  Part="1" 
F 0 "#PWR019" H 4000 5900 50  0001 C CNN
F 1 "GND" H 4005 5977 50  0000 C CNN
F 2 "" H 4000 6150 50  0001 C CNN
F 3 "" H 4000 6150 50  0001 C CNN
	1    4000 6150
	1    0    0    -1  
$EndComp
Wire Wire Line
	3500 5850 3500 6150
Wire Wire Line
	3500 6150 4000 6150
Wire Wire Line
	4000 6150 4000 6050
Connection ~ 3500 6150
$Comp
L Device:CP C?
U 1 1 6048705D
P 3250 5800
AR Path="/6048705D" Ref="C?"  Part="1" 
AR Path="/60479334/6048705D" Ref="C8"  Part="1" 
F 0 "C8" H 3350 5800 50  0000 L CNN
F 1 "680uF e" V 3100 5700 50  0000 L CNN
F 2 "Capacitor_SMD:CP_Elec_10x10.5" H 3288 5650 50  0001 C CNN
F 3 "~" H 3250 5800 50  0001 C CNN
	1    3250 5800
	1    0    0    -1  
$EndComp
Wire Wire Line
	3500 5650 3250 5650
Wire Wire Line
	3250 5650 3250 5500
Connection ~ 3250 5650
Wire Wire Line
	3250 5950 3250 6150
Wire Wire Line
	3250 6150 3500 6150
$Comp
L Device:D_Schottky D?
U 1 1 60487068
P 4700 6000
AR Path="/60487068" Ref="D?"  Part="1" 
AR Path="/60479334/60487068" Ref="D2"  Part="1" 
F 0 "D2" V 4654 6080 50  0000 L CNN
F 1 "B360A-13-F" V 4900 5850 50  0000 L CNN
F 2 "Diode_SMD:D_SMA" H 4700 6000 50  0001 C CNN
F 3 "~" H 4700 6000 50  0001 C CNN
F 4 "B360A-13-F" V 4700 6000 50  0001 C CNN "manf#"
	1    4700 6000
	0    1    1    0   
$EndComp
Wire Wire Line
	4500 5850 4700 5850
Wire Wire Line
	4700 6150 4000 6150
Connection ~ 4000 6150
$Comp
L Device:L L?
U 1 1 60487071
P 4950 5850
AR Path="/60487071" Ref="L?"  Part="1" 
AR Path="/60479334/60487071" Ref="L1"  Part="1" 
F 0 "L1" V 4900 5850 50  0000 C CNN
F 1 "33uH" V 5049 5850 50  0000 C CNN
F 2 "Britishideas:Wurth-WE-LQS-Inductor" H 4950 5850 50  0001 C CNN
F 3 "~" H 4950 5850 50  0001 C CNN
F 4 "74404063330" V 4950 5850 50  0001 C CNN "manf#"
	1    4950 5850
	0    -1   -1   0   
$EndComp
Wire Wire Line
	4700 5850 4800 5850
Connection ~ 4700 5850
$Comp
L Device:CP C?
U 1 1 60487079
P 5300 6000
AR Path="/60487079" Ref="C?"  Part="1" 
AR Path="/60479334/60487079" Ref="C10"  Part="1" 
F 0 "C10" H 5050 6050 50  0000 L CNN
F 1 "220uF e" V 5450 5900 50  0000 L CNN
F 2 "Capacitor_SMD:CP_Elec_8x6.5" H 5338 5850 50  0001 C CNN
F 3 "~" H 5300 6000 50  0001 C CNN
	1    5300 6000
	1    0    0    -1  
$EndComp
Wire Wire Line
	5100 5850 5300 5850
Wire Wire Line
	5300 6150 4700 6150
Connection ~ 4700 6150
Wire Wire Line
	4500 5650 5300 5650
Wire Wire Line
	5300 5650 5300 5850
Connection ~ 5300 5850
Wire Wire Line
	5300 5650 5300 5500
Connection ~ 5300 5650
$Comp
L Device:D D?
U 1 1 604917B5
P 9000 3600
AR Path="/604917B5" Ref="D?"  Part="1" 
AR Path="/60479334/604917B5" Ref="D4"  Part="1" 
F 0 "D4" H 9000 3817 50  0000 C CNN
F 1 "MBR0520LT1G" H 9000 3726 50  0000 C CNN
F 2 "Britishideas:SOD-123" H 9000 3600 50  0001 C CNN
F 3 "~" H 9000 3600 50  0001 C CNN
F 4 "MBR0520LT1G" H 9000 3600 50  0001 C CNN "manf#"
	1    9000 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	9150 3600 9350 3600
Wire Wire Line
	9350 3600 9350 3300
Wire Wire Line
	8850 3600 8600 3600
Wire Wire Line
	8600 3600 8600 3400
$Comp
L power:+5V #PWR?
U 1 1 604917BF
P 8600 3300
AR Path="/604917BF" Ref="#PWR?"  Part="1" 
AR Path="/60479334/604917BF" Ref="#PWR025"  Part="1" 
F 0 "#PWR025" H 8600 3150 50  0001 C CNN
F 1 "+5V" H 8615 3473 50  0000 C CNN
F 2 "" H 8600 3300 50  0001 C CNN
F 3 "" H 8600 3300 50  0001 C CNN
	1    8600 3300
	1    0    0    -1  
$EndComp
$Comp
L power:VBUS #PWR?
U 1 1 604917C5
P 9350 3300
AR Path="/604917C5" Ref="#PWR?"  Part="1" 
AR Path="/60479334/604917C5" Ref="#PWR028"  Part="1" 
F 0 "#PWR028" H 9350 3150 50  0001 C CNN
F 1 "VBUS" H 9365 3473 50  0000 C CNN
F 2 "" H 9350 3300 50  0001 C CNN
F 3 "" H 9350 3300 50  0001 C CNN
	1    9350 3300
	1    0    0    -1  
$EndComp
Text Notes 8650 3750 0    50   ~ 0
5V AUTO SELECTOR
$Comp
L power:VBUS #PWR?
U 1 1 604917CC
P 9200 4450
AR Path="/604917CC" Ref="#PWR?"  Part="1" 
AR Path="/60479334/604917CC" Ref="#PWR026"  Part="1" 
F 0 "#PWR026" H 9200 4300 50  0001 C CNN
F 1 "VBUS" H 9215 4623 50  0000 C CNN
F 2 "" H 9200 4450 50  0001 C CNN
F 3 "" H 9200 4450 50  0001 C CNN
	1    9200 4450
	1    0    0    -1  
$EndComp
$Comp
L Device:CP C?
U 1 1 604917D2
P 8750 4700
AR Path="/604917D2" Ref="C?"  Part="1" 
AR Path="/60479334/604917D2" Ref="C12"  Part="1" 
F 0 "C12" H 8850 4700 50  0000 L CNN
F 1 "4.7uF 16V e" V 8600 4500 50  0000 L CNN
F 2 "Capacitor_SMD:CP_Elec_4x5.8" H 8788 4550 50  0001 C CNN
F 3 "~" H 8750 4700 50  0001 C CNN
	1    8750 4700
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 604917D8
P 9200 4700
AR Path="/604917D8" Ref="C?"  Part="1" 
AR Path="/60479334/604917D8" Ref="C13"  Part="1" 
F 0 "C13" H 9315 4746 50  0000 L CNN
F 1 "100nF" H 9315 4655 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 9238 4550 50  0001 C CNN
F 3 "~" H 9200 4700 50  0001 C CNN
	1    9200 4700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 604917DE
P 9200 4950
AR Path="/604917DE" Ref="#PWR?"  Part="1" 
AR Path="/60479334/604917DE" Ref="#PWR027"  Part="1" 
F 0 "#PWR027" H 9200 4700 50  0001 C CNN
F 1 "GND" H 9205 4777 50  0000 C CNN
F 2 "" H 9200 4950 50  0001 C CNN
F 3 "" H 9200 4950 50  0001 C CNN
	1    9200 4950
	1    0    0    -1  
$EndComp
Wire Wire Line
	9200 4450 9200 4550
Wire Wire Line
	9200 4550 8750 4550
Connection ~ 9200 4550
Wire Wire Line
	8750 4850 9200 4850
Wire Wire Line
	9200 4850 9200 4950
Connection ~ 9200 4850
$Comp
L Interface_USB:FT232RL U?
U 1 1 6049770E
P 4550 3050
AR Path="/6049770E" Ref="U?"  Part="1" 
AR Path="/60479334/6049770E" Ref="U3"  Part="1" 
F 0 "U3" H 3950 2150 50  0000 C CNN
F 1 "FT232RL" H 5050 2150 50  0000 C CNN
F 2 "Package_SO:SSOP-28_5.3x10.2mm_P0.65mm" H 5650 2150 50  0001 C CNN
F 3 "https://www.ftdichip.com/Support/Documents/DataSheets/ICs/DS_FT232R.pdf" H 4550 3050 50  0001 C CNN
F 4 "FT232RL-REEL" H 4550 3050 50  0001 C CNN "manf#"
	1    4550 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	5350 2350 5450 2350
Wire Wire Line
	5350 2450 5450 2450
$Comp
L power:+5V #PWR?
U 1 1 60497718
P 4550 1950
AR Path="/60497718" Ref="#PWR?"  Part="1" 
AR Path="/60479334/60497718" Ref="#PWR020"  Part="1" 
F 0 "#PWR020" H 4550 1800 50  0001 C CNN
F 1 "+5V" H 4565 2123 50  0000 C CNN
F 2 "" H 4550 1950 50  0001 C CNN
F 3 "" H 4550 1950 50  0001 C CNN
	1    4550 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	4650 2050 4650 1950
Wire Wire Line
	4650 1950 4550 1950
Wire Wire Line
	4550 1950 4450 1950
Wire Wire Line
	4450 1950 4450 2050
Connection ~ 4550 1950
$Comp
L power:GND #PWR?
U 1 1 60497723
P 4550 4150
AR Path="/60497723" Ref="#PWR?"  Part="1" 
AR Path="/60479334/60497723" Ref="#PWR021"  Part="1" 
F 0 "#PWR021" H 4550 3900 50  0001 C CNN
F 1 "GND" H 4555 3977 50  0000 C CNN
F 2 "" H 4550 4150 50  0001 C CNN
F 3 "" H 4550 4150 50  0001 C CNN
	1    4550 4150
	1    0    0    -1  
$EndComp
Wire Wire Line
	4350 4050 4350 4150
Wire Wire Line
	4350 4150 4550 4150
Wire Wire Line
	4550 4050 4550 4150
Connection ~ 4550 4150
Wire Wire Line
	4650 4050 4650 4150
Wire Wire Line
	4650 4150 4550 4150
Wire Wire Line
	4750 4050 4750 4150
Wire Wire Line
	4750 4150 4650 4150
Connection ~ 4650 4150
$Comp
L Device:C C?
U 1 1 60497732
P 5850 2750
AR Path="/60497732" Ref="C?"  Part="1" 
AR Path="/60479334/60497732" Ref="C11"  Part="1" 
F 0 "C11" V 5598 2750 50  0000 C CNN
F 1 "100nF" V 5689 2750 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 5888 2600 50  0001 C CNN
F 3 "~" H 5850 2750 50  0001 C CNN
	1    5850 2750
	0    1    1    0   
$EndComp
Wire Wire Line
	5350 2750 5700 2750
Wire Wire Line
	6000 2750 6100 2750
NoConn ~ 5350 2550
NoConn ~ 5350 3050
NoConn ~ 5350 2850
NoConn ~ 5350 2950
NoConn ~ 5350 2650
NoConn ~ 3750 3050
NoConn ~ 5350 3750
NoConn ~ 5350 3550
NoConn ~ 5350 3650
NoConn ~ 3750 3450
NoConn ~ 3750 3250
Wire Wire Line
	4350 4150 3750 4150
Wire Wire Line
	3750 4150 3750 3750
Connection ~ 4350 4150
$Comp
L power:+3V3 #PWR?
U 1 1 60497749
P 3450 1950
AR Path="/60497749" Ref="#PWR?"  Part="1" 
AR Path="/60479334/60497749" Ref="#PWR018"  Part="1" 
F 0 "#PWR018" H 3450 1800 50  0001 C CNN
F 1 "+3V3" H 3465 2123 50  0000 C CNN
F 2 "" H 3450 1950 50  0001 C CNN
F 3 "" H 3450 1950 50  0001 C CNN
	1    3450 1950
	1    0    0    -1  
$EndComp
Wire Wire Line
	3750 2350 3450 2350
Wire Wire Line
	3450 2350 3450 1950
$Comp
L Device:C C?
U 1 1 60497751
P 3300 2350
AR Path="/60497751" Ref="C?"  Part="1" 
AR Path="/60479334/60497751" Ref="C9"  Part="1" 
F 0 "C9" V 3048 2350 50  0000 C CNN
F 1 "100nF" V 3139 2350 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 3338 2200 50  0001 C CNN
F 3 "~" H 3300 2350 50  0001 C CNN
	1    3300 2350
	0    1    1    0   
$EndComp
Connection ~ 3450 2350
$Comp
L power:GND #PWR?
U 1 1 60497758
P 3150 2450
AR Path="/60497758" Ref="#PWR?"  Part="1" 
AR Path="/60479334/60497758" Ref="#PWR016"  Part="1" 
F 0 "#PWR016" H 3150 2200 50  0001 C CNN
F 1 "GND" H 3155 2277 50  0000 C CNN
F 2 "" H 3150 2450 50  0001 C CNN
F 3 "" H 3150 2450 50  0001 C CNN
	1    3150 2450
	1    0    0    -1  
$EndComp
Wire Wire Line
	3150 2350 3150 2450
$Comp
L DJetECUTester-rescue:USB_B_Mini-Connector J?
U 1 1 6049775F
P 2450 3200
AR Path="/6049775F" Ref="J?"  Part="1" 
AR Path="/60479334/6049775F" Ref="J3"  Part="1" 
F 0 "J3" H 2507 3667 50  0000 C CNN
F 1 "USB_B_Mini" H 2507 3576 50  0000 C CNN
F 2 "Connector_USB:USB_Mini-B_Wuerth_65100516121_Horizontal" H 2600 3150 50  0001 C CNN
F 3 "~" H 2600 3150 50  0001 C CNN
F 4 "65100516121" H 2450 3200 50  0001 C CNN "manf#"
	1    2450 3200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 60497765
P 2350 3850
AR Path="/60497765" Ref="#PWR?"  Part="1" 
AR Path="/60479334/60497765" Ref="#PWR014"  Part="1" 
F 0 "#PWR014" H 2350 3600 50  0001 C CNN
F 1 "GND" H 2355 3677 50  0000 C CNN
F 2 "" H 2350 3850 50  0001 C CNN
F 3 "" H 2350 3850 50  0001 C CNN
	1    2350 3850
	1    0    0    -1  
$EndComp
$Comp
L power:VBUS #PWR?
U 1 1 6049776F
P 2900 1900
AR Path="/6049776F" Ref="#PWR?"  Part="1" 
AR Path="/60479334/6049776F" Ref="#PWR015"  Part="1" 
F 0 "#PWR015" H 2900 1750 50  0001 C CNN
F 1 "VBUS" H 2915 2073 50  0000 C CNN
F 2 "" H 2900 1900 50  0001 C CNN
F 3 "" H 2900 1900 50  0001 C CNN
	1    2900 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	2750 3000 2900 3000
Wire Wire Line
	3750 2650 3300 2650
Wire Wire Line
	3300 2650 3300 3200
Wire Wire Line
	3300 3200 2750 3200
Wire Wire Line
	3750 2750 3400 2750
Wire Wire Line
	3400 2750 3400 3300
Wire Wire Line
	3400 3300 2750 3300
NoConn ~ 5350 3450
NoConn ~ 5350 3350
Text HLabel 6100 2750 2    50   Output ~ 0
~RESET
Text HLabel 5450 2450 2    50   Input ~ 0
RX
Text HLabel 5450 2350 2    50   Output ~ 0
TX
$Comp
L Device:C C?
U 1 1 6042ECEC
P 1800 3250
AR Path="/6042ECEC" Ref="C?"  Part="1" 
AR Path="/60479334/6042ECEC" Ref="C7"  Part="1" 
F 0 "C7" H 1650 3300 50  0000 C CNN
F 1 "10nF" H 1600 3200 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 1838 3100 50  0001 C CNN
F 3 "~" H 1800 3250 50  0001 C CNN
	1    1800 3250
	-1   0    0    1   
$EndComp
Wire Wire Line
	2350 3600 2350 3700
Wire Wire Line
	2450 3600 2450 3700
Wire Wire Line
	2450 3700 2350 3700
Connection ~ 2350 3700
Wire Wire Line
	2750 3400 2900 3400
$Comp
L Device:Ferrite_Bead FB1
U 1 1 6044A9A1
P 2900 2550
F 0 "FB1" H 3200 2500 50  0000 R CNN
F 1 "MI0805K400R-10" H 3750 2600 50  0000 R CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 2830 2550 50  0001 C CNN
F 3 "~" H 2900 2550 50  0001 C CNN
F 4 "MI0805K400R-10" H 2900 2550 50  0001 C CNN "manf#"
	1    2900 2550
	-1   0    0    1   
$EndComp
Wire Wire Line
	2350 3700 2350 3850
Wire Wire Line
	2900 1900 2900 2200
Wire Wire Line
	2900 2700 2900 3000
Wire Wire Line
	2900 3400 2900 3700
Wire Wire Line
	2900 3700 2450 3700
Connection ~ 2450 3700
$Comp
L power:VBUS #PWR?
U 1 1 60450E37
P 1800 3000
AR Path="/60450E37" Ref="#PWR?"  Part="1" 
AR Path="/60479334/60450E37" Ref="#PWR013"  Part="1" 
F 0 "#PWR013" H 1800 2850 50  0001 C CNN
F 1 "VBUS" H 1815 3173 50  0000 C CNN
F 2 "" H 1800 3000 50  0001 C CNN
F 3 "" H 1800 3000 50  0001 C CNN
	1    1800 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	1800 3000 1800 3100
Wire Wire Line
	2350 3700 1800 3700
Wire Wire Line
	1800 3700 1800 3400
$Comp
L power:PWR_FLAG #FLG02
U 1 1 604E5DA0
P 2900 2200
F 0 "#FLG02" H 2900 2275 50  0001 C CNN
F 1 "PWR_FLAG" V 2900 2327 50  0000 L CNN
F 2 "" H 2900 2200 50  0001 C CNN
F 3 "~" H 2900 2200 50  0001 C CNN
	1    2900 2200
	0    -1   -1   0   
$EndComp
Connection ~ 2900 2200
Wire Wire Line
	2900 2200 2900 2400
$Comp
L power:PWR_FLAG #FLG03
U 1 1 604E7D28
P 8600 3400
F 0 "#FLG03" H 8600 3475 50  0001 C CNN
F 1 "PWR_FLAG" V 8600 3527 50  0000 L CNN
F 2 "" H 8600 3400 50  0001 C CNN
F 3 "~" H 8600 3400 50  0001 C CNN
	1    8600 3400
	0    -1   -1   0   
$EndComp
Connection ~ 8600 3400
Wire Wire Line
	8600 3400 8600 3300
$Comp
L Device:LED D?
U 1 1 60456147
P 7450 3700
AR Path="/60456147" Ref="D?"  Part="1" 
AR Path="/60479334/60456147" Ref="D3"  Part="1" 
F 0 "D3" V 7489 3582 50  0000 R CNN
F 1 "PWR" V 7398 3582 50  0000 R CNN
F 2 "LED_SMD:LED_PLCC-2" H 7450 3700 50  0001 C CNN
F 3 "~" H 7450 3700 50  0001 C CNN
	1    7450 3700
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R?
U 1 1 6045614D
P 7450 4250
AR Path="/6045614D" Ref="R?"  Part="1" 
AR Path="/60479334/6045614D" Ref="R6"  Part="1" 
F 0 "R6" V 7243 4250 50  0000 C CNN
F 1 "1K" V 7334 4250 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 7380 4250 50  0001 C CNN
F 3 "~" H 7450 4250 50  0001 C CNN
	1    7450 4250
	-1   0    0    1   
$EndComp
$Comp
L power:+5V #PWR023
U 1 1 60456153
P 7450 3550
F 0 "#PWR023" H 7450 3400 50  0001 C CNN
F 1 "+5V" H 7465 3723 50  0000 C CNN
F 2 "" H 7450 3550 50  0001 C CNN
F 3 "" H 7450 3550 50  0001 C CNN
	1    7450 3550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 60457673
P 7450 4500
AR Path="/60457673" Ref="#PWR?"  Part="1" 
AR Path="/60479334/60457673" Ref="#PWR024"  Part="1" 
F 0 "#PWR024" H 7450 4250 50  0001 C CNN
F 1 "GND" H 7455 4327 50  0000 C CNN
F 2 "" H 7450 4500 50  0001 C CNN
F 3 "" H 7450 4500 50  0001 C CNN
	1    7450 4500
	1    0    0    -1  
$EndComp
Wire Wire Line
	7450 3850 7450 4100
Wire Wire Line
	7450 4400 7450 4500
$EndSCHEMATC
