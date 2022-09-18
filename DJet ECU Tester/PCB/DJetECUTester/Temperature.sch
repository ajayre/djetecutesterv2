EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 4 6
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
L power:+5V #PWR?
U 1 1 6051B2E5
P 3850 1050
AR Path="/6051B2E5" Ref="#PWR?"  Part="1" 
AR Path="/60517480/6051B2E5" Ref="#PWR033"  Part="1" 
F 0 "#PWR033" H 3850 900 50  0001 C CNN
F 1 "+5V" H 3865 1223 50  0000 C CNN
F 2 "" H 3850 1050 50  0001 C CNN
F 3 "" H 3850 1050 50  0001 C CNN
	1    3850 1050
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6051D845
P 3950 2500
AR Path="/6051D845" Ref="#PWR?"  Part="1" 
AR Path="/60517480/6051D845" Ref="#PWR035"  Part="1" 
F 0 "#PWR035" H 3950 2250 50  0001 C CNN
F 1 "GND" H 3955 2327 50  0000 C CNN
F 2 "" H 3950 2500 50  0001 C CNN
F 3 "" H 3950 2500 50  0001 C CNN
	1    3950 2500
	1    0    0    -1  
$EndComp
$Comp
L BritishIdeas:MCP41HV51-502E-ST U4
U 1 1 6045CA2E
P 4150 2200
F 0 "U4" H 4450 3165 50  0000 C CNN
F 1 "MCP41HV51-502E-ST" H 4450 3074 50  0000 C CNN
F 2 "Package_SO:TSSOP-14_4.4x5mm_P0.65mm" H 4150 2200 50  0001 C CNN
F 3 "" H 4150 2200 50  0001 C CNN
F 4 "" H 4150 2200 50  0001 C CNN "Field4"
F 5 "MCP41HV51-502E/ST" H 4150 2200 50  0001 C CNN "manf#"
	1    4150 2200
	1    0    0    -1  
$EndComp
Wire Wire Line
	4050 1500 3850 1500
Wire Wire Line
	3850 1500 3850 1100
Wire Wire Line
	4850 2000 4950 2000
Wire Wire Line
	4950 2000 4950 2400
Wire Wire Line
	4950 2400 3950 2400
Wire Wire Line
	3950 2400 3950 2500
Wire Wire Line
	4850 1900 4950 1900
Wire Wire Line
	4950 1900 4950 2000
Connection ~ 4950 2000
Wire Wire Line
	4050 2000 3950 2000
Wire Wire Line
	3950 2000 3950 2400
Connection ~ 3950 2400
Wire Wire Line
	4050 2100 3850 2100
Wire Wire Line
	3850 2100 3850 1500
Connection ~ 3850 1500
Wire Wire Line
	4050 1600 3150 1600
Wire Wire Line
	4050 1700 3550 1700
Wire Wire Line
	4050 1800 3150 1800
Wire Wire Line
	4050 1900 3150 1900
Text HLabel 3150 1600 0    50   Input ~ 0
SCK
Text HLabel 3150 1700 0    50   Input ~ 0
~AIRTEMP_CS
Text HLabel 3150 1800 0    50   Input ~ 0
MOSI
Text HLabel 3150 1900 0    50   Output ~ 0
MISO
$Comp
L power:+12V #PWR?
U 1 1 6045FD70
P 4950 1200
AR Path="/6045FD70" Ref="#PWR?"  Part="1" 
AR Path="/60479334/6045FD70" Ref="#PWR?"  Part="1" 
AR Path="/60517480/6045FD70" Ref="#PWR037"  Part="1" 
F 0 "#PWR037" H 4950 1050 50  0001 C CNN
F 1 "+12V" H 4965 1373 50  0000 C CNN
F 2 "" H 4950 1200 50  0001 C CNN
F 3 "" H 4950 1200 50  0001 C CNN
	1    4950 1200
	-1   0    0    -1  
