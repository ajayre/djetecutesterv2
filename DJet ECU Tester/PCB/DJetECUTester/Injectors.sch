EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 6 6
Title "D-Jetronic ECU Tester"
Date "2022-09-25"
Rev "2.0"
Comp "(C) Britishideas 2021-2022"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Device:R R?
U 1 1 6325E99C
P 1950 1550
AR Path="/604BF505/6325E99C" Ref="R?"  Part="1" 
AR Path="/63357965/6325E99C" Ref="R5"  Part="1" 
F 0 "R5" V 1743 1550 50  0000 C CNN
F 1 "10k" V 1834 1550 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 1880 1550 50  0001 C CNN
F 3 "~" H 1950 1550 50  0001 C CNN
	1    1950 1550
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6325E9A2
P 3150 2100
AR Path="/6325E9A2" Ref="#PWR?"  Part="1" 
AR Path="/604BF505/6325E9A2" Ref="#PWR?"  Part="1" 
AR Path="/63357965/6325E9A2" Ref="#PWR043"  Part="1" 
F 0 "#PWR043" H 3150 1850 50  0001 C CNN
F 1 "GND" H 3155 1927 50  0000 C CNN
F 2 "" H 3150 2100 50  0001 C CNN
F 3 "" H 3150 2100 50  0001 C CNN
	1    3150 2100
	1    0    0    -1  
$EndComp
$Comp
L Transistor_BJT:MMBT3904 Q?
U 1 1 6325E9AA
P 3050 1550
AR Path="/604BF505/6325E9AA" Ref="Q?"  Part="1" 
AR Path="/63357965/6325E9AA" Ref="Q9"  Part="1" 
F 0 "Q9" H 3240 1596 50  0000 L CNN
F 1 "MMBT2222ALT1G" H 2500 1750 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 3250 1475 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N3904.pdf" H 3050 1550 50  0001 L CNN
F 4 "MMBT2222ALT1G" H 3050 1550 50  0001 C CNN "manf#"
	1    3050 1550
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 6325E9B0
P 2750 1800
AR Path="/604BF505/6325E9B0" Ref="R?"  Part="1" 
AR Path="/63357965/6325E9B0" Ref="R28"  Part="1" 
F 0 "R28" H 2600 1800 50  0000 C CNN
F 1 "100k" H 2900 1800 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 2680 1800 50  0001 C CNN
F 3 "~" H 2750 1800 50  0001 C CNN
	1    2750 1800
	1    0    0    -1  
$EndComp
Wire Wire Line
	3150 1250 3150 1350
Wire Wire Line
	3150 1750 3150 2050
Wire Wire Line
	2750 1550 2750 1650
Connection ~ 2750 1550
Wire Wire Line
	2750 1550 2850 1550
Wire Wire Line
	2750 1950 2750 2050
Wire Wire Line
	2750 2050 3150 2050
Connection ~ 3150 2050
Wire Wire Line
	3150 2050 3150 2100
$Comp
L power:+12V #PWR?
U 1 1 632681C2
P 3150 800
AR Path="/632681C2" Ref="#PWR?"  Part="1" 
AR Path="/60479334/632681C2" Ref="#PWR?"  Part="1" 
AR Path="/63357965/632681C2" Ref="#PWR011"  Part="1" 
F 0 "#PWR011" H 3150 650 50  0001 C CNN
F 1 "+12V" H 3165 973 50  0000 C CNN
F 2 "" H 3150 800 50  0001 C CNN
F 3 "" H 3150 800 50  0001 C CNN
	1    3150 800 
	-1   0    0    -1  
$EndComp
$Comp
L Device:D D1
U 1 1 6327008E
P 2350 1550
F 0 "D1" H 2350 1333 50  0000 C CNN
F 1 "MBR0520LT1G" H 2350 1424 50  0000 C CNN
F 2 "Britishideas:SOD-123" H 2350 1550 50  0001 C CNN
F 3 "~" H 2350 1550 50  0001 C CNN
	1    2350 1550
	-1   0    0    1   
$EndComp
Wire Wire Line
	2500 1550 2750 1550
Wire Wire Line
	2200 1550 2100 1550
$Comp
L Device:R R?
U 1 1 63279928
P 3600 1450
AR Path="/604BF505/63279928" Ref="R?"  Part="1" 
AR Path="/63357965/63279928" Ref="R36"  Part="1" 
F 0 "R36" H 3500 1550 50  0000 C CNN
F 1 "10k" H 3484 1450 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 3530 1450 50  0001 C CNN
F 3 "~" H 3600 1450 50  0001 C CNN
	1    3600 1450
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 6327A3A5
P 3600 1850
AR Path="/604BF505/6327A3A5" Ref="R?"  Part="1" 
AR Path="/63357965/6327A3A5" Ref="R37"  Part="1" 
F 0 "R37" H 3500 1950 50  0000 C CNN
F 1 "11k" H 3484 1850 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 3530 1850 50  0001 C CNN
F 3 "~" H 3600 1850 50  0001 C CNN
	1    3600 1850
	1    0    0    -1  
$EndComp
Wire Wire Line
	3600 2000 3600 2050
Wire Wire Line
	3600 2050 3150 2050
Wire Wire Line
	3600 1700 3600 1650
Wire Wire Line
	3600 1300 3600 1250
Wire Wire Line
	3600 1250 3150 1250
Wire Wire Line
	3150 800  3150 900 
