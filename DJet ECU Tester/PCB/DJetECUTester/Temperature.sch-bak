EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 4 7
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
F 6 "MCP41HV31-502E/ST" H 4150 2200 50  0001 C CNN "manf2#"
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
F 5 "MCP41HV31-502E/ST" H 4150 4500 50  0001 C CNN "manf2#"
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
	4050 3900 3400 3900
Wire Wire Line
	4050 4000 3550 4000
Wire Wire Line
	4050 4100 3300 4100
Wire Wire Line
	4050 4200 3200 4200
Text HLabel 3100 3900 0    50   Input ~ 0
SCK
Text HLabel 3100 4000 0    50   Input ~ 0
~COOLANTTEMP1_CS
Text HLabel 3100 4100 0    50   Input ~ 0
MOSI
Text HLabel 3100 4200 0    50   Output ~ 0
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
	4850 4000 5250 4000
Text HLabel 6650 4000 2    50   Output ~ 0
ECU_COOLANTTEMP
$Comp
L Connector:TestPoint TP3
U 1 1 604745BC
P 5250 3900
F 0 "TP3" H 5308 4018 50  0000 L CNN
F 1 "TestPoint" H 5308 3927 50  0001 L CNN
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
F 0 "TP4" H 5200 4250 50  0000 R CNN
F 1 "TestPoint" H 5192 4217 50  0001 R CNN
F 2 "TestPoint:TestPoint_Pad_D2.0mm" H 5450 4100 50  0001 C CNN
F 3 "~" H 5450 4100 50  0001 C CNN
	1    5250 4100
	-1   0    0    1   
$EndComp
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
	3550 4000 3100 4000
Wire Wire Line
	3550 3500 3550 3400
Wire Wire Line
	3550 3400 3850 3400
Connection ~ 3850 3400
Wire Wire Line
	3850 3400 3850 3350
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
P 1850 4050
F 0 "C17" H 1965 4096 50  0000 L CNN
F 1 "100nF" H 1965 4005 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 1888 3900 50  0001 C CNN
F 3 "~" H 1850 4050 50  0001 C CNN
	1    1850 4050
	1    0    0    -1  
$EndComp
$Comp
L Device:C C15
U 1 1 604B8F6A
P 1300 4050
F 0 "C15" H 1415 4096 50  0000 L CNN
F 1 "100nF" H 1415 4005 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 1338 3900 50  0001 C CNN
F 3 "~" H 1300 4050 50  0001 C CNN
	1    1300 4050
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 604B8F70
P 1300 3700
AR Path="/604B8F70" Ref="#PWR?"  Part="1" 
AR Path="/60517480/604B8F70" Ref="#PWR058"  Part="1" 
F 0 "#PWR058" H 1300 3550 50  0001 C CNN
F 1 "+5V" H 1315 3873 50  0000 C CNN
F 2 "" H 1300 3700 50  0001 C CNN
F 3 "" H 1300 3700 50  0001 C CNN
	1    1300 3700
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 604B8F76
P 1300 4400
AR Path="/604B8F76" Ref="#PWR?"  Part="1" 
AR Path="/60517480/604B8F76" Ref="#PWR059"  Part="1" 
F 0 "#PWR059" H 1300 4150 50  0001 C CNN
F 1 "GND" H 1305 4227 50  0000 C CNN
F 2 "" H 1300 4400 50  0001 C CNN
F 3 "" H 1300 4400 50  0001 C CNN
	1    1300 4400
	1    0    0    -1  
$EndComp
$Comp
L power:+12V #PWR?
U 1 1 604B8F7C
P 1850 3700
AR Path="/604B8F7C" Ref="#PWR?"  Part="1" 
AR Path="/60479334/604B8F7C" Ref="#PWR?"  Part="1" 
AR Path="/60517480/604B8F7C" Ref="#PWR061"  Part="1" 
F 0 "#PWR061" H 1850 3550 50  0001 C CNN
F 1 "+12V" H 1865 3873 50  0000 C CNN
F 2 "" H 1850 3700 50  0001 C CNN
F 3 "" H 1850 3700 50  0001 C CNN
	1    1850 3700
	-1   0    0    -1  
$EndComp
Wire Wire Line
	1300 3700 1300 3900
Wire Wire Line
	1850 3700 1850 3900
Wire Wire Line
	1850 4200 1850 4300
Wire Wire Line
	1850 4300 1300 4300
Wire Wire Line
	1300 4300 1300 4200
Wire Wire Line
	1300 4300 1300 4400