$EndComp
Wire Wire Line
	4850 1500 4950 1500
Wire Wire Line
	4950 1500 4950 1200
NoConn ~ 4850 1600
Wire Wire Line
	4850 1800 4950 1800
Wire Wire Line
	4950 1800 4950 1900
Connection ~ 4950 1900
Wire Wire Line
	4850 1700 5250 1700
Text HLabel 6400 1700 2    50   Output ~ 0
ECU_AIRTEMP
$Comp
L Connector:TestPoint TP1
U 1 1 60460C5F
P 5250 1600
F 0 "TP1" H 5308 1718 50  0000 L CNN
F 1 "TestPoint" H 5308 1627 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D2.0mm" H 5450 1600 50  0001 C CNN
F 3 "~" H 5450 1600 50  0001 C CNN
	1    5250 1600
	1    0    0    -1  
$EndComp
Wire Wire Line
	5250 1600 5250 1700
$Comp
L Connector:TestPoint TP2
U 1 1 60461898
P 5250 1800
F 0 "TP2" H 5192 1826 50  0000 R CNN
F 1 "TestPoint" H 5192 1917 50  0000 R CNN
F 2 "TestPoint:TestPoint_Pad_D2.0mm" H 5450 1800 50  0001 C CNN
F 3 "~" H 5450 1800 50  0001 C CNN
	1    5250 1800
	-1   0    0    1   
$EndComp
Wire Wire Line
	4950 1800 5250 1800
Connection ~ 4950 1800
$Comp
L Connector_Generic:Conn_01x02 JP2
U 1 1 6046304A
P 5800 1500
F 0 "JP2" V 5764 1312 50  0000 R CNN
F 1 "AIRTEMP" V 5673 1312 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x01_P2.54mm_Vertical" H 5800 1500 50  0001 C CNN
F 3 "~" H 5800 1500 50  0001 C CNN
	1    5800 1500
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5250 1700 5800 1700
Connection ~ 5250 1700
Wire Wire Line
	5900 1700 6400 1700
$Comp
L power:+5V #PWR?
U 1 1 60474585
P 3850 3350
AR Path="/60474585" Ref="#PWR?"  Part="1" 
AR Path="/60517480/60474585" Ref="#PWR034"  Part="1" 
F 0 "#PWR034" H 3850 3200 50  0001 C CNN
F 1 "+5V" H 3865 3523 50  0000 C CNN
F 2 "" H 3850 3350 50  0001 C CNN
F 3 "" H 3850 3350 50  0001 C CNN
	1    3850 3350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6047458B
P 3950 4800
AR Path="/6047458B" Ref="#PWR?"  Part="1" 
AR Path="/60517480/6047458B" Ref="#PWR036"  Part="1" 
F 0 "#PWR036" H 3950 4550 50  0001 C CNN
F 1 "GND" H 3955 4627 50  0000 C CNN
F 2 "" H 3950 4800 50  0001 C CNN
F 3 "" H 3950 4800 50  0001 C CNN
	1    3950 4800
	1    0    0    -1  
$EndComp
$Comp
L BritishIdeas:MCP41HV51-502E-ST U5
U 1 1 60474591
P 4150 4500
F 0 "U5" H 4450 5465 50  0000 C CNN
F 1 "MCP41HV51-502E-ST" H 4450 5374 50  0000 C CNN
F 2 "Package_SO:TSSOP-14_4.4x5mm_P0.65mm" H 4150 4500 50  0001 C CNN
F 3 "" H 4150 4500 50  0001 C CNN
F 4 "MCP41HV51-502E/ST" H 4150 4500 50  0001 C CNN "manf#"
	1    4150 4500
	1    0    0    -1  
$EndComp
Wire Wire Line
	4050 3800 3850 3800
Wire Wire Line
	3850 3800 3850 3400
Wire Wire Line
	4850 4300 4950 4300
Wire Wire Line
	4950 4300 4950 4700
