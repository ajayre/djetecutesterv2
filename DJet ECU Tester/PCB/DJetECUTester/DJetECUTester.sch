EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 6
Title "D-Jetronic ECU Tester"
Date "2022-09-17"
Rev "2.0"
Comp "(C) Britishideas 2021-2022"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L BritishIdeas:ATmega328P U1
U 1 1 5FE91942
P 3000 3400
F 0 "U1" H 3050 3350 50  0000 C CNN
F 1 "ATmega328P" H 4200 3350 50  0000 C CNN
F 2 "Package_QFP:LQFP-32_7x7mm_P0.8mm" H 1750 2700 50  0001 C CNN
F 3 "" H 1750 2700 50  0001 C CNN
F 4 "ATMEGA328P-AUR" H 3000 3400 50  0001 C CNN "manf#"
	1    3000 3400
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x06 J1
U 1 1 5FE92E63
P 6750 1750
F 0 "J1" H 6800 2050 50  0000 R CNN
F 1 "ISP" H 6800 1350 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x03_P2.54mm_Vertical" H 6750 1750 50  0001 C CNN
F 3 "~" H 6750 1750 50  0001 C CNN
	1    6750 1750
	-1   0    0    1   
$EndComp
Wire Wire Line
	6950 1550 7200 1550
Wire Wire Line
	6950 1650 7200 1650
Wire Wire Line
	6950 1750 7200 1750
Wire Wire Line
	6950 1950 7200 1950
Text Label 7200 1950 0    50   ~ 0
MISO
Wire Wire Line
	4550 1500 4750 1500
Text Label 4750 1500 0    50   ~ 0
MISO
Wire Wire Line
	7600 1850 7600 1100
Wire Wire Line
	6950 1850 7600 1850
$Comp
L power:+5V #PWR09
U 1 1 5FE94D36
P 7600 1100
F 0 "#PWR09" H 7600 950 50  0001 C CNN
F 1 "+5V" H 7615 1273 50  0000 C CNN
F 2 "" H 7600 1100 50  0001 C CNN
F 3 "" H 7600 1100 50  0001 C CNN
	1    7600 1100
	1    0    0    -1  
$EndComp
Text Label 7200 1750 0    50   ~ 0
SCK
Wire Wire Line
	4550 1400 4750 1400
Text Label 4750 1400 0    50   ~ 0
SCK
Text Label 7200 1650 0    50   ~ 0
MOSI
Wire Wire Line
	4550 1600 4750 1600
Text Label 4750 1600 0    50   ~ 0
MOSI
Text Label 7200 1550 0    50   ~ 0
~RESET
Wire Wire Line
	2900 1400 2800 1400
Text Label 2550 1400 0    50   ~ 0
~RESET
Wire Wire Line
	7500 1450 7500 2050
Wire Wire Line
	6950 1450 7500 1450
$Comp
L power:GND #PWR08
U 1 1 5FE95B1A
P 7500 2050
F 0 "#PWR08" H 7500 1800 50  0001 C CNN
F 1 "GND" H 7505 1877 50  0000 C CNN
F 2 "" H 7500 2050 50  0001 C CNN
F 3 "" H 7500 2050 50  0001 C CNN
	1    7500 2050
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 5FE95CF7
P 2800 1100
F 0 "R1" H 2870 1146 50  0000 L CNN
F 1 "1K" H 2870 1055 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 2730 1100 50  0001 C CNN
F 3 "~" H 2800 1100 50  0001 C CNN
	1    2800 1100
	1    0    0    -1  
$EndComp
Wire Wire Line
	2800 1250 2800 1400
Connection ~ 2800 1400
Wire Wire Line
	2800 1400 2550 1400
Wire Wire Line
	2800 950  2800 850 
$Comp
L power:+5V #PWR06
U 1 1 5FE96904
P 2800 850
F 0 "#PWR06" H 2800 700 50  0001 C CNN
F 1 "+5V" H 2815 1023 50  0000 C CNN
F 2 "" H 2800 850 50  0001 C CNN
F 3 "" H 2800 850 50  0001 C CNN
	1    2800 850 
	1    0    0    -1  
$EndComp
Wire Wire Line
	2900 1500 2450 1500
Wire Wire Line
	2450 1500 2450 1300
$Comp
L Device:C C4
U 1 1 5FE98587
P 1750 1300
F 0 "C4" V 1700 1400 50  0000 C CNN
F 1 "18pF" V 1700 1150 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 1788 1150 50  0001 C CNN
F 3 "~" H 1750 1300 50  0001 C CNN
	1    1750 1300
	0    1    1    0   
$EndComp
$Comp
L Device:C C5
U 1 1 5FE98E8C
P 1750 1600
F 0 "C5" V 2000 1600 50  0000 C CNN
F 1 "18pF" V 1900 1600 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 1788 1450 50  0001 C CNN
F 3 "~" H 1750 1600 50  0001 C CNN
	1    1750 1600
	0    -1   1    0   
$EndComp
Wire Wire Line
	1600 1300 1600 1450
Wire Wire Line
	1600 1450 1350 1450
Wire Wire Line
	1350 1450 1350 1600
Connection ~ 1600 1450
Wire Wire Line
	1600 1450 1600 1600