Connection ~ 1300 4300
Wire Wire Line
	5900 4000 6650 4000
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
L BritishIdeas:MCP41HV51-502E-ST U7
U 1 1 632D874D
P 4150 6450
F 0 "U7" H 4450 7415 50  0000 C CNN
F 1 "MCP41HV51-502E-ST" H 4450 7324 50  0000 C CNN
F 2 "Package_SO:TSSOP-14_4.4x5mm_P0.65mm" H 4150 6450 50  0001 C CNN
F 3 "" H 4150 6450 50  0001 C CNN
F 4 "MCP41HV51-502E/ST" H 4150 6450 50  0001 C CNN "manf#"
F 5 "MCP41HV31-502E/ST" H 4150 6450 50  0001 C CNN "manf2#"
	1    4150 6450
	1    0    0    -1  
$EndComp
Wire Wire Line
	4850 6250 4950 6250
Wire Wire Line
	4850 6150 4950 6150
Wire Wire Line
	4850 6050 4950 6050
$Comp
L power:+12V #PWR?
U 1 1 632DCECC
P 5000 5450
AR Path="/632DCECC" Ref="#PWR?"  Part="1" 
AR Path="/60479334/632DCECC" Ref="#PWR?"  Part="1" 
AR Path="/60517480/632DCECC" Ref="#PWR070"  Part="1" 
F 0 "#PWR070" H 5000 5300 50  0001 C CNN
F 1 "+12V" H 5015 5623 50  0000 C CNN
F 2 "" H 5000 5450 50  0001 C CNN
F 3 "" H 5000 5450 50  0001 C CNN
	1    5000 5450
	-1   0    0    -1  
$EndComp
Wire Wire Line
	5000 5450 5000 5750
Wire Wire Line
	4850 5750 5000 5750
$Comp
L power:GND #PWR?
U 1 1 632DF347
P 3950 6750
AR Path="/632DF347" Ref="#PWR?"  Part="1" 
AR Path="/60517480/632DF347" Ref="#PWR069"  Part="1" 
F 0 "#PWR069" H 3950 6500 50  0001 C CNN
F 1 "GND" H 3955 6577 50  0000 C CNN
F 2 "" H 3950 6750 50  0001 C CNN
F 3 "" H 3950 6750 50  0001 C CNN
	1    3950 6750
	1    0    0    -1  
$EndComp
Wire Wire Line
	4950 6250 4950 6650
Wire Wire Line
	4950 6650 3950 6650
Wire Wire Line
	3950 6650 3950 6750
Wire Wire Line
	3950 6250 3950 6650
Connection ~ 3950 6650
Wire Wire Line
	4050 6250 3950 6250
Wire Wire Line
	4950 6250 4950 6150
Connection ~ 4950 6250
Wire Wire Line
	4950 6150 4950 6050
Connection ~ 4950 6150
$Comp
L power:+5V #PWR?
U 1 1 632E7C0D
P 3850 5300
AR Path="/632E7C0D" Ref="#PWR?"  Part="1" 
AR Path="/60517480/632E7C0D" Ref="#PWR068"  Part="1" 
F 0 "#PWR068" H 3850 5150 50  0001 C CNN
F 1 "+5V" H 3865 5473 50  0000 C CNN
F 2 "" H 3850 5300 50  0001 C CNN
F 3 "" H 3850 5300 50  0001 C CNN
	1    3850 5300
	1    0    0    -1  
$EndComp
Wire Wire Line
	4050 5750 3850 5750
Wire Wire Line
	3850 5750 3850 5350
Wire Wire Line
	3850 6350 3850 5750
Connection ~ 3850 5750
$Comp
L Device:R R45
U 1 1 632E7E33
P 3550 5600
F 0 "R45" H 3620 5646 50  0000 L CNN
F 1 "100k" H 3620 5555 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 3480 5600 50  0001 C CNN
F 3 "~" H 3550 5600 50  0001 C CNN
	1    3550 5600
	1    0    0    -1  
$EndComp
Wire Wire Line
	3550 5750 3550 5950
Wire Wire Line
	3550 5450 3550 5350
Wire Wire Line
	3550 5350 3850 5350
Connection ~ 3850 5350
Wire Wire Line
	3850 5350 3850 5300
Wire Wire Line
	3850 6350 4050 6350
Wire Wire Line
	4050 5950 3550 5950
Wire Wire Line
	3550 5950 3100 5950
Connection ~ 3550 5950
$Comp
L Device:C C20
U 1 1 632F35E4
P 1850 6000
F 0 "C20" H 1965 6046 50  0000 L CNN
F 1 "100nF" H 1965 5955 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 1888 5850 50  0001 C CNN
F 3 "~" H 1850 6000 50  0001 C CNN
	1    1850 6000
	1    0    0    -1  
