EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 7
Title "D-Jetronic ECU Tester"
Date "2021-04-04"
Rev "1.1"
Comp "(C) Britishideas 2021"
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
P 6000 1750
F 0 "J1" H 6050 2050 50  0000 R CNN
F 1 "ISP" H 6050 1350 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x03_P2.54mm_Vertical" H 6000 1750 50  0001 C CNN
F 3 "~" H 6000 1750 50  0001 C CNN
	1    6000 1750
	-1   0    0    1   
$EndComp
Wire Wire Line
	6200 1550 6450 1550
Wire Wire Line
	6200 1650 6450 1650
Wire Wire Line
	6200 1750 6450 1750
Wire Wire Line
	6200 1950 6450 1950
Text Label 6450 1950 0    50   ~ 0
MISO
Wire Wire Line
	4550 1500 4750 1500
Text Label 4750 1500 0    50   ~ 0
MISO
Wire Wire Line
	6850 1850 6850 1100
Wire Wire Line
	6200 1850 6850 1850
$Comp
L power:+5V #PWR09
U 1 1 5FE94D36
P 6850 1100
F 0 "#PWR09" H 6850 950 50  0001 C CNN
F 1 "+5V" H 6865 1273 50  0000 C CNN
F 2 "" H 6850 1100 50  0001 C CNN
F 3 "" H 6850 1100 50  0001 C CNN
	1    6850 1100
	1    0    0    -1  
$EndComp
Text Label 6450 1750 0    50   ~ 0
SCK
Wire Wire Line
	4550 1400 4750 1400
Text Label 4750 1400 0    50   ~ 0
SCK
Text Label 6450 1650 0    50   ~ 0
MOSI
Wire Wire Line
	4550 1600 4750 1600
Text Label 4750 1600 0    50   ~ 0
MOSI
Text Label 6450 1550 0    50   ~ 0
~RESET
Wire Wire Line
	2900 1400 2800 1400
Text Label 2550 1400 0    50   ~ 0
~RESET
Wire Wire Line
	6750 1450 6750 2050
Wire Wire Line
	6200 1450 6750 1450
$Comp
L power:GND #PWR08
U 1 1 5FE95B1A
P 6750 2050
F 0 "#PWR08" H 6750 1800 50  0001 C CNN
F 1 "GND" H 6755 1877 50  0000 C CNN
F 2 "" H 6750 2050 50  0001 C CNN
F 3 "" H 6750 2050 50  0001 C CNN
	1    6750 2050
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
NoConn ~ 2900 2400
NoConn ~ 2900 2500
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
Text Label 4750 2200 0    50   ~ 0
STATUS
$Comp
L Device:LED D1
U 1 1 6003C913
P 5700 4950
F 0 "D1" V 5739 4832 50  0000 R CNN
F 1 "RED" V 5648 4832 50  0000 R CNN
F 2 "LED_SMD:LED_PLCC-2" H 5700 4950 50  0001 C CNN
F 3 "~" H 5700 4950 50  0001 C CNN
	1    5700 4950
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R5
U 1 1 6003D307
P 5350 5250
F 0 "R5" V 5143 5250 50  0000 C CNN
F 1 "1K" V 5234 5250 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 5280 5250 50  0001 C CNN
F 3 "~" H 5350 5250 50  0001 C CNN
	1    5350 5250
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR011
U 1 1 6003D830
P 5700 4800
F 0 "#PWR011" H 5700 4650 50  0001 C CNN
F 1 "+5V" H 5715 4973 50  0000 C CNN
F 2 "" H 5700 4800 50  0001 C CNN
F 3 "" H 5700 4800 50  0001 C CNN
	1    5700 4800
	1    0    0    -1  
$EndComp
Wire Wire Line
	5700 5100 5700 5250
Wire Wire Line
	5700 5250 5500 5250
Wire Wire Line
	5200 5250 4700 5250
Text Label 4700 5250 0    50   ~ 0
STATUS
$Sheet
S 1500 4950 900  300 
U 60479334
F0 "USB and Power" 50
F1 "USBandPower.sch" 50
F2 "~RESET" O R 2400 5050 50 
F3 "RX" I L 1500 5150 50 
F4 "TX" O R 2400 5150 50 
$EndSheet
Text Label 2500 5050 0    50   ~ 0
~RESET
Wire Wire Line
	2500 5050 2400 5050