$Comp
L Device:R R?
U 1 1 63266305
P 3150 1050
AR Path="/604BF505/63266305" Ref="R?"  Part="1" 
AR Path="/63357965/63266305" Ref="R32"  Part="1" 
F 0 "R32" H 3300 1050 50  0000 C CNN
F 1 "10k" H 3034 1050 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 3080 1050 50  0001 C CNN
F 3 "~" H 3150 1050 50  0001 C CNN
	1    3150 1050
	1    0    0    -1  
$EndComp
Wire Wire Line
	3150 1200 3150 1250
Connection ~ 3150 1250
Wire Wire Line
	3600 1650 3900 1650
Connection ~ 3600 1650
Wire Wire Line
	3600 1650 3600 1600
Text HLabel 1700 1550 0    50   Input ~ 0
ECU_INJGROUP1-3
Wire Wire Line
	1700 1550 1800 1550
Text HLabel 3900 1650 2    50   Output ~ 0
MCU_INJGROUP1-3
$Comp
L Device:R R?
U 1 1 632B3A56
P 1950 6900
AR Path="/604BF505/632B3A56" Ref="R?"  Part="1" 
AR Path="/63357965/632B3A56" Ref="R27"  Part="1" 
F 0 "R27" V 1743 6900 50  0000 C CNN
F 1 "10k" V 1834 6900 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 1880 6900 50  0001 C CNN
F 3 "~" H 1950 6900 50  0001 C CNN
	1    1950 6900
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 632B3DC4
P 3150 7450
AR Path="/632B3DC4" Ref="#PWR?"  Part="1" 
AR Path="/604BF505/632B3DC4" Ref="#PWR?"  Part="1" 
AR Path="/63357965/632B3DC4" Ref="#PWR050"  Part="1" 
F 0 "#PWR050" H 3150 7200 50  0001 C CNN
F 1 "GND" H 3155 7277 50  0000 C CNN
F 2 "" H 3150 7450 50  0001 C CNN
F 3 "" H 3150 7450 50  0001 C CNN
	1    3150 7450
	1    0    0    -1  
$EndComp
$Comp
L Transistor_BJT:MMBT3904 Q?
U 1 1 632B3DCF
P 3050 6900
AR Path="/604BF505/632B3DCF" Ref="Q?"  Part="1" 
AR Path="/63357965/632B3DCF" Ref="Q12"  Part="1" 
F 0 "Q12" H 3240 6946 50  0000 L CNN
F 1 "MMBT2222ALT1G" H 2500 7100 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 3250 6825 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N3904.pdf" H 3050 6900 50  0001 L CNN
F 4 "MMBT2222ALT1G" H 3050 6900 50  0001 C CNN "manf#"
	1    3050 6900
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 632B3DD9
P 2750 7150
AR Path="/604BF505/632B3DD9" Ref="R?"  Part="1" 
AR Path="/63357965/632B3DD9" Ref="R31"  Part="1" 
F 0 "R31" H 2600 7150 50  0000 C CNN
F 1 "100k" H 2900 7150 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 2680 7150 50  0001 C CNN
F 3 "~" H 2750 7150 50  0001 C CNN
	1    2750 7150
	1    0    0    -1  
$EndComp
Wire Wire Line
	3150 6600 3150 6700
Wire Wire Line
	3150 7100 3150 7400
Wire Wire Line
	2750 6900 2750 7000
Connection ~ 2750 6900
Wire Wire Line
	2750 6900 2850 6900
Wire Wire Line
	2750 7300 2750 7400
Wire Wire Line
	2750 7400 3150 7400
Connection ~ 3150 7400
Wire Wire Line
	3150 7400 3150 7450
$Comp
L power:+12V #PWR?
U 1 1 632B3DEC
P 3150 6150
AR Path="/632B3DEC" Ref="#PWR?"  Part="1" 
AR Path="/60479334/632B3DEC" Ref="#PWR?"  Part="1" 
AR Path="/63357965/632B3DEC" Ref="#PWR049"  Part="1" 
F 0 "#PWR049" H 3150 6000 50  0001 C CNN
F 1 "+12V" H 3165 6323 50  0000 C CNN
F 2 "" H 3150 6150 50  0001 C CNN
F 3 "" H 3150 6150 50  0001 C CNN
	1    3150 6150
	-1   0    0    -1  
$EndComp
$Comp
L Device:D D7
U 1 1 632B3DF6
P 2350 6900
F 0 "D7" H 2350 6683 50  0000 C CNN
F 1 "MBR0520LT1G" H 2350 6774 50  0000 C CNN
F 2 "Britishideas:SOD-123" H 2350 6900 50  0001 C CNN
F 3 "~" H 2350 6900 50  0001 C CNN
	1    2350 6900
	-1   0    0    1   
$EndComp
Wire Wire Line
	2500 6900 2750 6900
Wire Wire Line
	2200 6900 2100 6900
$Comp
L Device:R R?
U 1 1 632B3E02
P 3600 6800
AR Path="/604BF505/632B3E02" Ref="R?"  Part="1" 
AR Path="/63357965/632B3E02" Ref="R42"  Part="1" 
F 0 "R42" H 3500 6900 50  0000 C CNN
F 1 "10k" H 3484 6800 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 3530 6800 50  0001 C CNN
F 3 "~" H 3600 6800 50  0001 C CNN
	1    3600 6800
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 632B3E0C
P 3600 7200
AR Path="/604BF505/632B3E0C" Ref="R?"  Part="1" 
AR Path="/63357965/632B3E0C" Ref="R43"  Part="1" 
F 0 "R43" H 3500 7300 50  0000 C CNN
F 1 "11k" H 3484 7200 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 3530 7200 50  0001 C CNN
F 3 "~" H 3600 7200 50  0001 C CNN
	1    3600 7200
	1    0    0    -1  