$EndComp
$Comp
L Device:C C19
U 1 1 632F3828
P 1300 6000
F 0 "C19" H 1415 6046 50  0000 L CNN
F 1 "100nF" H 1415 5955 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 1338 5850 50  0001 C CNN
F 3 "~" H 1300 6000 50  0001 C CNN
	1    1300 6000
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 632F3832
P 1300 5650
AR Path="/632F3832" Ref="#PWR?"  Part="1" 
AR Path="/60517480/632F3832" Ref="#PWR065"  Part="1" 
F 0 "#PWR065" H 1300 5500 50  0001 C CNN
F 1 "+5V" H 1315 5823 50  0000 C CNN
F 2 "" H 1300 5650 50  0001 C CNN
F 3 "" H 1300 5650 50  0001 C CNN
	1    1300 5650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 632F383C
P 1300 6350
AR Path="/632F383C" Ref="#PWR?"  Part="1" 
AR Path="/60517480/632F383C" Ref="#PWR066"  Part="1" 
F 0 "#PWR066" H 1300 6100 50  0001 C CNN
F 1 "GND" H 1305 6177 50  0000 C CNN
F 2 "" H 1300 6350 50  0001 C CNN
F 3 "" H 1300 6350 50  0001 C CNN
	1    1300 6350
	1    0    0    -1  
$EndComp
$Comp
L power:+12V #PWR?
U 1 1 632F3846
P 1850 5650
AR Path="/632F3846" Ref="#PWR?"  Part="1" 
AR Path="/60479334/632F3846" Ref="#PWR?"  Part="1" 
AR Path="/60517480/632F3846" Ref="#PWR067"  Part="1" 
F 0 "#PWR067" H 1850 5500 50  0001 C CNN
F 1 "+12V" H 1865 5823 50  0000 C CNN
F 2 "" H 1850 5650 50  0001 C CNN
F 3 "" H 1850 5650 50  0001 C CNN
	1    1850 5650
	-1   0    0    -1  
$EndComp
Wire Wire Line
	1300 5650 1300 5850
Wire Wire Line
	1850 5650 1850 5850
Wire Wire Line
	1850 6150 1850 6250
Wire Wire Line
	1850 6250 1300 6250
Wire Wire Line
	1300 6250 1300 6150
Wire Wire Line
	1300 6250 1300 6350
Connection ~ 1300 6250
Wire Wire Line
	4050 5850 3400 5850
Wire Wire Line
	3400 5850 3400 3900
Connection ~ 3400 3900
Wire Wire Line
	3400 3900 3100 3900
Wire Wire Line
	4050 6050 3300 6050
Wire Wire Line
	3300 6050 3300 4100
Connection ~ 3300 4100
Wire Wire Line
	3300 4100 3100 4100
Wire Wire Line
	4050 6150 3200 6150
Wire Wire Line
	3200 6150 3200 4200
Connection ~ 3200 4200
Wire Wire Line
	3200 4200 3100 4200
Text HLabel 3100 5950 0    50   Input ~ 0
~COOLANTTEMP2_CS
$Comp
L Connector_Generic:Conn_01x02 JP1
U 1 1 63319BD8
P 5400 4450
F 0 "JP1" H 5650 4350 50  0000 R CNN
F 1 "COOLANTTEMP" H 6000 4450 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x01_P2.54mm_Vertical" H 5400 4450 50  0001 C CNN
F 3 "~" H 5400 4450 50  0001 C CNN
	1    5400 4450
	1    0    0    -1  
$EndComp
Wire Wire Line
	5150 5950 4850 5950
Wire Wire Line
	4850 4100 5150 4100
Wire Wire Line
	5150 4100 5150 4450
Wire Wire Line
	5150 4450 5200 4450
Connection ~ 5150 4100
Wire Wire Line
	5150 4100 5250 4100
Wire Wire Line
	5200 4550 5150 4550
$Comp
L Connector:TestPoint TP10
U 1 1 6332AC7D
P 5300 5950
F 0 "TP10" V 5300 6150 50  0000 L CNN
F 1 "TestPoint" V 5400 5950 50  0001 L CNN
F 2 "TestPoint:TestPoint_Pad_D2.0mm" H 5500 5950 50  0001 C CNN
F 3 "~" H 5500 5950 50  0001 C CNN
	1    5300 5950
	0    1    1    0   
$EndComp
$Comp
L Connector:TestPoint TP11
U 1 1 6332EF6D
P 5300 6050
F 0 "TP11" V 5300 6400 50  0000 R CNN
F 1 "TestPoint" V 5400 6300 50  0001 R CNN
F 2 "TestPoint:TestPoint_Pad_D2.0mm" H 5500 6050 50  0001 C CNN
F 3 "~" H 5500 6050 50  0001 C CNN
	1    5300 6050
	0    1    1    0   
$EndComp
Wire Wire Line
	5300 6050 4950 6050
Connection ~ 4950 6050
Wire Wire Line
	5150 4550 5150 5950
Wire Wire Line
	5300 5950 5150 5950
Connection ~ 5150 5950
NoConn ~ 4850 5850
$EndSCHEMATC