Text Label 800  5150 0    50   ~ 0
TX
Text Label 2500 5150 0    50   ~ 0
RX
$Sheet
S 1500 5500 1450 500 
U 604BF505
F0 "TPS" 50
F1 "TPS.sch" 50
F2 "ECU_TPSIDLE" O R 2950 5600 50 
F3 "TPSIDLE" I L 1500 5600 50 
F4 "TPSWOT" I L 1500 5700 50 
F5 "ECU_TPSWOT" O R 2950 5700 50 
F6 "ECU_TPSACCEL1" O R 2950 5800 50 
F7 "TPSACCEL1" I L 1500 5800 50 
F8 "TPSACCEL2" I L 1500 5900 50 
F9 "ECU_TPSACCEL2" O R 2950 5900 50 
$EndSheet
Wire Wire Line
	1500 5600 800  5600
Wire Wire Line
	800  5700 1500 5700
Wire Wire Line
	1500 5800 800  5800
Wire Wire Line
	800  5900 1500 5900
Text Label 800  5600 0    50   ~ 0
TPSIDLE
Text Label 800  5700 0    50   ~ 0
TPSWOT
Text Label 800  5800 0    50   ~ 0
TPSACCEL1
Text Label 800  5900 0    50   ~ 0
TPSACCEL2
Text Label 4750 2500 0    50   ~ 0
TPSIDLE
Wire Wire Line
	4550 1800 4750 1800
Wire Wire Line
	4550 1900 4750 1900
Wire Wire Line
	4550 2300 4750 2300
Wire Wire Line
	4550 2400 4750 2400
Text Label 4750 1900 0    50   ~ 0
TPSWOT
Text Label 4750 2300 0    50   ~ 0
TPSACCEL1
Text Label 4750 2400 0    50   ~ 0
TPSACCEL2
Wire Wire Line
	4750 3200 4550 3200
Wire Wire Line
	4550 3300 4650 3300
Wire Wire Line
	4650 3300 4650 3850
Text Label 3050 5600 0    50   ~ 0
ECU_TPSIDLE-17
Text Label 3050 5700 0    50   ~ 0
ECU_TPSWOT-2
Text Label 3050 5800 0    50   ~ 0
ECU_TPSACCEL1-9
Text Label 3050 5900 0    50   ~ 0
ECU_TPSACCEL2-20
Wire Wire Line
	2950 5600 3050 5600
Wire Wire Line
	3050 5700 2950 5700
Wire Wire Line
	2950 5800 3050 5800
Wire Wire Line
	3050 5900 2950 5900
$Sheet
S 1500 6250 1650 500 
U 60517480
F0 "Temperature" 50
F1 "Temperature.sch" 50
F2 "SCK" I L 1500 6350 50 
F3 "~AIRTEMP_CS" I L 1500 6450 50 
F4 "MOSI" I L 1500 6550 50 
F5 "MISO" O R 3150 6350 50 
F6 "ECU_AIRTEMP" O R 3150 6450 50 
F7 "~COOLANTTEMP_CS" I L 1500 6650 50 
F8 "ECU_COOLANTTEMP" O R 3150 6550 50 
$EndSheet
Wire Wire Line
	1500 5150 800  5150
Wire Wire Line
	2400 5150 2500 5150
Wire Wire Line
	1500 6350 800  6350
Wire Wire Line
	1500 6450 800  6450
Wire Wire Line
	1500 6550 800  6550
Wire Wire Line
	1500 6650 800  6650
Wire Wire Line
	3150 6350 3250 6350
Wire Wire Line
	3150 6450 3250 6450
Wire Wire Line
	3150 6550 3250 6550