$Comp
L power:GND #PWR01
U 1 1 5FE9B28C
P 1350 1600
F 0 "#PWR01" H 1350 1350 50  0001 C CNN
F 1 "GND" H 1355 1427 50  0000 C CNN
F 2 "" H 1350 1600 50  0001 C CNN
F 3 "" H 1350 1600 50  0001 C CNN
	1    1350 1600
	1    0    0    -1  
$EndComp
Wire Wire Line
	2900 1900 2750 1900
Wire Wire Line
	2750 1900 2750 2000
Wire Wire Line
	2750 2000 2900 2000
Wire Wire Line
	2750 2000 2750 2100
Wire Wire Line
	2750 2100 2900 2100
Connection ~ 2750 2000
Wire Wire Line
	2750 2000 2400 2000
Wire Wire Line
	2400 2000 2400 2100
$Comp
L power:GND #PWR05
U 1 1 5FE9CC49
P 2400 2100
F 0 "#PWR05" H 2400 1850 50  0001 C CNN
F 1 "GND" H 2405 1927 50  0000 C CNN
F 2 "" H 2400 2100 50  0001 C CNN
F 3 "" H 2400 2100 50  0001 C CNN
	1    2400 2100
	1    0    0    -1  
$EndComp
Wire Wire Line
	2900 1800 2150 1800
Wire Wire Line
	2150 1800 2150 2400
Wire Wire Line
	2900 2200 2550 2200
Wire Wire Line
	2550 2200 2550 2300
Wire Wire Line
	2550 2400 2150 2400
Wire Wire Line
	2900 2300 2550 2300
Connection ~ 2550 2300
Wire Wire Line
	2550 2300 2550 2400
Wire Wire Line
	2150 2400 1900 2400
Wire Wire Line
	1900 2400 1900 2300
Connection ~ 2150 2400
$Comp
L power:+5V #PWR04
U 1 1 5FE9F8D3
P 1900 2300
F 0 "#PWR04" H 1900 2150 50  0001 C CNN
F 1 "+5V" H 1915 2473 50  0000 C CNN
F 2 "" H 1900 2300 50  0001 C CNN
F 3 "" H 1900 2300 50  0001 C CNN
	1    1900 2300
	1    0    0    -1  
$EndComp
$Comp
L Device:C C6
U 1 1 5FEA003C
P 2150 2650
F 0 "C6" V 2400 2650 50  0000 C CNN
F 1 "1uF" V 2300 2650 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 2188 2500 50  0001 C CNN
F 3 "~" H 2150 2650 50  0001 C CNN
	1    2150 2650
	-1   0    0    -1  
$EndComp
$Comp
L Device:C C3
U 1 1 5FEA0A8C
P 1700 2650
F 0 "C3" V 1950 2650 50  0000 C CNN
F 1 "1uF" V 1850 2650 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 1738 2500 50  0001 C CNN
F 3 "~" H 1700 2650 50  0001 C CNN
	1    1700 2650
	-1   0    0    -1  
$EndComp
$Comp
L Device:CP C1
U 1 1 5FEA144B
P 1150 2650
F 0 "C1" V 1300 2600 50  0000 L CNN
F 1 "4.7uF e" V 1000 2500 50  0000 L CNN
F 2 "Capacitor_SMD:CP_Elec_4x5.8" H 1188 2500 50  0001 C CNN
F 3 "~" H 1150 2650 50  0001 C CNN
	1    1150 2650
	1    0    0    -1  
$EndComp
Wire Wire Line
	2150 2400 2150 2500
Wire Wire Line
	2150 2500 1700 2500
Connection ~ 2150 2500
Wire Wire Line
	1700 2500 1150 2500
Connection ~ 1700 2500
Wire Wire Line
	1150 2800 1700 2800
Wire Wire Line
	1700 2800 2150 2800
Connection ~ 1700 2800
$Comp
L power:GND #PWR03
U 1 1 5FEA57C4
P 1700 3000
F 0 "#PWR03" H 1700 2750 50  0001 C CNN
F 1 "GND" H 1705 2827 50  0000 C CNN
F 2 "" H 1700 3000 50  0001 C CNN
F 3 "" H 1700 3000 50  0001 C CNN
	1    1700 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	1700 2800 1700 3000
$Comp
L Device:R R3
U 1 1 5FEBD228
P 5600 3550
F 0 "R3" V 5807 3550 50  0000 C CNN
F 1 "1K" V 5716 3550 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 5530 3550 50  0001 C CNN
F 3 "~" H 5600 3550 50  0001 C CNN
	1    5600 3550
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R4
U 1 1 5FEBDAAE
P 5600 3850
F 0 "R4" V 5807 3850 50  0000 C CNN
F 1 "1K" V 5716 3850 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 5530 3850 50  0001 C CNN
F 3 "~" H 5600 3850 50  0001 C CNN
	1    5600 3850
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5750 3550 5850 3550
Wire Wire Line
	5750 3850 5850 3850
Text Label 5850 3550 0    50   ~ 0
TX
Text Label 5850 3850 0    50   ~ 0
RX
$Comp
L Device:R R2
U 1 1 5FF87B20
P 5100 1100
F 0 "R2" H 5170 1146 50  0000 L CNN
F 1 "1K" H 5170 1055 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 5030 1100 50  0001 C CNN
F 3 "~" H 5100 1100 50  0001 C CNN
	1    5100 1100
	1    0    0    -1  
$EndComp
Wire Wire Line
	4550 1700 5100 1700
Wire Wire Line
	5100 1700 5100 1250