$EndComp
Wire Wire Line
	3600 7350 3600 7400
Wire Wire Line
	3600 7400 3150 7400
Wire Wire Line
	3600 7050 3600 7000
Wire Wire Line
	3600 6650 3600 6600
Wire Wire Line
	3600 6600 3150 6600
Wire Wire Line
	3150 6150 3150 6250
$Comp
L Device:R R?
U 1 1 632B3E1C
P 3150 6400
AR Path="/604BF505/632B3E1C" Ref="R?"  Part="1" 
AR Path="/63357965/632B3E1C" Ref="R35"  Part="1" 
F 0 "R35" H 3300 6400 50  0000 C CNN
F 1 "10k" H 3034 6400 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 3080 6400 50  0001 C CNN
F 3 "~" H 3150 6400 50  0001 C CNN
	1    3150 6400
	1    0    0    -1  
$EndComp
Wire Wire Line
	3150 6550 3150 6600
Connection ~ 3150 6600
Wire Wire Line
	3600 7000 3900 7000
Connection ~ 3600 7000
Wire Wire Line
	3600 7000 3600 6950
Wire Wire Line
	1700 6900 1800 6900
Text HLabel 3900 7000 2    50   Output ~ 0
MCU_INJGROUP3-5
$Comp
L Device:R R?
U 1 1 632C09B8
P 1950 3350
AR Path="/604BF505/632C09B8" Ref="R?"  Part="1" 
AR Path="/63357965/632C09B8" Ref="R25"  Part="1" 
F 0 "R25" V 1743 3350 50  0000 C CNN
F 1 "10k" V 1834 3350 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 1880 3350 50  0001 C CNN
F 3 "~" H 1950 3350 50  0001 C CNN
	1    1950 3350
	0    1    1    0   
$EndComp
$Comp
L Transistor_BJT:MMBT3904 Q?
U 1 1 632C0DDD
P 3050 3350
AR Path="/604BF505/632C0DDD" Ref="Q?"  Part="1" 
AR Path="/63357965/632C0DDD" Ref="Q10"  Part="1" 
F 0 "Q10" H 3240 3396 50  0000 L CNN
F 1 "MMBT2222ALT1G" H 2500 3550 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 3250 3275 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N3904.pdf" H 3050 3350 50  0001 L CNN
F 4 "MMBT2222ALT1G" H 3050 3350 50  0001 C CNN "manf#"
	1    3050 3350
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 632C0DE7
P 2750 3600
AR Path="/604BF505/632C0DE7" Ref="R?"  Part="1" 
AR Path="/63357965/632C0DE7" Ref="R29"  Part="1" 
F 0 "R29" H 2600 3600 50  0000 C CNN
F 1 "100k" H 2900 3600 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 2680 3600 50  0001 C CNN
F 3 "~" H 2750 3600 50  0001 C CNN
	1    2750 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	3150 3050 3150 3150
Wire Wire Line
	3150 3550 3150 3850
Wire Wire Line
	2750 3350 2750 3450
Connection ~ 2750 3350
Wire Wire Line
	2750 3350 2850 3350
Wire Wire Line
	2750 3750 2750 3850
Wire Wire Line
	2750 3850 3150 3850
Connection ~ 3150 3850
Wire Wire Line
	3150 3850 3150 3900
$Comp
L power:+12V #PWR?
U 1 1 632C0DFA
P 3150 2600
AR Path="/632C0DFA" Ref="#PWR?"  Part="1" 
AR Path="/60479334/632C0DFA" Ref="#PWR?"  Part="1" 
AR Path="/63357965/632C0DFA" Ref="#PWR044"  Part="1" 
F 0 "#PWR044" H 3150 2450 50  0001 C CNN
F 1 "+12V" H 3165 2773 50  0000 C CNN
F 2 "" H 3150 2600 50  0001 C CNN
F 3 "" H 3150 2600 50  0001 C CNN
	1    3150 2600
	-1   0    0    -1  
$EndComp
$Comp
L Device:D D5
U 1 1 632C0E04
P 2350 3350
F 0 "D5" H 2350 3133 50  0000 C CNN
F 1 "MBR0520LT1G" H 2350 3224 50  0000 C CNN
F 2 "Britishideas:SOD-123" H 2350 3350 50  0001 C CNN
F 3 "~" H 2350 3350 50  0001 C CNN
	1    2350 3350
	-1   0    0    1   
$EndComp
Wire Wire Line
	2500 3350 2750 3350
Wire Wire Line
	2200 3350 2100 3350
$Comp
L Device:R R?
U 1 1 632C0E10
P 3600 3250
AR Path="/604BF505/632C0E10" Ref="R?"  Part="1" 
AR Path="/63357965/632C0E10" Ref="R38"  Part="1" 
F 0 "R38" H 3500 3350 50  0000 C CNN
F 1 "10k" H 3484 3250 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 3530 3250 50  0001 C CNN
F 3 "~" H 3600 3250 50  0001 C CNN
	1    3600 3250
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 632C0E1A
P 3600 3650
AR Path="/604BF505/632C0E1A" Ref="R?"  Part="1" 
AR Path="/63357965/632C0E1A" Ref="R39"  Part="1" 
F 0 "R39" H 3500 3750 50  0000 C CNN
F 1 "11k" H 3484 3650 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 3530 3650 50  0001 C CNN
F 3 "~" H 3600 3650 50  0001 C CNN
	1    3600 3650
	1    0    0    -1  
$EndComp
Wire Wire Line
	3600 3800 3600 3850