Text Label 800  6350 0    50   ~ 0
SCK
Text Label 800  6550 0    50   ~ 0
MOSI
Text Label 3250 6350 0    50   ~ 0
MISO
Text Label 3250 6450 0    50   ~ 0
ECU_AIRTEMP-1
Text Label 3250 6550 0    50   ~ 0
ECU_COOLANTTEMP-23
Text Label 800  6450 0    50   ~ 0
~AIRTEMP_CS
Text Label 800  6650 0    50   ~ 0
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
S 1500 7000 1650 500 
U 6046850B
F0 "Triggering" 50
F1 "Triggering.sch" 50
F2 "ECU_TRIGGERGROUP1" O R 3150 7100 50 
F3 "ECU_TRIGGERGROUP2" O R 3150 7200 50 
F4 "ECU_TRIGGERGROUP3" O R 3150 7300 50 
F5 "ECU_TRIGGERGROUP4" O R 3150 7400 50 
F6 "TRIGGERGROUP1" I L 1500 7100 50 
F7 "TRIGGERGROUP3" I L 1500 7200 50 
F8 "TRIGGERGROUP2" I L 1500 7300 50 
F9 "TRIGGERGROUP4" I L 1500 7400 50 
$EndSheet
Wire Wire Line
	3150 7100 3250 7100
Wire Wire Line
	3150 7200 3250 7200
Wire Wire Line
	3150 7300 3250 7300
Wire Wire Line
	3150 7400 3250 7400
Text Label 3250 7100 0    50   ~ 0
ECU_TRIGGERGROUP1-21
Text Label 3250 7200 0    50   ~ 0
ECU_TRIGGERGROUP2-13
Text Label 3250 7300 0    50   ~ 0
ECU_TRIGGERGROUP3-22
Text Label 3250 7400 0    50   ~ 0
ECU_TRIGGERGROUP4-14
Text Label 800  7100 0    50   ~ 0
TRIGGERGROUP1
Text Label 800  7200 0    50   ~ 0
TRIGGERGROUP2
Text Label 800  7300 0    50   ~ 0
TRIGGERGROUP3
Text Label 800  7400 0    50   ~ 0
TRIGGERGROUP4
Wire Wire Line
	800  7100 1500 7100
Wire Wire Line
	1500 7200 800  7200
Wire Wire Line
	800  7300 1500 7300
Wire Wire Line
	1500 7400 800  7400
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
$Sheet
S 1500 4400 900  300 
U 604F15FC
F0 "Vacuum" 50
F1 "Vacuum.sch" 50
F2 "VAC1" I L 1500 4500 50 
F3 "VAC2" I L 1500 4600 50 
$EndSheet
Wire Wire Line
	1500 4500 800  4500
Wire Wire Line
	1500 4600 800  4600
Text Label 800  4600 0    50   ~ 0
VAC2
Text Label 800  4500 0    50   ~ 0
VAC1
Wire Wire Line
	4550 3100 4750 3100
Wire Wire Line
	4550 2900 4750 2900
Text Label 4750 2900 0    50   ~ 0
VAC1
Text Label 4750 3100 0    50   ~ 0
VAC2
$Comp
L Connector:Screw_Terminal_01x04 J6
U 1 1 6044C452
P 3750 4750
F 0 "J6" H 3830 4742 50  0000 L CNN
F 1 "MPS" H 3830 4651 50  0000 L CNN
F 2 "Britishideas:PhoenixContact_COMBICON_PT_4" H 3750 4750 50  0001 C CNN
F 3 "~" H 3750 4750 50  0001 C CNN
F 4 "1935792" H 3750 4750 50  0001 C CNN "manf#"
	1    3750 4750
	1    0    0    -1  
$EndComp
Text Label 3200 4650 0    50   ~ 0
MPS-7
Text Label 3200 4950 0    50   ~ 0
MPS-15
Text Label 3200 4850 0    50   ~ 0
MPS-10
Text Label 3200 4750 0    50   ~ 0
MPS-8
Wire Wire Line
	3200 4950 3550 4950
Wire Wire Line
	3550 4850 3200 4850
Wire Wire Line
	3200 4750 3550 4750
Wire Wire Line
	3550 4650 3200 4650
Text Notes 3400 4500 0    50   ~ 0
7 - grey/green\n8 - grey/blue\n10 - grey/red\n15 - grey/black
Text Label 7250 3050 0    50   ~ 0
ECU_TPSIDLE-17
Text Label 8850 2250 0    50   ~ 0
ECU_TPSWOT-2
Text Label 7250 2650 0    50   ~ 0
ECU_TPSACCEL1-9
Text Label 8850 3150 0    50   ~ 0
ECU_TPSACCEL2-20
Text Label 7250 2250 0    50   ~ 0
ECU_AIRTEMP-1
Text Label 7250 3350 0    50   ~ 0
ECU_COOLANTTEMP-23
Wire Wire Line
	8750 2250 8850 2250