$Comp
L power:+5V #PWR07
U 1 1 5FF8D02A
P 5100 850
F 0 "#PWR07" H 5100 700 50  0001 C CNN
F 1 "+5V" H 5115 1023 50  0000 C CNN
F 2 "" H 5100 850 50  0001 C CNN
F 3 "" H 5100 850 50  0001 C CNN
	1    5100 850 
	1    0    0    -1  
$EndComp
Wire Wire Line
	5100 850  5100 950 
$Comp
L Device:C C2
U 1 1 5FFB500E
P 1350 2100
F 0 "C2" V 1600 2100 50  0000 C CNN
F 1 "100nF" V 1500 2100 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 1388 1950 50  0001 C CNN
F 3 "~" H 1350 2100 50  0001 C CNN
	1    1350 2100
	-1   0    0    -1  
$EndComp
Wire Wire Line
	2900 1700 1900 1700
Wire Wire Line
	1900 1700 1900 1950
Wire Wire Line
	1900 1950 1350 1950
$Comp
L power:GND #PWR02
U 1 1 5FFBB497
P 1350 2250
F 0 "#PWR02" H 1350 2000 50  0001 C CNN
F 1 "GND" H 1355 2077 50  0000 C CNN
F 2 "" H 1350 2250 50  0001 C CNN
F 3 "" H 1350 2250 50  0001 C CNN
	1    1350 2250
	1    0    0    -1  
$EndComp
Wire Wire Line
	4550 2200 4750 2200
$Sheet
S 1700 4900 900  300 
U 60479334
F0 "USB and Power" 50
F1 "USBandPower.sch" 50
F2 "~RESET" O R 2600 5000 50 
F3 "RX" I L 1700 5100 50 
F4 "TX" O R 2600 5100 50 
$EndSheet
Text Label 2700 5000 0    50   ~ 0
~RESET
Wire Wire Line
	2700 5000 2600 5000
Text Label 1000 5100 0    50   ~ 0
TX
Text Label 2700 5100 0    50   ~ 0
RX
$Sheet
S 1700 5450 1450 500 
U 604BF505
F0 "TPS" 50
F1 "TPS.sch" 50
F2 "ECU_TPSIDLE" O R 3150 5550 50 
F3 "TPSIDLE" I L 1700 5550 50 
F4 "TPSWOT" I L 1700 5650 50 
F5 "ECU_TPSWOT" O R 3150 5650 50 
F6 "ECU_TPSACCEL1" O R 3150 5750 50 
F7 "TPSACCEL1" I L 1700 5750 50 
F8 "TPSACCEL2" I L 1700 5850 50 
F9 "ECU_TPSACCEL2" O R 3150 5850 50 
$EndSheet
Wire Wire Line
	1700 5550 1000 5550
Wire Wire Line
	1000 5650 1700 5650
Wire Wire Line
	1700 5750 1000 5750
Wire Wire Line
	1000 5850 1700 5850
Text Label 1000 5550 0    50   ~ 0
TPSIDLE
Text Label 1000 5650 0    50   ~ 0
TPSWOT
Text Label 1000 5750 0    50   ~ 0
TPSACCEL1
Text Label 1000 5850 0    50   ~ 0
TPSACCEL2
Text Label 7550 4600 0    50   ~ 0
TPSIDLE
Wire Wire Line
	4550 1800 4750 1800
Wire Wire Line
	4550 2300 4750 2300
Text Label 7550 4500 0    50   ~ 0
TPSWOT
Text Label 7550 4700 0    50   ~ 0
TPSACCEL1
Text Label 7550 4800 0    50   ~ 0
TPSACCEL2
Wire Wire Line
	4750 3200 4550 3200
Wire Wire Line
	4550 3300 4650 3300
Wire Wire Line
	4650 3300 4650 3850
Text Label 3250 5550 0    50   ~ 0
ECU_TPSIDLE-17
Text Label 3250 5650 0    50   ~ 0
ECU_TPSWOT-2
Text Label 3250 5750 0    50   ~ 0
ECU_TPSACCEL1-9
Text Label 3250 5850 0    50   ~ 0
ECU_TPSACCEL2-20
Wire Wire Line
	3150 5550 3250 5550
Wire Wire Line
	3250 5650 3150 5650
Wire Wire Line
	3150 5750 3250 5750
Wire Wire Line
	3250 5850 3150 5850
$Sheet
S 1700 6200 1650 700 
U 60517480
F0 "Temperature" 50
F1 "Temperature.sch" 50
F2 "SCK" I L 1700 6300 50 
F3 "~AIRTEMP_CS" I L 1700 6400 50 
F4 "MOSI" I L 1700 6500 50 
F5 "MISO" O R 3350 6300 50 
F6 "ECU_AIRTEMP" O R 3350 6400 50 
F7 "~COOLANTTEMP_CS" I L 1700 6600 50 
F8 "ECU_COOLANTTEMP" O R 3350 6500 50 
F9 "COOLANT_TEMP_1" I L 1700 6700 50 
F10 "COOLANT_TEMP_2" I L 1700 6800 50 
$EndSheet
Wire Wire Line
	1700 5100 1000 5100
Wire Wire Line
	2600 5100 2700 5100
Wire Wire Line
	1700 6300 1000 6300
Wire Wire Line
	1700 6400 1000 6400
Wire Wire Line
	1700 6500 1000 6500
Wire Wire Line
	1700 6600 1000 6600