Wire Wire Line
	4950 4700 3950 4700
Wire Wire Line
	3950 4700 3950 4800
Wire Wire Line
	4850 4200 4950 4200
Wire Wire Line
	4950 4200 4950 4300
Connection ~ 4950 4300
Wire Wire Line
	4050 4300 3950 4300
Wire Wire Line
	3950 4300 3950 4700
Connection ~ 3950 4700
Wire Wire Line
	4050 4400 3850 4400
Wire Wire Line
	3850 4400 3850 3800
Connection ~ 3850 3800
Wire Wire Line
	4050 3900 3150 3900
Wire Wire Line
	4050 4000 3550 4000
Wire Wire Line
	4050 4100 3150 4100
Wire Wire Line
	4050 4200 3150 4200
Text HLabel 3150 3900 0    50   Input ~ 0
SCK
Text HLabel 3150 4000 0    50   Input ~ 0
~COOLANTTEMP_CS
Text HLabel 3150 4100 0    50   Input ~ 0
MOSI
Text HLabel 3150 4200 0    50   Output ~ 0
MISO
$Comp
L power:+12V #PWR?
U 1 1 604745AE
P 4950 3500
AR Path="/604745AE" Ref="#PWR?"  Part="1" 
AR Path="/60479334/604745AE" Ref="#PWR?"  Part="1" 
AR Path="/60517480/604745AE" Ref="#PWR038"  Part="1" 
F 0 "#PWR038" H 4950 3350 50  0001 C CNN
F 1 "+12V" H 4965 3673 50  0000 C CNN
F 2 "" H 4950 3500 50  0001 C CNN
F 3 "" H 4950 3500 50  0001 C CNN
	1    4950 3500
	-1   0    0    -1  
$EndComp
Wire Wire Line
	4850 3800 4950 3800
Wire Wire Line
	4950 3800 4950 3500
NoConn ~ 4850 3900
Wire Wire Line
	4850 4100 4950 4100
Wire Wire Line
	4950 4100 4950 4200
Connection ~ 4950 4200
Wire Wire Line
	4850 4000 5250 4000
Text HLabel 3650 6150 2    50   Output ~ 0
ECU_COOLANTTEMP
$Comp
L Connector:TestPoint TP3
U 1 1 604745BC
P 5250 3900
F 0 "TP3" H 5308 4018 50  0000 L CNN
F 1 "TestPoint" H 5308 3927 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D2.0mm" H 5450 3900 50  0001 C CNN
F 3 "~" H 5450 3900 50  0001 C CNN
	1    5250 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	5250 3900 5250 4000
$Comp
L Connector:TestPoint TP4
U 1 1 604745C3
P 5250 4100
F 0 "TP4" H 5192 4126 50  0000 R CNN
F 1 "TestPoint" H 5192 4217 50  0000 R CNN
F 2 "TestPoint:TestPoint_Pad_D2.0mm" H 5450 4100 50  0001 C CNN
F 3 "~" H 5450 4100 50  0001 C CNN
	1    5250 4100
	-1   0    0    1   
$EndComp
Wire Wire Line
	4950 4100 5250 4100
Connection ~ 4950 4100
$Comp
L Connector_Generic:Conn_01x02 JP3
U 1 1 604745CB
P 5800 3800
F 0 "JP3" V 5764 3612 50  0000 R CNN
F 1 "COOLANTTEMP" V 5673 3612 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x01_P2.54mm_Vertical" H 5800 3800 50  0001 C CNN
F 3 "~" H 5800 3800 50  0001 C CNN
	1    5800 3800
	0    -1   -1   0   
$EndComp
Wire Wire Line
	5250 4000 5800 4000
Connection ~ 5250 4000
$Comp
L Device:R R15
U 1 1 60475475
P 3550 1350
F 0 "R15" H 3620 1396 50  0000 L CNN
F 1 "100k" H 3620 1305 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 3480 1350 50  0001 C CNN
F 3 "~" H 3550 1350 50  0001 C CNN
	1    3550 1350
	1    0    0    -1  