Wire Wire Line
	8750 3150 8850 3150
Wire Wire Line
	8250 3350 7250 3350
Wire Wire Line
	7250 3050 8250 3050
Wire Wire Line
	7250 2650 8250 2650
Wire Wire Line
	8250 2250 7250 2250
NoConn ~ 8750 3450
$Comp
L power:+12V #PWR0101
U 1 1 60458EF1
P 10050 2150
AR Path="/60458EF1" Ref="#PWR0101"  Part="1" 
AR Path="/60479334/60458EF1" Ref="#PWR?"  Part="1" 
F 0 "#PWR0101" H 10050 2000 50  0001 C CNN
F 1 "+12V" H 10065 2323 50  0000 C CNN
F 2 "" H 10050 2150 50  0001 C CNN
F 3 "" H 10050 2150 50  0001 C CNN
	1    10050 2150
	-1   0    0    -1  
$EndComp
$Comp
L power:GND #PWR0102
U 1 1 60458EF7
P 7100 3500
AR Path="/60458EF7" Ref="#PWR0102"  Part="1" 
AR Path="/60479334/60458EF7" Ref="#PWR?"  Part="1" 
F 0 "#PWR0102" H 7100 3250 50  0001 C CNN
F 1 "GND" H 7105 3327 50  0000 C CNN
F 2 "" H 7100 3500 50  0001 C CNN
F 3 "" H 7100 3500 50  0001 C CNN
	1    7100 3500
	-1   0    0    -1  
$EndComp
Wire Wire Line
	7100 2750 7100 3500
Wire Wire Line
	7100 2750 8250 2750
Text Label 7250 3250 0    50   ~ 0
ECU_TRIGGERGROUP1-21
Text Label 7250 2850 0    50   ~ 0
ECU_TRIGGERGROUP2-13
Text Label 8850 3250 0    50   ~ 0
ECU_TRIGGERGROUP3-22
Text Label 8850 2850 0    50   ~ 0
ECU_TRIGGERGROUP4-14
Wire Wire Line
	8750 2850 8850 2850
Wire Wire Line
	8750 3250 8850 3250
Wire Wire Line
	8250 3250 7250 3250
Wire Wire Line
	8750 2950 10050 2950
$Comp
L power:GND #PWR0103
U 1 1 60458F18
P 9950 3500
AR Path="/60458F18" Ref="#PWR0103"  Part="1" 
AR Path="/60479334/60458F18" Ref="#PWR?"  Part="1" 
F 0 "#PWR0103" H 9950 3250 50  0001 C CNN
F 1 "GND" H 9955 3327 50  0000 C CNN
F 2 "" H 9950 3500 50  0001 C CNN
F 3 "" H 9950 3500 50  0001 C CNN
	1    9950 3500
	-1   0    0    -1  
$EndComp
Wire Wire Line
	8750 2750 9950 2750
Connection ~ 10050 2950
Text Label 7250 2550 0    50   ~ 0
MPS-7
Text Label 7250 2950 0    50   ~ 0
MPS-15
Text Label 8850 2650 0    50   ~ 0
MPS-10
Text Label 8850 2550 0    50   ~ 0
MPS-8
Wire Wire Line
	8750 2550 8850 2550
Wire Wire Line
	8850 2650 8750 2650
Wire Wire Line
	8250 2550 7250 2550
Wire Wire Line
	7250 2950 8250 2950
Wire Wire Line
	8750 3350 10050 3350
Wire Wire Line
	10050 3350 10050 2950
Wire Wire Line
	10050 2150 10050 2950
Wire Wire Line
	9950 2750 9950 3500