Wire Wire Line
	3350 6300 3450 6300
Wire Wire Line
	3350 6400 3450 6400
Wire Wire Line
	3350 6500 3450 6500
Text Label 1000 6300 0    50   ~ 0
SCK
Text Label 1000 6500 0    50   ~ 0
MOSI
Text Label 3450 6300 0    50   ~ 0
MISO
Text Label 3450 6400 0    50   ~ 0
ECU_AIRTEMP-1
Text Label 3450 6500 0    50   ~ 0
ECU_COOLANTTEMP-23
Text Label 1000 6400 0    50   ~ 0
~AIRTEMP_CS
Text Label 1000 6600 0    50   ~ 0
~COOLANTTEMP_CS
Text Label 4750 2000 0    50   ~ 0
~AIRTEMP_CS
Text Label 4750 2100 0    50   ~ 0
~COOLANTTEMP_CS
Wire Wire Line
	4550 2000 4750 2000
Wire Wire Line
	4550 2100 4750 2100
$Sheet
S 1700 7150 1650 500 
U 6046850B
F0 "Triggering" 50
F1 "Triggering.sch" 50
F2 "ECU_TRIGGERGROUP1" O R 3350 7250 50 
F3 "ECU_TRIGGERGROUP2" O R 3350 7350 50 
F4 "ECU_TRIGGERGROUP3" O R 3350 7450 50 
F5 "ECU_TRIGGERGROUP4" O R 3350 7550 50 
F6 "TRIGGERGROUP1" I L 1700 7250 50 
F7 "TRIGGERGROUP3" I L 1700 7350 50 
F8 "TRIGGERGROUP2" I L 1700 7450 50 
F9 "TRIGGERGROUP4" I L 1700 7550 50 
$EndSheet
Wire Wire Line
	3350 7250 3450 7250
Wire Wire Line
	3350 7350 3450 7350
Wire Wire Line
	3350 7450 3450 7450
Wire Wire Line
	3350 7550 3450 7550
Text Label 3450 7250 0    50   ~ 0
ECU_TRIGGERGROUP1-21
Text Label 3450 7350 0    50   ~ 0
ECU_TRIGGERGROUP2-13
Text Label 3450 7450 0    50   ~ 0
ECU_TRIGGERGROUP3-22
Text Label 3450 7550 0    50   ~ 0
ECU_TRIGGERGROUP4-14
Text Label 1000 7250 0    50   ~ 0
TRIGGERGROUP1
Text Label 1000 7350 0    50   ~ 0
TRIGGERGROUP2
Text Label 1000 7450 0    50   ~ 0
TRIGGERGROUP3
Text Label 1000 7550 0    50   ~ 0
TRIGGERGROUP4
Wire Wire Line
	1000 7250 1700 7250
Wire Wire Line
	1700 7350 1000 7350
Wire Wire Line
	1000 7450 1700 7450
Wire Wire Line
	1700 7550 1000 7550
Text Label 4750 1800 0    50   ~ 0
TRIGGERGROUP1
Text Label 4750 2800 0    50   ~ 0
TRIGGERGROUP2
Text Label 4750 2700 0    50   ~ 0
TRIGGERGROUP3
Text Label 4750 3000 0    50   ~ 0
TRIGGERGROUP4
Wire Wire Line
	4550 2500 4750 2500
Wire Wire Line
	4550 2700 4750 2700
Wire Wire Line
	4550 2800 4750 2800
Wire Wire Line
	4550 3000 4750 3000
Wire Wire Line
	4550 3100 4750 3100
Wire Wire Line
	4550 2900 4750 2900
$Comp
L Connector:Screw_Terminal_01x04 J6
U 1 1 6044C452
P 10250 1850
F 0 "J6" H 10330 1842 50  0000 L CNN
F 1 "MPS" H 10330 1751 50  0000 L CNN
F 2 "Britishideas:PhoenixContact_COMBICON_PT_4" H 10250 1850 50  0001 C CNN
F 3 "~" H 10250 1850 50  0001 C CNN
F 4 "1935792" H 10250 1850 50  0001 C CNN "manf#"
	1    10250 1850
	1    0    0    -1  
$EndComp
Text Label 9700 1750 0    50   ~ 0
MPS-7
Text Label 9700 2050 0    50   ~ 0
MPS-15
Text Label 9700 1950 0    50   ~ 0
MPS-10
Text Label 9700 1850 0    50   ~ 0
MPS-8
Wire Wire Line
	9700 2050 10050 2050
Wire Wire Line
	10050 1950 9700 1950
Wire Wire Line
	9700 1850 10050 1850
Wire Wire Line
	10050 1750 9700 1750