Wire Wire Line
	3600 3850 3150 3850
Wire Wire Line
	3600 3500 3600 3450
Wire Wire Line
	3600 3100 3600 3050
Wire Wire Line
	3600 3050 3150 3050
Wire Wire Line
	3150 2600 3150 2700
$Comp
L Device:R R?
U 1 1 632C0E2A
P 3150 2850
AR Path="/604BF505/632C0E2A" Ref="R?"  Part="1" 
AR Path="/63357965/632C0E2A" Ref="R33"  Part="1" 
F 0 "R33" H 3300 2850 50  0000 C CNN
F 1 "10k" H 3034 2850 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 3080 2850 50  0001 C CNN
F 3 "~" H 3150 2850 50  0001 C CNN
	1    3150 2850
	1    0    0    -1  
$EndComp
Wire Wire Line
	3150 3000 3150 3050
Connection ~ 3150 3050
Wire Wire Line
	3600 3450 3900 3450
Connection ~ 3600 3450
Wire Wire Line
	3600 3450 3600 3400
Wire Wire Line
	1700 3350 1800 3350
Text HLabel 3900 3450 2    50   Output ~ 0
MCU_INJGROUP2-4
$Comp
L Device:R R?
U 1 1 632CDE73
P 1950 5100
AR Path="/604BF505/632CDE73" Ref="R?"  Part="1" 
AR Path="/63357965/632CDE73" Ref="R26"  Part="1" 
F 0 "R26" V 1743 5100 50  0000 C CNN
F 1 "10k" V 1834 5100 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 1880 5100 50  0001 C CNN
F 3 "~" H 1950 5100 50  0001 C CNN
	1    1950 5100
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 632CE339
P 3150 5650
AR Path="/632CE339" Ref="#PWR?"  Part="1" 
AR Path="/604BF505/632CE339" Ref="#PWR?"  Part="1" 
AR Path="/63357965/632CE339" Ref="#PWR047"  Part="1" 
F 0 "#PWR047" H 3150 5400 50  0001 C CNN
F 1 "GND" H 3155 5477 50  0000 C CNN
F 2 "" H 3150 5650 50  0001 C CNN
F 3 "" H 3150 5650 50  0001 C CNN
	1    3150 5650
	1    0    0    -1  
$EndComp
$Comp
L Transistor_BJT:MMBT3904 Q?
U 1 1 632CE344
P 3050 5100
AR Path="/604BF505/632CE344" Ref="Q?"  Part="1" 
AR Path="/63357965/632CE344" Ref="Q11"  Part="1" 
F 0 "Q11" H 3240 5146 50  0000 L CNN
F 1 "MMBT2222ALT1G" H 2500 5300 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 3250 5025 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N3904.pdf" H 3050 5100 50  0001 L CNN
F 4 "MMBT2222ALT1G" H 3050 5100 50  0001 C CNN "manf#"
	1    3050 5100
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 632CE34E
P 2750 5350
AR Path="/604BF505/632CE34E" Ref="R?"  Part="1" 
AR Path="/63357965/632CE34E" Ref="R30"  Part="1" 
F 0 "R30" H 2600 5350 50  0000 C CNN
F 1 "100k" H 2900 5350 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 2680 5350 50  0001 C CNN
F 3 "~" H 2750 5350 50  0001 C CNN
	1    2750 5350
	1    0    0    -1  
$EndComp
Wire Wire Line
	3150 4800 3150 4900
Wire Wire Line
	3150 5300 3150 5600
Wire Wire Line
	2750 5100 2750 5200
Connection ~ 2750 5100
Wire Wire Line
	2750 5100 2850 5100
Wire Wire Line
	2750 5500 2750 5600
Wire Wire Line
	2750 5600 3150 5600
Connection ~ 3150 5600
Wire Wire Line
	3150 5600 3150 5650
$Comp
L power:+12V #PWR?
U 1 1 632CE361
P 3150 4350
AR Path="/632CE361" Ref="#PWR?"  Part="1" 
AR Path="/60479334/632CE361" Ref="#PWR?"  Part="1" 
AR Path="/63357965/632CE361" Ref="#PWR046"  Part="1" 
F 0 "#PWR046" H 3150 4200 50  0001 C CNN
F 1 "+12V" H 3165 4523 50  0000 C CNN
F 2 "" H 3150 4350 50  0001 C CNN
F 3 "" H 3150 4350 50  0001 C CNN
	1    3150 4350
	-1   0    0    -1  
$EndComp
$Comp
L Device:D D6
U 1 1 632CE36B
P 2350 5100
F 0 "D6" H 2350 4883 50  0000 C CNN
F 1 "MBR0520LT1G" H 2350 4974 50  0000 C CNN
F 2 "Britishideas:SOD-123" H 2350 5100 50  0001 C CNN
F 3 "~" H 2350 5100 50  0001 C CNN
	1    2350 5100
	-1   0    0    1   
$EndComp
Wire Wire Line
	2500 5100 2750 5100
Wire Wire Line
	2200 5100 2100 5100
$Comp
L Device:R R?
U 1 1 632CE377
P 3600 5000
AR Path="/604BF505/632CE377" Ref="R?"  Part="1" 
AR Path="/63357965/632CE377" Ref="R40"  Part="1" 
F 0 "R40" H 3500 5100 50  0000 C CNN
F 1 "10k" H 3484 5000 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 3530 5000 50  0001 C CNN
F 3 "~" H 3600 5000 50  0001 C CNN
	1    3600 5000
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 632CE381
P 3600 5400
AR Path="/604BF505/632CE381" Ref="R?"  Part="1" 
AR Path="/63357965/632CE381" Ref="R41"  Part="1" 
F 0 "R41" H 3500 5500 50  0000 C CNN
F 1 "11k" H 3484 5400 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 3530 5400 50  0001 C CNN
F 3 "~" H 3600 5400 50  0001 C CNN
	1    3600 5400
	1    0    0    -1  