$EndComp
Wire Wire Line
	3550 1200 3550 1100
Wire Wire Line
	3550 1100 3850 1100
Connection ~ 3850 1100
Wire Wire Line
	3850 1100 3850 1050
Wire Wire Line
	3550 1500 3550 1700
Connection ~ 3550 1700
Wire Wire Line
	3550 1700 3150 1700
$Comp
L Device:R R16
U 1 1 60478DC9
P 3550 3650
F 0 "R16" H 3620 3696 50  0000 L CNN
F 1 "100k" H 3620 3605 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 3480 3650 50  0001 C CNN
F 3 "~" H 3550 3650 50  0001 C CNN
	1    3550 3650
	1    0    0    -1  
$EndComp
Wire Wire Line
	3550 3800 3550 4000
Connection ~ 3550 4000
Wire Wire Line
	3550 4000 3150 4000
Wire Wire Line
	3550 3500 3550 3400
Wire Wire Line
	3550 3400 3850 3400
Connection ~ 3850 3400
Wire Wire Line
	3850 3400 3850 3350
$Comp
L Device:C C16
U 1 1 604B16D0
P 2000 1750
F 0 "C16" H 2115 1796 50  0000 L CNN
F 1 "100nF" H 2115 1705 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 2038 1600 50  0001 C CNN
F 3 "~" H 2000 1750 50  0001 C CNN
	1    2000 1750
	1    0    0    -1  
$EndComp
$Comp
L Device:C C14
U 1 1 604B19D2
P 1450 1750
F 0 "C14" H 1565 1796 50  0000 L CNN
F 1 "100nF" H 1565 1705 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 1488 1600 50  0001 C CNN
F 3 "~" H 1450 1750 50  0001 C CNN
	1    1450 1750
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 604B1CFA
P 1450 1400
AR Path="/604B1CFA" Ref="#PWR?"  Part="1" 
AR Path="/60517480/604B1CFA" Ref="#PWR056"  Part="1" 
F 0 "#PWR056" H 1450 1250 50  0001 C CNN
F 1 "+5V" H 1465 1573 50  0000 C CNN
F 2 "" H 1450 1400 50  0001 C CNN
F 3 "" H 1450 1400 50  0001 C CNN
	1    1450 1400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 604B2040
P 1450 2100
AR Path="/604B2040" Ref="#PWR?"  Part="1" 
AR Path="/60517480/604B2040" Ref="#PWR057"  Part="1" 
F 0 "#PWR057" H 1450 1850 50  0001 C CNN
F 1 "GND" H 1455 1927 50  0000 C CNN
F 2 "" H 1450 2100 50  0001 C CNN
F 3 "" H 1450 2100 50  0001 C CNN
	1    1450 2100
	1    0    0    -1  
$EndComp
$Comp
L power:+12V #PWR?
U 1 1 604B23FF
P 2000 1400
AR Path="/604B23FF" Ref="#PWR?"  Part="1" 
AR Path="/60479334/604B23FF" Ref="#PWR?"  Part="1" 
AR Path="/60517480/604B23FF" Ref="#PWR060"  Part="1" 
F 0 "#PWR060" H 2000 1250 50  0001 C CNN
F 1 "+12V" H 2015 1573 50  0000 C CNN
F 2 "" H 2000 1400 50  0001 C CNN
F 3 "" H 2000 1400 50  0001 C CNN
	1    2000 1400
	-1   0    0    -1  
$EndComp
Wire Wire Line
	1450 1400 1450 1600
Wire Wire Line
	2000 1400 2000 1600
Wire Wire Line
	2000 1900 2000 2000
Wire Wire Line
	2000 2000 1450 2000
Wire Wire Line
	1450 2000 1450 1900
Wire Wire Line
	1450 2000 1450 2100