Text Notes 9900 1600 0    50   ~ 0
7 - grey/green\n8 - grey/blue\n10 - grey/red\n15 - grey/black
$Comp
L Connector:TestPoint TP5
U 1 1 60446336
P 4750 6250
F 0 "TP5" H 4808 6368 50  0000 L CNN
F 1 "5194TR" H 4808 6277 50  0000 L CNN
F 2 "Britishideas:5190TR-Colored-Test-Point" H 4950 6250 50  0001 C CNN
F 3 "~" H 4950 6250 50  0001 C CNN
F 4 "5194TR" H 4750 6250 50  0001 C CNN "manf#"
	1    4750 6250
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint TP6
U 1 1 60446DAD
P 5200 6250
F 0 "TP6" H 5258 6368 50  0000 L CNN
F 1 "5194TR" H 5258 6277 50  0000 L CNN
F 2 "Britishideas:5190TR-Colored-Test-Point" H 5400 6250 50  0001 C CNN
F 3 "~" H 5400 6250 50  0001 C CNN
F 4 "5194TR" H 5200 6250 50  0001 C CNN "manf#"
	1    5200 6250
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint TP7
U 1 1 60447127
P 5650 6250
F 0 "TP7" H 5708 6368 50  0000 L CNN
F 1 "5194TR" H 5708 6277 50  0000 L CNN
F 2 "Britishideas:5190TR-Colored-Test-Point" H 5850 6250 50  0001 C CNN
F 3 "~" H 5850 6250 50  0001 C CNN
F 4 "5194TR" H 5650 6250 50  0001 C CNN "manf#"
	1    5650 6250
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint TP8
U 1 1 6044750C
P 6100 6250
F 0 "TP8" H 6158 6368 50  0000 L CNN
F 1 "5194TR" H 6158 6277 50  0000 L CNN
F 2 "Britishideas:5190TR-Colored-Test-Point" H 6300 6250 50  0001 C CNN
F 3 "~" H 6300 6250 50  0001 C CNN
F 4 "5194TR" H 6100 6250 50  0001 C CNN "manf#"
	1    6100 6250
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint TP9
U 1 1 604478C4
P 6550 6250
F 0 "TP9" H 6608 6368 50  0000 L CNN
F 1 "5195TR" H 6608 6277 50  0000 L CNN
F 2 "Britishideas:5190TR-Colored-Test-Point" H 6750 6250 50  0001 C CNN
F 3 "~" H 6750 6250 50  0001 C CNN
F 4 "5195TR" H 6550 6250 50  0001 C CNN "manf#"
	1    6550 6250
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR053
U 1 1 60447C04
P 6550 6800
AR Path="/60447C04" Ref="#PWR053"  Part="1" 
AR Path="/60479334/60447C04" Ref="#PWR?"  Part="1" 
F 0 "#PWR053" H 6550 6550 50  0001 C CNN
F 1 "GND" H 6555 6627 50  0000 C CNN
F 2 "" H 6550 6800 50  0001 C CNN
F 3 "" H 6550 6800 50  0001 C CNN
	1    6550 6800
	-1   0    0    -1  
$EndComp
Text Label 4750 7050 1    50   ~ 0
ECU_INJGROUP1-3
Text Label 5200 7050 1    50   ~ 0
ECU_INJGROUP2-4
Text Label 5650 7050 1    50   ~ 0
ECU_INJGROUP3-5
Text Label 6100 7050 1    50   ~ 0
ECU_INJGROUP4-6
Wire Wire Line
	4550 2600 4750 2600
$Comp
L Device:Crystal_GND24 Y1
U 1 1 605627C0
P 2100 1450
F 0 "Y1" V 2054 1694 50  0000 L CNN
F 1 "FA-238 16.0000MB-C3" V 1800 1100 50  0000 L CNN
F 2 "Britishideas:FA-238" H 2100 1450 50  0001 C CNN
F 3 "~" H 2100 1450 50  0001 C CNN
F 4 "FA-238 16.0000MB-C3" H 2100 1450 50  0001 C CNN "manf#"
	1    2100 1450
	0    1    1    0   
$EndComp
Wire Wire Line
	1900 1600 2100 1600
Wire Wire Line
	1900 1300 2100 1300
Connection ~ 2100 1300
Wire Wire Line
	2100 1300 2450 1300
Connection ~ 2100 1600
Wire Wire Line
	2100 1600 2900 1600
Wire Wire Line
	1900 1450 1600 1450
Wire Wire Line
	2300 1450 2400 1450
Wire Wire Line
	2400 1450 2400 2000
Connection ~ 2400 2000
Text Notes 6550 6000 0    50   ~ 0
BROWN
Text Notes 5400 6000 0    50   ~ 0
YELLOW
Wire Wire Line
	4750 6250 4750 7050
Wire Wire Line
	5200 6250 5200 7050
Wire Wire Line
	5650 6250 5650 7050
Wire Wire Line
	6100 6250 6100 7050
Wire Wire Line
	6550 6250 6550 6800
$Comp
L Connector:Screw_Terminal_01x02 J5
U 1 1 607499F9
P 8450 2700
F 0 "J5" H 8530 2692 50  0000 L CNN
F 1 "12V IN" H 8530 2601 50  0000 L CNN
F 2 "Britishideas:PhoenixContact_COMBICON_MKDSN_2" H 8450 2700 50  0001 C CNN
F 3 "~" H 8450 2700 50  0001 C CNN
F 4 "1729018" H 8450 2700 50  0001 C CNN "manf#"
	1    8450 2700
	-1   0    0    1   
$EndComp
$Comp
L power:GND #PWR010
U 1 1 60774D44
P 8700 2900
AR Path="/60774D44" Ref="#PWR010"  Part="1" 
AR Path="/60479334/60774D44" Ref="#PWR?"  Part="1" 
F 0 "#PWR010" H 8700 2650 50  0001 C CNN
F 1 "GND" H 8705 2727 50  0000 C CNN
F 2 "" H 8700 2900 50  0001 C CNN
F 3 "" H 8700 2900 50  0001 C CNN
	1    8700 2900
	-1   0    0    -1  
$EndComp
Wire Wire Line
	8700 2900 8700 2700