$EndComp
Wire Wire Line
	3600 5550 3600 5600
Wire Wire Line
	3600 5600 3150 5600
Wire Wire Line
	3600 5250 3600 5200
Wire Wire Line
	3600 4850 3600 4800
Wire Wire Line
	3600 4800 3150 4800
Wire Wire Line
	3150 4350 3150 4450
$Comp
L Device:R R?
U 1 1 632CE391
P 3150 4600
AR Path="/604BF505/632CE391" Ref="R?"  Part="1" 
AR Path="/63357965/632CE391" Ref="R34"  Part="1" 
F 0 "R34" H 3300 4600 50  0000 C CNN
F 1 "10k" H 3034 4600 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 3080 4600 50  0001 C CNN
F 3 "~" H 3150 4600 50  0001 C CNN
	1    3150 4600
	1    0    0    -1  
$EndComp
Wire Wire Line
	3150 4750 3150 4800
Connection ~ 3150 4800
Wire Wire Line
	3600 5200 3900 5200
Connection ~ 3600 5200
Wire Wire Line
	3600 5200 3600 5150
Wire Wire Line
	1700 5100 1800 5100
Text HLabel 3900 5200 2    50   Output ~ 0
MCU_INJGROUP4-6
Text HLabel 1700 3350 0    50   Input ~ 0
ECU_INJGROUP2-4
Text HLabel 1700 6900 0    50   Input ~ 0
ECU_INJGROUP3-5
Text HLabel 1700 5100 0    50   Input ~ 0
ECU_INJGROUP4-6
Text Notes 2100 1750 0    50   ~ 0
BV >= 25V
Text Notes 2050 3550 0    50   ~ 0
BV >= 25V
Text Notes 2100 5300 0    50   ~ 0
BV >= 25V
Text Notes 2100 7100 0    50   ~ 0
BV >= 25V
$Comp
L power:GND #PWR?
U 1 1 6333B2D2
P 3150 3900
AR Path="/6333B2D2" Ref="#PWR?"  Part="1" 
AR Path="/604BF505/6333B2D2" Ref="#PWR?"  Part="1" 
AR Path="/63357965/6333B2D2" Ref="#PWR045"  Part="1" 
F 0 "#PWR045" H 3150 3650 50  0001 C CNN
F 1 "GND" H 3155 3727 50  0000 C CNN
F 2 "" H 3150 3900 50  0001 C CNN
F 3 "" H 3150 3900 50  0001 C CNN
	1    3150 3900
	1    0    0    -1  
$EndComp
Text HLabel 6550 2900 1    50   Input ~ 0
ECU_INJGROUP1-3
$Comp
L Device:L L2
U 1 1 63348A41
P 6550 3250
F 0 "L2" H 6602 3296 50  0000 L CNN
F 1 "680uH" H 6602 3205 50  0000 L CNN
F 2 "Britishideas:Inductor-MSS1210-684KED" H 6550 3250 50  0001 C CNN
F 3 "~" H 6550 3250 50  0001 C CNN
F 4 "MSS1210-684KED" H 6550 3250 50  0001 C CNN "manf#"
	1    6550 3250
	1    0    0    -1  
$EndComp
$Comp
L Device:L L3
U 1 1 633498BF
P 6550 3650
F 0 "L3" H 6602 3696 50  0000 L CNN
F 1 "680uH" H 6602 3605 50  0000 L CNN
F 2 "Britishideas:Inductor-MSS1210-684KED" H 6550 3650 50  0001 C CNN
F 3 "~" H 6550 3650 50  0001 C CNN
F 4 "MSS1210-684KED" H 6550 3650 50  0001 C CNN "manf#"
	1    6550 3650
	1    0    0    -1  
$EndComp
$Comp
L Device:L L4
U 1 1 63349F68
P 6550 4050
F 0 "L4" H 6602 4096 50  0000 L CNN
F 1 "680uH" H 6602 4005 50  0000 L CNN
F 2 "Britishideas:Inductor-MSS1210-684KED" H 6550 4050 50  0001 C CNN
F 3 "~" H 6550 4050 50  0001 C CNN
F 4 "MSS1210-684KED" H 6550 4050 50  0001 C CNN "manf#"
	1    6550 4050
	1    0    0    -1  
$EndComp
$Comp
L Device:L L5
U 1 1 6334A31B
P 6550 4450
F 0 "L5" H 6602 4496 50  0000 L CNN
F 1 "680uH" H 6602 4405 50  0000 L CNN
F 2 "Britishideas:Inductor-MSS1210-684KED" H 6550 4450 50  0001 C CNN
F 3 "~" H 6550 4450 50  0001 C CNN
F 4 "MSS1210-684KED" H 6550 4450 50  0001 C CNN "manf#"
	1    6550 4450
	1    0    0    -1  
$EndComp
Wire Wire Line
	6550 2900 6550 3000
Wire Wire Line
	6550 3400 6550 3500
Wire Wire Line
	6550 3800 6550 3900
Wire Wire Line
	6550 4200 6550 4300