Text Label 7250 2350 0    50   ~ 0
ECU_INJGROUP1-3
Text Label 7250 2450 0    50   ~ 0
ECU_INJGROUP3-5
Text Label 8850 2350 0    50   ~ 0
ECU_INJGROUP2-4
Text Label 8850 2450 0    50   ~ 0
ECU_INJGROUP4-6
$Comp
L Connector_Generic:Conn_02x13_Odd_Even J4
U 1 1 60458EDE
P 8450 2850
F 0 "J4" H 8500 3667 50  0000 C CNN
F 1 "BREAKOUT" H 8500 3576 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x13_P2.54mm_Vertical" H 8450 2850 50  0001 C CNN
F 3 "~" H 8450 2850 50  0001 C CNN
	1    8450 2850
	1    0    0    -1  
$EndComp
Wire Wire Line
	7250 2350 8250 2350
Wire Wire Line
	8750 2350 8850 2350
Wire Wire Line
	8850 2450 8750 2450
Wire Wire Line
	8250 2450 7250 2450
Text Label 8850 3050 0    50   ~ 0
ECU_START-18
Wire Wire Line
	8750 3050 8850 3050
Text Label 7250 3150 0    50   ~ 0
ECU_FUELPUMPRELAY-19
Wire Wire Line
	7250 3150 8250 3150
Text Label 7250 3450 0    50   ~ 0
ECU_DIAGGROUP13-25
Wire Wire Line
	7250 3450 8250 3450
$Comp
L Connector:TestPoint TP5
U 1 1 60446336
P 7850 900
F 0 "TP5" H 7908 1018 50  0000 L CNN
F 1 "5194TR" H 7908 927 50  0000 L CNN
F 2 "Britishideas:5190TR-Colored-Test-Point" H 8050 900 50  0001 C CNN
F 3 "~" H 8050 900 50  0001 C CNN
F 4 "5194TR" H 7850 900 50  0001 C CNN "manf#"
	1    7850 900 
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint TP6
U 1 1 60446DAD
P 8300 900
F 0 "TP6" H 8358 1018 50  0000 L CNN
F 1 "5194TR" H 8358 927 50  0000 L CNN
F 2 "Britishideas:5190TR-Colored-Test-Point" H 8500 900 50  0001 C CNN
F 3 "~" H 8500 900 50  0001 C CNN
F 4 "5194TR" H 8300 900 50  0001 C CNN "manf#"
	1    8300 900 
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint TP7
U 1 1 60447127
P 8750 900
F 0 "TP7" H 8808 1018 50  0000 L CNN
F 1 "5194TR" H 8808 927 50  0000 L CNN
F 2 "Britishideas:5190TR-Colored-Test-Point" H 8950 900 50  0001 C CNN
F 3 "~" H 8950 900 50  0001 C CNN
F 4 "5194TR" H 8750 900 50  0001 C CNN "manf#"
	1    8750 900 
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint TP8
U 1 1 6044750C
P 9200 900
F 0 "TP8" H 9258 1018 50  0000 L CNN
F 1 "5194TR" H 9258 927 50  0000 L CNN
F 2 "Britishideas:5190TR-Colored-Test-Point" H 9400 900 50  0001 C CNN
F 3 "~" H 9400 900 50  0001 C CNN
F 4 "5194TR" H 9200 900 50  0001 C CNN "manf#"
	1    9200 900 
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint TP9
U 1 1 604478C4
P 9650 900
F 0 "TP9" H 9708 1018 50  0000 L CNN
F 1 "5195TR" H 9708 927 50  0000 L CNN
F 2 "Britishideas:5190TR-Colored-Test-Point" H 9850 900 50  0001 C CNN
F 3 "~" H 9850 900 50  0001 C CNN
F 4 "5195TR" H 9650 900 50  0001 C CNN "manf#"
	1    9650 900 
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR053
U 1 1 60447C04
P 9650 1450
AR Path="/60447C04" Ref="#PWR053"  Part="1" 
AR Path="/60479334/60447C04" Ref="#PWR?"  Part="1" 
F 0 "#PWR053" H 9650 1200 50  0001 C CNN
F 1 "GND" H 9655 1277 50  0000 C CNN
F 2 "" H 9650 1450 50  0001 C CNN
F 3 "" H 9650 1450 50  0001 C CNN
	1    9650 1450
	-1   0    0    -1  