Wire Wire Line
	8700 2700 8650 2700
Text Label 9900 4400 2    50   ~ 0
ECU_AIRTEMP-1
Text Label 9900 4500 2    50   ~ 0
ECU_TPSWOT-2
Text Label 9900 4600 2    50   ~ 0
MPS-7
Text Label 9900 4700 2    50   ~ 0
MPS-8
Text Label 9900 4800 2    50   ~ 0
ECU_TPSACCEL1-9
Text Label 9900 4900 2    50   ~ 0
MPS-10
Text Label 9900 5000 2    50   ~ 0
ECU_TRIGGERGROUP2-13
Text Label 9900 5100 2    50   ~ 0
ECU_TRIGGERGROUP4-14
Text Label 9900 5200 2    50   ~ 0
MPS-15
$Comp
L Connector:Screw_Terminal_01x10 J9
U 1 1 60829B6E
P 10300 4800
F 0 "J9" H 10380 4792 50  0000 L CNN
F 1 "ECU2" H 10380 4701 50  0000 L CNN
F 2 "Britishideas:PhoenixContact_COMBICON_PT_10" H 10300 4800 50  0001 C CNN
F 3 "~" H 10300 4800 50  0001 C CNN
F 4 "1935242" H 10300 4800 50  0001 C CNN "manf#"
	1    10300 4800
	1    0    0    -1  
$EndComp
Wire Wire Line
	9900 4400 10100 4400
Wire Wire Line
	10100 4500 9900 4500
Wire Wire Line
	9900 4600 10100 4600
Wire Wire Line
	10100 4700 9900 4700
Wire Wire Line
	9900 4800 10100 4800
Wire Wire Line
	10100 4900 9900 4900
Wire Wire Line
	9900 5000 10100 5000
Wire Wire Line
	10100 5100 9900 5100
Wire Wire Line
	9900 5200 10100 5200
Wire Wire Line
	4750 3200 4750 3550
Wire Wire Line
	4750 3550 5450 3550
Wire Wire Line
	4650 3850 5450 3850
Wire Wire Line
	10100 5300 9900 5300
Text Label 9900 5300 2    50   ~ 0
ECU_TPSIDLE-17
Wire Wire Line
	10100 6000 9900 6000
Wire Wire Line
	9900 5900 10100 5900
Wire Wire Line
	10100 5800 9900 5800
Wire Wire Line
	9900 5700 10100 5700
Wire Wire Line
	10100 5600 9900 5600
Wire Wire Line
	9900 5500 10100 5500
Text Label 9900 6000 2    50   ~ 0
ECU_COOLANTTEMP-23
Text Label 9900 5900 2    50   ~ 0
ECU_TRIGGERGROUP3-22
Text Label 9900 5800 2    50   ~ 0
ECU_TRIGGERGROUP1-21
Text Label 9900 5700 2    50   ~ 0
ECU_TPSACCEL2-20
Text Label 9900 5600 2    50   ~ 0
ECU_FUELPUMPRELAY-19
Text Label 9900 5500 2    50   ~ 0
ECU_START-18
$Comp
L Connector:Screw_Terminal_01x07 J10
U 1 1 6082793B
P 10300 5800
F 0 "J10" H 10380 5842 50  0000 L CNN
F 1 "ECU3" H 10380 5751 50  0000 L CNN
F 2 "Britishideas:PhoenixContact_COMBICON_PT_7" H 10300 5800 50  0001 C CNN
F 3 "~" H 10300 5800 50  0001 C CNN
F 4 "1935213" H 10300 5800 50  0001 C CNN "manf#"
	1    10300 5800
	1    0    0    -1  
$EndComp
Text Notes 8400 2450 0    50   ~ 0
Min 3A connector
Wire Wire Line
	8650 2600 9950 2600
Connection ~ 9950 2600
Wire Wire Line
	9950 2600 9950 2550
$Comp
L power:PWR_FLAG #FLG01
U 1 1 606CBA96
P 9950 2600
AR Path="/606CBA96" Ref="#FLG01"  Part="1" 
AR Path="/60479334/606CBA96" Ref="#FLG?"  Part="1" 
F 0 "#FLG01" H 9950 2675 50  0001 C CNN
F 1 "PWR_FLAG" V 9950 2728 50  0000 L CNN
F 2 "" H 9950 2600 50  0001 C CNN
F 3 "~" H 9950 2600 50  0001 C CNN
	1    9950 2600
	0    1    -1   0   
$EndComp
$Comp
L power:+12V #PWR048
U 1 1 606CBA90
P 9950 2550
AR Path="/606CBA90" Ref="#PWR048"  Part="1" 
AR Path="/60479334/606CBA90" Ref="#PWR?"  Part="1" 
F 0 "#PWR048" H 9950 2400 50  0001 C CNN
F 1 "+12V" H 9965 2723 50  0000 C CNN
F 2 "" H 9950 2550 50  0001 C CNN
F 3 "" H 9950 2550 50  0001 C CNN
	1    9950 2550
	-1   0    0    -1  
$EndComp
Text Notes 9950 3650 0    50   ~ 0
Min 3A connector
Wire Wire Line
	9900 3500 9900 3600
Wire Wire Line
	10050 3500 9900 3500