$Comp
L power:GND #PWR?
U 1 1 63351921
P 6550 4800
AR Path="/63351921" Ref="#PWR?"  Part="1" 
AR Path="/604BF505/63351921" Ref="#PWR?"  Part="1" 
AR Path="/63357965/63351921" Ref="#PWR051"  Part="1" 
F 0 "#PWR051" H 6550 4550 50  0001 C CNN
F 1 "GND" H 6555 4627 50  0000 C CNN
F 2 "" H 6550 4800 50  0001 C CNN
F 3 "" H 6550 4800 50  0001 C CNN
	1    6550 4800
	1    0    0    -1  
$EndComp
Wire Wire Line
	6550 4800 6550 4700
$Comp
L Device:R_POT R46
U 1 1 63354298
P 7050 4450
F 0 "R46" H 6980 4496 50  0000 R CNN
F 1 "50" H 6980 4405 50  0000 R CNN
F 2 "Britishideas:Potentometer_Bourns_PV36W" V 6980 4450 50  0001 C CNN
F 3 "~" H 7050 4450 50  0001 C CNN
F 4 "PV36W500C01B00" H 7050 4450 50  0001 C CNN "manf#"
	1    7050 4450
	-1   0    0    -1  
$EndComp
Connection ~ 6550 4700
Wire Wire Line
	6550 4700 6550 4600
Wire Wire Line
	7050 4300 7050 3000
Connection ~ 6550 3000
Wire Wire Line
	6550 3000 6550 3100
$Comp
L Device:L L6
U 1 1 6335B656
P 7350 3250
F 0 "L6" H 7402 3296 50  0000 L CNN
F 1 "680uH" H 7402 3205 50  0000 L CNN
F 2 "Britishideas:Inductor-MSS1210-684KED" H 7350 3250 50  0001 C CNN
F 3 "~" H 7350 3250 50  0001 C CNN
F 4 "MSS1210-684KED" H 7350 3250 50  0001 C CNN "manf#"
	1    7350 3250
	1    0    0    -1  
$EndComp
$Comp
L Device:L L7
U 1 1 6335B661
P 7350 3650
F 0 "L7" H 7402 3696 50  0000 L CNN
F 1 "680uH" H 7402 3605 50  0000 L CNN
F 2 "Britishideas:Inductor-MSS1210-684KED" H 7350 3650 50  0001 C CNN
F 3 "~" H 7350 3650 50  0001 C CNN
F 4 "MSS1210-684KED" H 7350 3650 50  0001 C CNN "manf#"
	1    7350 3650
	1    0    0    -1  
$EndComp
$Comp
L Device:L L8
U 1 1 6335B66C
P 7350 4050
F 0 "L8" H 7402 4096 50  0000 L CNN
F 1 "680uH" H 7402 4005 50  0000 L CNN
F 2 "Britishideas:Inductor-MSS1210-684KED" H 7350 4050 50  0001 C CNN
F 3 "~" H 7350 4050 50  0001 C CNN
F 4 "MSS1210-684KED" H 7350 4050 50  0001 C CNN "manf#"
	1    7350 4050
	1    0    0    -1  
$EndComp
$Comp
L Device:L L9
U 1 1 6335B677
P 7350 4450
F 0 "L9" H 7402 4496 50  0000 L CNN
F 1 "680uH" H 7402 4405 50  0000 L CNN
F 2 "Britishideas:Inductor-MSS1210-684KED" H 7350 4450 50  0001 C CNN
F 3 "~" H 7350 4450 50  0001 C CNN
F 4 "MSS1210-684KED" H 7350 4450 50  0001 C CNN "manf#"
	1    7350 4450
	1    0    0    -1  
$EndComp
Wire Wire Line
	7350 2900 7350 3000
Wire Wire Line
	7350 3400 7350 3500
Wire Wire Line
	7350 3800 7350 3900
Wire Wire Line
	7350 4200 7350 4300
$Comp
L power:GND #PWR?
U 1 1 6335B685
P 7350 4800
AR Path="/6335B685" Ref="#PWR?"  Part="1" 
AR Path="/604BF505/6335B685" Ref="#PWR?"  Part="1" 
AR Path="/63357965/6335B685" Ref="#PWR052"  Part="1" 
F 0 "#PWR052" H 7350 4550 50  0001 C CNN
F 1 "GND" H 7355 4627 50  0000 C CNN
F 2 "" H 7350 4800 50  0001 C CNN
F 3 "" H 7350 4800 50  0001 C CNN
	1    7350 4800
	1    0    0    -1  
$EndComp
Wire Wire Line
	7350 4800 7350 4700
$Comp
L Device:R_POT R47
U 1 1 6335B691
P 7850 4450
F 0 "R47" H 7780 4496 50  0000 R CNN
F 1 "50" H 7780 4405 50  0000 R CNN
F 2 "Britishideas:Potentometer_Bourns_PV36W" V 7780 4450 50  0001 C CNN
F 3 "~" H 7850 4450 50  0001 C CNN
F 4 "PV36W500C01B00" H 7850 4450 50  0001 C CNN "manf#"
	1    7850 4450
	-1   0    0    -1  
$EndComp
Connection ~ 7350 4700
Wire Wire Line
	7350 4700 7350 4600
Wire Wire Line
	7850 4300 7850 3000
Wire Wire Line
	7850 3000 7350 3000
Connection ~ 7350 3000
Wire Wire Line
	7350 3000 7350 3100
$Comp
L Device:L L10
U 1 1 633602B3
P 8150 3250
F 0 "L10" H 8202 3296 50  0000 L CNN
F 1 "680uH" H 8202 3205 50  0000 L CNN
F 2 "Britishideas:Inductor-MSS1210-684KED" H 8150 3250 50  0001 C CNN
F 3 "~" H 8150 3250 50  0001 C CNN
F 4 "MSS1210-684KED" H 8150 3250 50  0001 C CNN "manf#"
	1    8150 3250
	1    0    0    -1  