$EndComp
Text Label 7850 1700 1    50   ~ 0
ECU_INJGROUP1-3
Text Label 8300 1700 1    50   ~ 0
ECU_INJGROUP2-4
Text Label 8750 1700 1    50   ~ 0
ECU_INJGROUP3-5
Text Label 9200 1700 1    50   ~ 0
ECU_INJGROUP4-6
Text Label 2500 3950 0    50   ~ 0
ECU_START-18
Wire Wire Line
	2400 3950 2500 3950
Wire Wire Line
	1500 3950 800  3950
Text Label 800  3950 0    50   ~ 0
START
Wire Wire Line
	4550 2600 4750 2600
Text Label 4750 2600 0    50   ~ 0
START
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
Text Notes 9650 650  0    50   ~ 0
BROWN
Text Notes 8500 650  0    50   ~ 0
YELLOW
Wire Wire Line
	7850 900  7850 1700
Wire Wire Line
	8300 900  8300 1700
Wire Wire Line
	8750 900  8750 1700
Wire Wire Line
	9200 900  9200 1700
Wire Wire Line
	9650 900  9650 1450
Text Label 4650 5900 0    50   ~ 0
ECU_INJGROUP1-3
Text Label 4650 6000 0    50   ~ 0
ECU_INJGROUP2-4
Text Label 4650 6100 0    50   ~ 0
ECU_INJGROUP3-5
Text Label 4650 6200 0    50   ~ 0
ECU_INJGROUP4-6
Wire Wire Line
	5500 5900 4650 5900
$Comp
L power:GND #PWR044
U 1 1 60560B4D
P 5400 6500
AR Path="/60560B4D" Ref="#PWR044"  Part="1" 
AR Path="/60479334/60560B4D" Ref="#PWR?"  Part="1" 
F 0 "#PWR044" H 5400 6250 50  0001 C CNN
F 1 "GND" H 5405 6327 50  0000 C CNN
F 2 "" H 5400 6500 50  0001 C CNN
F 3 "" H 5400 6500 50  0001 C CNN
	1    5400 6500
	-1   0    0    -1  
$EndComp
Wire Wire Line
	5400 6500 5400 6300
Wire Wire Line
	5500 6300 5400 6300
$Sheet
S 1500 3850 900  300 
U 60469920
F0 "Start" 50
F1 "Start.sch" 50
F2 "ECU_START" O R 2400 3950 50 
F3 "START" I L 1500 3950 50 
$EndSheet
$Comp
L power:GND #PWR012
U 1 1 606CB304
P 7950 5500
AR Path="/606CB304" Ref="#PWR012"  Part="1" 
AR Path="/60479334/606CB304" Ref="#PWR?"  Part="1" 
F 0 "#PWR012" H 7950 5250 50  0001 C CNN
F 1 "GND" H 7955 5327 50  0000 C CNN
F 2 "" H 7950 5500 50  0001 C CNN
F 3 "" H 7950 5500 50  0001 C CNN
	1    7950 5500
	-1   0    0    -1  
$EndComp
$Comp
L power:+12V #PWR048
U 1 1 606CBA90
P 8000 4450
AR Path="/606CBA90" Ref="#PWR048"  Part="1" 
AR Path="/60479334/606CBA90" Ref="#PWR?"  Part="1" 
F 0 "#PWR048" H 8000 4300 50  0001 C CNN
F 1 "+12V" H 8015 4623 50  0000 C CNN
F 2 "" H 8000 4450 50  0001 C CNN
F 3 "" H 8000 4450 50  0001 C CNN
	1    8000 4450
	-1   0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG01
U 1 1 606CBA96
P 8000 4500
AR Path="/606CBA96" Ref="#FLG01"  Part="1" 
AR Path="/60479334/606CBA96" Ref="#FLG?"  Part="1" 
F 0 "#FLG01" H 8000 4575 50  0001 C CNN
F 1 "PWR_FLAG" V 8000 4628 50  0000 L CNN
F 2 "" H 8000 4500 50  0001 C CNN
F 3 "~" H 8000 4500 50  0001 C CNN
	1    8000 4500
	0    1    -1   0   
$EndComp
Wire Wire Line
	8000 4500 8000 4450
Wire Wire Line
	8000 4500 8000 4700