$Comp
L Connector:Screw_Terminal_01x08 J2
U 1 1 60815DA7
P 10250 3100
F 0 "J2" H 10330 3092 50  0000 L CNN
F 1 "ECU1" H 10330 3001 50  0000 L CNN
F 2 "Britishideas:PhoenixContact_COMBICON_PT_8" H 10250 3100 50  0001 C CNN
F 3 "~" H 10250 3100 50  0001 C CNN
F 4 "1935831" H 10250 3100 50  0001 C CNN "manf#"
	1    10250 3100
	1    0    0    -1  
$EndComp
Wire Wire Line
	10050 3300 9750 3300
Wire Wire Line
	9750 3200 10050 3200
Wire Wire Line
	10050 3100 9750 3100
Wire Wire Line
	9750 3000 10050 3000
Text Label 9750 3300 2    50   ~ 0
ECU_INJGROUP4-6
Text Label 9750 3200 2    50   ~ 0
ECU_INJGROUP3-5
Text Label 9750 3100 2    50   ~ 0
ECU_INJGROUP2-4
Text Label 9750 3000 2    50   ~ 0
ECU_INJGROUP1-3
Connection ~ 9900 3500
Wire Wire Line
	9900 3400 9900 3500
Wire Wire Line
	10050 3400 9900 3400
Wire Wire Line
	9950 2900 10050 2900
Wire Wire Line
	9950 2800 9950 2900
Wire Wire Line
	9950 2800 10050 2800
Connection ~ 9950 2800
Wire Wire Line
	9950 2600 9950 2800
$Comp
L power:GND #PWR012
U 1 1 606CB304
P 9900 3600
AR Path="/606CB304" Ref="#PWR012"  Part="1" 
AR Path="/60479334/606CB304" Ref="#PWR?"  Part="1" 
F 0 "#PWR012" H 9900 3350 50  0001 C CNN
F 1 "GND" H 9905 3427 50  0000 C CNN
F 2 "" H 9900 3600 50  0001 C CNN
F 3 "" H 9900 3600 50  0001 C CNN
	1    9900 3600
	-1   0    0    -1  
$EndComp
$Sheet
S 1700 4150 1800 500 
U 63357965
F0 "Injectors" 50
F1 "Injectors.sch" 50
F2 "ECU_INJGROUP1-3" I L 1700 4250 50 
F3 "ECU_INJGROUP2-4" I L 1700 4350 50 
F4 "ECU_INJGROUP3-5" I L 1700 4450 50 
F5 "ECU_INJGROUP4-6" I L 1700 4550 50 
F6 "MCU_INJGROUP1-3" O R 3500 4250 50 
F7 "MCU_INJGROUP3-5" O R 3500 4350 50 
F8 "MCU_INJGROUP2-4" O R 3500 4450 50 
F9 "MCU_INJGROUP4-6" O R 3500 4550 50 
$EndSheet
Wire Wire Line
	1700 4550 1400 4550
Wire Wire Line
	1400 4450 1700 4450
Wire Wire Line
	1700 4350 1400 4350
Wire Wire Line
	1400 4250 1700 4250
Text Label 1400 4550 2    50   ~ 0
ECU_INJGROUP4-6
Text Label 1400 4450 2    50   ~ 0
ECU_INJGROUP3-5
Text Label 1400 4350 2    50   ~ 0
ECU_INJGROUP2-4
Text Label 1400 4250 2    50   ~ 0
ECU_INJGROUP1-3
Text Label 7550 4400 0    50   ~ 0
ECU_START-18
Text Label 7550 4300 0    50   ~ 0
ECU_FUELPUMPRELAY-19
Wire Wire Line
	3500 4250 3600 4250
Wire Wire Line
	3500 4350 3600 4350
Wire Wire Line
	3500 4450 3600 4450
Wire Wire Line
	3500 4550 3600 4550
Text Label 3600 4250 0    50   ~ 0
MCU_INJGROUP1-3
Text Label 3600 4350 0    50   ~ 0
MCU_INJGROUP3-5
Text Label 3600 4450 0    50   ~ 0
MCU_INJGROUP2-4
Text Label 3600 4550 0    50   ~ 0
MCU_INJGROUP4-6
Text Label 4750 3100 0    50   ~ 0
MCU_INJGROUP1-3
Text Label 4750 2900 0    50   ~ 0
MCU_INJGROUP3-5
Text Label 4750 2600 0    50   ~ 0
MCU_INJGROUP2-4
Text Label 4750 2500 0    50   ~ 0
MCU_INJGROUP4-6
NoConn ~ 10100 6100
$Comp
L BritishIdeas:MCP23S08T-E_SO U?
U 1 1 6328F4DE
P 6750 5100
F 0 "U?" H 6800 5050 50  0000 C CNN
F 1 "MCP23S08T-E_SO" H 7050 6174 50  0000 C CNN
F 2 "Package_SO:SOIC-18W_7.5x11.6mm_P1.27mm" H 6750 5100 50  0001 C CNN
F 3 "" H 6750 5100 50  0001 C CNN
	1    6750 5100
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 63290209
P 7650 3550
F 0 "#PWR?" H 7650 3400 50  0001 C CNN
F 1 "+5V" H 7665 3723 50  0000 C CNN
F 2 "" H 7650 3550 50  0001 C CNN
F 3 "" H 7650 3550 50  0001 C CNN
	1    7650 3550
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 632909B5
P 6300 5150
F 0 "#PWR?" H 6300 4900 50  0001 C CNN
F 1 "GND" H 6305 4977 50  0000 C CNN
F 2 "" H 6300 5150 50  0001 C CNN
F 3 "" H 6300 5150 50  0001 C CNN
	1    6300 5150
	1    0    0    -1  