Connection ~ 1450 2000
$Comp
L Device:C C17
U 1 1 604B8F64
P 2000 4050
F 0 "C17" H 2115 4096 50  0000 L CNN
F 1 "100nF" H 2115 4005 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 2038 3900 50  0001 C CNN
F 3 "~" H 2000 4050 50  0001 C CNN
	1    2000 4050
	1    0    0    -1  
$EndComp
$Comp
L Device:C C15
U 1 1 604B8F6A
P 1450 4050
F 0 "C15" H 1565 4096 50  0000 L CNN
F 1 "100nF" H 1565 4005 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 1488 3900 50  0001 C CNN
F 3 "~" H 1450 4050 50  0001 C CNN
	1    1450 4050
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 604B8F70
P 1450 3700
AR Path="/604B8F70" Ref="#PWR?"  Part="1" 
AR Path="/60517480/604B8F70" Ref="#PWR058"  Part="1" 
F 0 "#PWR058" H 1450 3550 50  0001 C CNN
F 1 "+5V" H 1465 3873 50  0000 C CNN
F 2 "" H 1450 3700 50  0001 C CNN
F 3 "" H 1450 3700 50  0001 C CNN
	1    1450 3700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 604B8F76
P 1450 4400
AR Path="/604B8F76" Ref="#PWR?"  Part="1" 
AR Path="/60517480/604B8F76" Ref="#PWR059"  Part="1" 
F 0 "#PWR059" H 1450 4150 50  0001 C CNN
F 1 "GND" H 1455 4227 50  0000 C CNN
F 2 "" H 1450 4400 50  0001 C CNN
F 3 "" H 1450 4400 50  0001 C CNN
	1    1450 4400
	1    0    0    -1  
$EndComp
$Comp
L power:+12V #PWR?
U 1 1 604B8F7C
P 2000 3700
AR Path="/604B8F7C" Ref="#PWR?"  Part="1" 
AR Path="/60479334/604B8F7C" Ref="#PWR?"  Part="1" 
AR Path="/60517480/604B8F7C" Ref="#PWR061"  Part="1" 
F 0 "#PWR061" H 2000 3550 50  0001 C CNN
F 1 "+12V" H 2015 3873 50  0000 C CNN
F 2 "" H 2000 3700 50  0001 C CNN
F 3 "" H 2000 3700 50  0001 C CNN
	1    2000 3700
	-1   0    0    -1  
$EndComp
Wire Wire Line
	1450 3700 1450 3900
Wire Wire Line
	2000 3700 2000 3900
Wire Wire Line
	2000 4200 2000 4300
Wire Wire Line
	2000 4300 1450 4300
Wire Wire Line
	1450 4300 1450 4200
Wire Wire Line
	1450 4300 1450 4400
Connection ~ 1450 4300
Text HLabel 2300 5500 0    50   Input ~ 0
COOLANT_TEMP_1
Text HLabel 2300 5650 0    50   Input ~ 0
COOLANT_TEMP_2
$Comp
L Device:R R?
U 1 1 634C54C6
P 2150 6100
F 0 "R?" H 2220 6146 50  0000 L CNN
F 1 "7k" H 2220 6055 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 2080 6100 50  0001 C CNN
F 3 "~" H 2150 6100 50  0001 C CNN
	1    2150 6100
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 634C5ECD
P 2650 6100
F 0 "R?" H 2720 6146 50  0000 L CNN
F 1 "25k" H 2720 6055 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 2580 6100 50  0001 C CNN
F 3 "~" H 2650 6100 50  0001 C CNN
	1    2650 6100
	1    0    0    -1  
$EndComp
Text Label 6650 4000 0    50   ~ 0
R_BASED_CTEMP
Wire Wire Line
	5900 4000 6650 4000
Text Label 1700 6600 0    50   ~ 0
R_BASED_CTEMP
Text Notes 2650 5650 0    50   ~ 0
7k = 25.21F\n25k = -20.76F
$EndSCHEMATC