$EndComp
$Comp
L Device:L L11
U 1 1 633602BE
P 8150 3650
F 0 "L11" H 8202 3696 50  0000 L CNN
F 1 "680uH" H 8202 3605 50  0000 L CNN
F 2 "Britishideas:Inductor-MSS1210-684KED" H 8150 3650 50  0001 C CNN
F 3 "~" H 8150 3650 50  0001 C CNN
F 4 "MSS1210-684KED" H 8150 3650 50  0001 C CNN "manf#"
	1    8150 3650
	1    0    0    -1  
$EndComp
$Comp
L Device:L L12
U 1 1 633602C9
P 8150 4050
F 0 "L12" H 8202 4096 50  0000 L CNN
F 1 "680uH" H 8202 4005 50  0000 L CNN
F 2 "Britishideas:Inductor-MSS1210-684KED" H 8150 4050 50  0001 C CNN
F 3 "~" H 8150 4050 50  0001 C CNN
F 4 "MSS1210-684KED" H 8150 4050 50  0001 C CNN "manf#"
	1    8150 4050
	1    0    0    -1  
$EndComp
$Comp
L Device:L L13
U 1 1 633602D4
P 8150 4450
F 0 "L13" H 8202 4496 50  0000 L CNN
F 1 "680uH" H 8202 4405 50  0000 L CNN
F 2 "Britishideas:Inductor-MSS1210-684KED" H 8150 4450 50  0001 C CNN
F 3 "~" H 8150 4450 50  0001 C CNN
F 4 "MSS1210-684KED" H 8150 4450 50  0001 C CNN "manf#"
	1    8150 4450
	1    0    0    -1  
$EndComp
Wire Wire Line
	8150 2900 8150 3000
Wire Wire Line
	8150 3400 8150 3500
Wire Wire Line
	8150 3800 8150 3900
Wire Wire Line
	8150 4200 8150 4300
$Comp
L power:GND #PWR?
U 1 1 633602E2
P 8150 4800
AR Path="/633602E2" Ref="#PWR?"  Part="1" 
AR Path="/604BF505/633602E2" Ref="#PWR?"  Part="1" 
AR Path="/63357965/633602E2" Ref="#PWR072"  Part="1" 
F 0 "#PWR072" H 8150 4550 50  0001 C CNN
F 1 "GND" H 8155 4627 50  0000 C CNN
F 2 "" H 8150 4800 50  0001 C CNN
F 3 "" H 8150 4800 50  0001 C CNN
	1    8150 4800
	1    0    0    -1  
$EndComp
Wire Wire Line
	8150 4800 8150 4700
$Comp
L Device:R_POT R50
U 1 1 633602EE
P 8650 4450
F 0 "R50" H 8580 4496 50  0000 R CNN
F 1 "50" H 8580 4405 50  0000 R CNN
F 2 "Britishideas:Potentometer_Bourns_PV36W" V 8580 4450 50  0001 C CNN
F 3 "~" H 8650 4450 50  0001 C CNN
F 4 "PV36W500C01B00" H 8650 4450 50  0001 C CNN "manf#"
	1    8650 4450
	-1   0    0    -1  
$EndComp
Connection ~ 8150 4700
Wire Wire Line
	8150 4700 8150 4600
Wire Wire Line
	8650 4300 8650 3000
Wire Wire Line
	8650 3000 8150 3000
Connection ~ 8150 3000
Wire Wire Line
	8150 3000 8150 3100
$Comp
L Device:L L14
U 1 1 63360302
P 8950 3250
F 0 "L14" H 9002 3296 50  0000 L CNN
F 1 "680uH" H 9002 3205 50  0000 L CNN
F 2 "Britishideas:Inductor-MSS1210-684KED" H 8950 3250 50  0001 C CNN
F 3 "~" H 8950 3250 50  0001 C CNN
F 4 "MSS1210-684KED" H 8950 3250 50  0001 C CNN "manf#"
	1    8950 3250
	1    0    0    -1  
$EndComp
$Comp
L Device:L L15
U 1 1 6336030D
P 8950 3650
F 0 "L15" H 9002 3696 50  0000 L CNN
F 1 "680uH" H 9002 3605 50  0000 L CNN
F 2 "Britishideas:Inductor-MSS1210-684KED" H 8950 3650 50  0001 C CNN
F 3 "~" H 8950 3650 50  0001 C CNN
F 4 "MSS1210-684KED" H 8950 3650 50  0001 C CNN "manf#"
	1    8950 3650
	1    0    0    -1  
$EndComp
$Comp
L Device:L L16
U 1 1 63360318
P 8950 4050
F 0 "L16" H 9002 4096 50  0000 L CNN
F 1 "680uH" H 9002 4005 50  0000 L CNN
F 2 "Britishideas:Inductor-MSS1210-684KED" H 8950 4050 50  0001 C CNN
F 3 "~" H 8950 4050 50  0001 C CNN
F 4 "MSS1210-684KED" H 8950 4050 50  0001 C CNN "manf#"
	1    8950 4050
	1    0    0    -1  
$EndComp
$Comp
L Device:L L17
U 1 1 63360323
P 8950 4450
F 0 "L17" H 9002 4496 50  0000 L CNN
F 1 "680uH" H 9002 4405 50  0000 L CNN
F 2 "Britishideas:Inductor-MSS1210-684KED" H 8950 4450 50  0001 C CNN
F 3 "~" H 8950 4450 50  0001 C CNN
F 4 "MSS1210-684KED" H 8950 4450 50  0001 C CNN "manf#"
	1    8950 4450
	1    0    0    -1  