$EndComp
Wire Wire Line
	7650 3550 7650 3600
Wire Wire Line
	7650 4200 7450 4200
Wire Wire Line
	6650 5000 6550 5000
Wire Wire Line
	6300 5000 6300 5150
Text Label 6550 4400 2    50   ~ 0
MISO
Text Label 6550 4300 2    50   ~ 0
MOSI
Text Label 6550 4200 2    50   ~ 0
SCK
Wire Wire Line
	6550 4400 6650 4400
Wire Wire Line
	6650 4300 6550 4300
Wire Wire Line
	6550 4200 6650 4200
Text Label 6300 4800 2    50   ~ 0
~IO_CS
Wire Wire Line
	6300 4800 6650 4800
NoConn ~ 2900 2400
NoConn ~ 2900 2500
Wire Wire Line
	7550 4300 7450 4300
Wire Wire Line
	7450 4400 7550 4400
Wire Wire Line
	7550 4500 7450 4500
Wire Wire Line
	7450 4600 7550 4600
Wire Wire Line
	7550 4700 7450 4700
Wire Wire Line
	7450 4800 7550 4800
$Comp
L Device:C C?
U 1 1 6330E21D
P 7850 3800
F 0 "C?" V 8100 3800 50  0000 C CNN
F 1 "100nF" V 8000 3800 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 7888 3650 50  0001 C CNN
F 3 "~" H 7850 3800 50  0001 C CNN
	1    7850 3800
	1    0    0    1   
$EndComp
Wire Wire Line
	7850 3650 7850 3600
Wire Wire Line
	7850 3600 7650 3600
Connection ~ 7650 3600
Wire Wire Line
	7650 3600 7650 4200
$Comp
L power:GND #PWR?
U 1 1 63321ED8
P 7850 4000
F 0 "#PWR?" H 7850 3750 50  0001 C CNN
F 1 "GND" H 7855 3827 50  0000 C CNN
F 2 "" H 7850 4000 50  0001 C CNN
F 3 "" H 7850 4000 50  0001 C CNN
	1    7850 4000
	1    0    0    -1  
$EndComp
Wire Wire Line
	7850 4000 7850 3950
Wire Wire Line
	6650 4500 6550 4500
Wire Wire Line
	6550 4500 6550 4600
Connection ~ 6550 5000
Wire Wire Line
	6550 5000 6300 5000
Wire Wire Line
	6650 4600 6550 4600
Connection ~ 6550 4600
Wire Wire Line
	6550 4600 6550 5000
$Comp
L power:+5V #PWR?
U 1 1 6335271F
P 6300 4100
F 0 "#PWR?" H 6300 3950 50  0001 C CNN
F 1 "+5V" H 6315 4273 50  0000 C CNN
F 2 "" H 6300 4100 50  0001 C CNN
F 3 "" H 6300 4100 50  0001 C CNN
	1    6300 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	6300 4100 6300 4700
Wire Wire Line
	6300 4700 6650 4700
NoConn ~ 6650 4900
Text Label 4750 2200 0    50   ~ 0
STATUS
Text Label 8450 1700 2    50   ~ 0
STATUS
$Comp
L Device:R R?
U 1 1 633BA4BD
P 8700 1700
F 0 "R?" V 8907 1700 50  0000 C CNN
F 1 "1K" V 8816 1700 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 8630 1700 50  0001 C CNN
F 3 "~" H 8700 1700 50  0001 C CNN
	1    8700 1700
	0    -1   -1   0   
$EndComp
Wire Wire Line
	8550 1700 8450 1700
$Comp
L Device:LED D?
U 1 1 633C52E1
P 9000 1400
F 0 "D?" V 9039 1282 50  0000 R CNN
F 1 "RED" V 8948 1282 50  0000 R CNN
F 2 "LED_SMD:LED_PLCC-2" H 9000 1400 50  0001 C CNN
F 3 "~" H 9000 1400 50  0001 C CNN
	1    9000 1400
	0    -1   -1   0   
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 633C5A79
P 9000 1150
F 0 "#PWR?" H 9000 1000 50  0001 C CNN
F 1 "+5V" H 9015 1323 50  0000 C CNN
F 2 "" H 9000 1150 50  0001 C CNN
F 3 "" H 9000 1150 50  0001 C CNN
	1    9000 1150
	1    0    0    -1  
$EndComp
Wire Wire Line
	9000 1150 9000 1250
Wire Wire Line
	9000 1550 9000 1700
Wire Wire Line
	9000 1700 8850 1700
Text Label 4750 2300 0    50   ~ 0
~IO_CS
Text Label 7550 4900 0    50   ~ 0
COOLANT_TEMP_1
Text Label 7550 5000 0    50   ~ 0
COOLANT_TEMP_2
Wire Wire Line
	7550 5000 7450 5000
Wire Wire Line
	7550 4900 7450 4900
Text Label 1000 6700 0    50   ~ 0
COOLANT_TEMP_1
Text Label 1000 6800 0    50   ~ 0
COOLANT_TEMP_2
Wire Wire Line
	1700 6800 1000 6800
Wire Wire Line
	1000 6700 1700 6700
NoConn ~ 4550 2400
NoConn ~ 4550 1900
$EndSCHEMATC