Wire Wire Line
	8000 4700 8100 4700
Connection ~ 8000 4500
Wire Wire Line
	8000 4700 8000 4800
Wire Wire Line
	8000 4800 8100 4800
Connection ~ 8000 4700
Wire Wire Line
	8100 5300 7950 5300
Wire Wire Line
	7950 5300 7950 5400
Text Label 7800 4900 2    50   ~ 0
ECU_INJGROUP1-3
Text Label 7800 5000 2    50   ~ 0
ECU_INJGROUP2-4
Text Label 7800 5100 2    50   ~ 0
ECU_INJGROUP3-5
Text Label 7800 5200 2    50   ~ 0
ECU_INJGROUP4-6
Wire Wire Line
	7800 4900 8100 4900
Wire Wire Line
	8100 5000 7800 5000
Wire Wire Line
	7800 5100 8100 5100
Wire Wire Line
	8100 5200 7800 5200
$Comp
L Connector:Screw_Terminal_01x02 J5
U 1 1 607499F9
P 6500 4600
F 0 "J5" H 6580 4592 50  0000 L CNN
F 1 "12V IN" H 6580 4501 50  0000 L CNN
F 2 "Britishideas:PhoenixContact_COMBICON_MKDSN_2" H 6500 4600 50  0001 C CNN
F 3 "~" H 6500 4600 50  0001 C CNN
F 4 "1729018" H 6500 4600 50  0001 C CNN "manf#"
	1    6500 4600
	-1   0    0    1   
$EndComp
Wire Wire Line
	6700 4500 8000 4500
$Comp
L power:GND #PWR010
U 1 1 60774D44
P 6750 4800
AR Path="/60774D44" Ref="#PWR010"  Part="1" 
AR Path="/60479334/60774D44" Ref="#PWR?"  Part="1" 
F 0 "#PWR010" H 6750 4550 50  0001 C CNN
F 1 "GND" H 6755 4627 50  0000 C CNN
F 2 "" H 6750 4800 50  0001 C CNN
F 3 "" H 6750 4800 50  0001 C CNN
	1    6750 4800
	-1   0    0    -1  
$EndComp
Wire Wire Line
	6750 4800 6750 4600
Wire Wire Line
	6750 4600 6700 4600
$Comp
L Connector:Screw_Terminal_01x08 J2
U 1 1 60815DA7
P 8300 5000
F 0 "J2" H 8380 4992 50  0000 L CNN
F 1 "ECU1" H 8380 4901 50  0000 L CNN
F 2 "Britishideas:PhoenixContact_COMBICON_PT_8" H 8300 5000 50  0001 C CNN
F 3 "~" H 8300 5000 50  0001 C CNN
F 4 "1935831" H 8300 5000 50  0001 C CNN "manf#"
	1    8300 5000
	1    0    0    -1  
$EndComp
Wire Wire Line
	8100 5400 7950 5400
Connection ~ 7950 5400
Wire Wire Line
	7950 5400 7950 5500
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
Text Notes 6450 4350 0    50   ~ 0
Min 3A connector
Text Notes 8000 5550 0    50   ~ 0
Min 3A connector
Text Notes 5500 5750 0    50   ~ 0
Min 3A connector
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
	9900 6100 10100 6100
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
Text Label 9900 6100 2    50   ~ 0
ECU_DIAGGROUP13-25
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
$Comp
L Connector:Screw_Terminal_01x05 J8
U 1 1 606DCB23
P 5700 6100
F 0 "J8" H 5780 6142 50  0000 L CNN
F 1 "INJECTORS" H 5780 6051 50  0000 L CNN
F 2 "Britishideas:PhoenixContact_COMBICON_PT_5" H 5700 6100 50  0001 C CNN
F 3 "~" H 5700 6100 50  0001 C CNN
F 4 "1935190" H 5700 6100 50  0001 C CNN "manf#"
	1    5700 6100
	1    0    0    -1  
$EndComp
Wire Wire Line
	4650 6200 5500 6200
Wire Wire Line
	5500 6100 4650 6100
Wire Wire Line
	4650 6000 5500 6000
Wire Wire Line
	7250 2850 8250 2850
$EndSCHEMATC