$EndComp
Wire Wire Line
	8950 2900 8950 3000
Wire Wire Line
	8950 3400 8950 3500
Wire Wire Line
	8950 3800 8950 3900
Wire Wire Line
	8950 4200 8950 4300
$Comp
L power:GND #PWR?
U 1 1 63360331
P 8950 4800
AR Path="/63360331" Ref="#PWR?"  Part="1" 
AR Path="/604BF505/63360331" Ref="#PWR?"  Part="1" 
AR Path="/63357965/63360331" Ref="#PWR073"  Part="1" 
F 0 "#PWR073" H 8950 4550 50  0001 C CNN
F 1 "GND" H 8955 4627 50  0000 C CNN
F 2 "" H 8950 4800 50  0001 C CNN
F 3 "" H 8950 4800 50  0001 C CNN
	1    8950 4800
	1    0    0    -1  
$EndComp
Wire Wire Line
	8950 4800 8950 4700
$Comp
L Device:R_POT R51
U 1 1 6336033D
P 9450 4450
F 0 "R51" H 9380 4496 50  0000 R CNN
F 1 "50" H 9380 4405 50  0000 R CNN
F 2 "Britishideas:Potentometer_Bourns_PV36W" V 9380 4450 50  0001 C CNN
F 3 "~" H 9450 4450 50  0001 C CNN
F 4 "PV36W500C01B00" H 9450 4450 50  0001 C CNN "manf#"
	1    9450 4450
	-1   0    0    -1  
$EndComp
Connection ~ 8950 4700
Wire Wire Line
	8950 4700 8950 4600
Wire Wire Line
	9450 4300 9450 3000
Wire Wire Line
	9450 3000 8950 3000
Connection ~ 8950 3000
Wire Wire Line
	8950 3000 8950 3100
Text HLabel 7350 2900 1    50   Output ~ 0
ECU_INJGROUP2-4
Text HLabel 8150 2900 1    50   Output ~ 0
ECU_INJGROUP4-6
Text HLabel 8950 2900 1    50   Output ~ 0
ECU_INJGROUP3-5
NoConn ~ 9450 4600
NoConn ~ 8650 4600
NoConn ~ 7850 4600
NoConn ~ 7050 4600
Wire Wire Line
	6900 4450 6850 4450
Wire Wire Line
	6850 4450 6850 4700
Wire Wire Line
	6850 4700 6550 4700
Wire Wire Line
	7700 4450 7650 4450
Wire Wire Line
	7650 4450 7650 4700
Wire Wire Line
	7650 4700 7350 4700
Wire Wire Line
	8500 4450 8450 4450
Wire Wire Line
	8450 4450 8450 4700
Wire Wire Line
	8450 4700 8150 4700
Wire Wire Line
	9300 4450 9250 4450
Wire Wire Line
	9250 4450 9250 4700
Wire Wire Line
	9250 4700 8950 4700
$Comp
L Connector:TestPoint TP12
U 1 1 63338C46
P 7050 2900
F 0 "TP12" H 7108 2972 50  0000 L CNN
F 1 "TestPoint" H 7108 2927 50  0001 L CNN
F 2 "TestPoint:TestPoint_Pad_D2.0mm" H 7250 2900 50  0001 C CNN
F 3 "~" H 7250 2900 50  0001 C CNN
	1    7050 2900
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint TP13
U 1 1 6333D927
P 7850 2900
F 0 "TP13" H 7908 2972 50  0000 L CNN
F 1 "TestPoint" H 7908 2927 50  0001 L CNN
F 2 "TestPoint:TestPoint_Pad_D2.0mm" H 8050 2900 50  0001 C CNN
F 3 "~" H 8050 2900 50  0001 C CNN
	1    7850 2900
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint TP14
U 1 1 6333E0A1
P 8650 2900
F 0 "TP14" H 8708 2972 50  0000 L CNN
F 1 "TestPoint" H 8708 2927 50  0001 L CNN
F 2 "TestPoint:TestPoint_Pad_D2.0mm" H 8850 2900 50  0001 C CNN
F 3 "~" H 8850 2900 50  0001 C CNN
	1    8650 2900
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint TP15
U 1 1 6333E527
P 9450 2900
F 0 "TP15" H 9508 2972 50  0000 L CNN
F 1 "TestPoint" H 9508 2927 50  0001 L CNN
F 2 "TestPoint:TestPoint_Pad_D2.0mm" H 9650 2900 50  0001 C CNN
F 3 "~" H 9650 2900 50  0001 C CNN
	1    9450 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	6550 3000 7050 3000
Wire Wire Line
	7050 2900 7050 3000
Connection ~ 7050 3000
Wire Wire Line
	7850 2900 7850 3000
Connection ~ 7850 3000
Wire Wire Line
	8650 2900 8650 3000
Connection ~ 8650 3000
Wire Wire Line
	9450 2900 9450 3000
Connection ~ 9450 3000
$Comp
L Connector:TestPoint TP16
U 1 1 6335A45A
P 6450 4700
F 0 "TP16" V 6553 4772 50  0000 C CNN
F 1 "TestPoint" H 6508 4727 50  0001 L CNN
F 2 "TestPoint:TestPoint_Pad_D2.0mm" H 6650 4700 50  0001 C CNN
F 3 "~" H 6650 4700 50  0001 C CNN
	1    6450 4700
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6450 4700 6550 4700
$EndSCHEMATC
