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
P 5750 2000
AR Path="/6051B2E5" Ref="#PWR?"  Part="1" 
AR Path="/60517480/6051B2E5" Ref="#PWR033"  Part="1" 
F 0 "#PWR033" H 5750 1850 50  0001 C CNN
F 1 "+5V" H 5765 2173 50  0000 C CNN
F 2 "" H 5750 2000 50  0001 C CNN
F 3 "" H 5750 2000 50  0001 C CNN
	1    5750 2000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6051D845
P 5850 3450
AR Path="/6051D845" Ref="#PWR?"  Part="1" 
AR Path="/60517480/6051D845" Ref="#PWR035"  Part="1" 
F 0 "#PWR035" H 5850 3200 50  0001 C CNN
F 1 "GND" H 5855 3277 50  0000 C CNN
F 2 "" H 5850 3450 50  0001 C CNN
F 3 "" H 5850 3450 50  0001 C CNN
	1    5850 3450
	1    0    0    -1  
$EndComp
$Comp
L BritishIdeas:MCP41HV51-502E-ST U4
U 1 1 6045CA2E
P 6050 3150
F 0 "U4" H 6350 4115 50  0000 C CNN
F 1 "MCP41HV51-502E-ST" H 6350 4024 50  0000 C CNN
F 2 "Package_SO:TSSOP-14_4.4x5mm_P0.65mm" H 6050 3150 50  0001 C CNN
F 3 "" H 6050 3150 50  0001 C CNN
F 4 "" H 6050 3150 50  0001 C CNN "Field4"
F 5 "MCP41HV51-502E/ST" H 6050 3150 50  0001 C CNN "manf#"
	1    6050 3150
	1    0    0    -1  
$EndComp
Wire Wire Line
	5950 2450 5750 2450
Wire Wire Line
	5750 2450 5750 2050
Wire Wire Line
	6750 2950 6850 2950
Wire Wire Line
	6850 2950 6850 3350
Wire Wire Line
	6850 3350 5850 3350
Wire Wire Line
	5850 3350 5850 3450
Wire Wire Line
	6750 2850 6850 2850
Wire Wire Line
	6850 2850 6850 2950
Connection ~ 6850 2950
Wire Wire Line
	5950 2950 5850 2950
Wire Wire Line
	5850 2950 5850 3350
Connection ~ 5850 3350
Wire Wire Line
	5950 3050 5750 3050
Wire Wire Line
	5750 3050 5750 2450
Connection ~ 5750 2450
Wire Wire Line
	5950 2550 5050 2550
Wire Wire Line
	5950 2650 5450 2650
Wire Wire Line
	5950 2750 5050 2750
Wire Wire Line
	5950 2850 5050 2850
Text HLabel 5050 2550 0    50   Input ~ 0
SCK
Text HLabel 5050 2650 0    50   Input ~ 0
~AIRTEMP_CS
Text HLabel 5050 2750 0    50   Input ~ 0
MOSI
Text HLabel 5050 2850 0    50   Output ~ 0
MISO
$Comp
L power:+12V #PWR?
U 1 1 6045FD70
P 6850 2150
AR Path="/6045FD70" Ref="#PWR?"  Part="1" 
AR Path="/60479334/6045FD70" Ref="#PWR?"  Part="1" 
AR Path="/60517480/6045FD70" Ref="#PWR037"  Part="1" 
F 0 "#PWR037" H 6850 2000 50  0001 C CNN
F 1 "+12V" H 6865 2323 50  0000 C CNN
F 2 "" H 6850 2150 50  0001 C CNN
F 3 "" H 6850 2150 50  0001 C CNN
	1    6850 2150
	-1   0    0    -1  
$EndComp
Wire Wire Line
	6750 2450 6850 2450
Wire Wire Line
	6850 2450 6850 2150
NoConn ~ 6750 2550
Wire Wire Line
	6750 2750 6850 2750
Wire Wire Line
	6850 2750 6850 2850
Connection ~ 6850 2850
Wire Wire Line
	6750 2650 7150 2650
Text HLabel 8300 2650 2    50   Output ~ 0
ECU_AIRTEMP
$Comp
L Connector:TestPoint TP1
U 1 1 60460C5F
P 7150 2550
F 0 "TP1" H 7208 2668 50  0000 L CNN
F 1 "TestPoint" H 7208 2577 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D2.0mm" H 7350 2550 50  0001 C CNN
F 3 "~" H 7350 2550 50  0001 C CNN
	1    7150 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	7150 2550 7150 2650
$Comp
L Connector:TestPoint TP2
U 1 1 60461898
P 7150 2750
F 0 "TP2" H 7092 2776 50  0000 R CNN
F 1 "TestPoint" H 7092 2867 50  0000 R CNN
F 2 "TestPoint:TestPoint_Pad_D2.0mm" H 7350 2750 50  0001 C CNN
F 3 "~" H 7350 2750 50  0001 C CNN
	1    7150 2750
	-1   0    0    1   
$EndComp
Wire Wire Line
	6850 2750 7150 2750
Connection ~ 6850 2750
$Comp
L Connector_Generic:Conn_01x02 JP2
U 1 1 6046304A
P 7700 2450
F 0 "JP2" V 7664 2262 50  0000 R CNN
F 1 "AIRTEMP" V 7573 2262 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x01_P2.54mm_Vertical" H 7700 2450 50  0001 C CNN
F 3 "~" H 7700 2450 50  0001 C CNN
	1    7700 2450
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7150 2650 7700 2650
Connection ~ 7150 2650
Wire Wire Line
	7800 2650 8300 2650
$Comp
L power:+5V #PWR?
U 1 1 60474585
P 5750 4300
AR Path="/60474585" Ref="#PWR?"  Part="1" 
AR Path="/60517480/60474585" Ref="#PWR034"  Part="1" 
F 0 "#PWR034" H 5750 4150 50  0001 C CNN
F 1 "+5V" H 5765 4473 50  0000 C CNN
F 2 "" H 5750 4300 50  0001 C CNN
F 3 "" H 5750 4300 50  0001 C CNN
	1    5750 4300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 6047458B
P 5850 5750
AR Path="/6047458B" Ref="#PWR?"  Part="1" 
AR Path="/60517480/6047458B" Ref="#PWR036"  Part="1" 
F 0 "#PWR036" H 5850 5500 50  0001 C CNN
F 1 "GND" H 5855 5577 50  0000 C CNN
F 2 "" H 5850 5750 50  0001 C CNN
F 3 "" H 5850 5750 50  0001 C CNN
	1    5850 5750
	1    0    0    -1  
$EndComp
$Comp
L BritishIdeas:MCP41HV51-502E-ST U5
U 1 1 60474591
P 6050 5450
F 0 "U5" H 6350 6415 50  0000 C CNN
F 1 "MCP41HV51-502E-ST" H 6350 6324 50  0000 C CNN
F 2 "Package_SO:TSSOP-14_4.4x5mm_P0.65mm" H 6050 5450 50  0001 C CNN
F 3 "" H 6050 5450 50  0001 C CNN
F 4 "MCP41HV51-502E/ST" H 6050 5450 50  0001 C CNN "manf#"
	1    6050 5450
	1    0    0    -1  
$EndComp
Wire Wire Line
	5950 4750 5750 4750
Wire Wire Line
	5750 4750 5750 4350
Wire Wire Line
	6750 5250 6850 5250
Wire Wire Line
	6850 5250 6850 5650
Wire Wire Line
	6850 5650 5850 5650
Wire Wire Line
	5850 5650 5850 5750
Wire Wire Line
	6750 5150 6850 5150
Wire Wire Line
	6850 5150 6850 5250
Connection ~ 6850 5250
Wire Wire Line
	5950 5250 5850 5250
Wire Wire Line
	5850 5250 5850 5650
Connection ~ 5850 5650
Wire Wire Line
	5950 5350 5750 5350
Wire Wire Line
	5750 5350 5750 4750
Connection ~ 5750 4750
Wire Wire Line
	5950 4850 5050 4850
Wire Wire Line
	5950 4950 5450 4950
Wire Wire Line
	5950 5050 5050 5050
Wire Wire Line
	5950 5150 5050 5150
Text HLabel 5050 4850 0    50   Input ~ 0
SCK
Text HLabel 5050 4950 0    50   Input ~ 0
~COOLANTTEMP_CS
Text HLabel 5050 5050 0    50   Input ~ 0
MOSI
Text HLabel 5050 5150 0    50   Output ~ 0
MISO
$Comp
L power:+12V #PWR?
U 1 1 604745AE
P 6850 4450
AR Path="/604745AE" Ref="#PWR?"  Part="1" 
AR Path="/60479334/604745AE" Ref="#PWR?"  Part="1" 
AR Path="/60517480/604745AE" Ref="#PWR038"  Part="1" 
F 0 "#PWR038" H 6850 4300 50  0001 C CNN
F 1 "+12V" H 6865 4623 50  0000 C CNN
F 2 "" H 6850 4450 50  0001 C CNN
F 3 "" H 6850 4450 50  0001 C CNN
	1    6850 4450
	-1   0    0    -1  
$EndComp
Wire Wire Line
	6750 4750 6850 4750
Wire Wire Line
	6850 4750 6850 4450
NoConn ~ 6750 4850
Wire Wire Line
	6750 5050 6850 5050
Wire Wire Line
	6850 5050 6850 5150
Connection ~ 6850 5150
Wire Wire Line
	6750 4950 7150 4950
Text HLabel 8300 4950 2    50   Output ~ 0
ECU_COOLANTTEMP
$Comp
L Connector:TestPoint TP3
U 1 1 604745BC
P 7150 4850
F 0 "TP3" H 7208 4968 50  0000 L CNN
F 1 "TestPoint" H 7208 4877 50  0000 L CNN
F 2 "TestPoint:TestPoint_Pad_D2.0mm" H 7350 4850 50  0001 C CNN
F 3 "~" H 7350 4850 50  0001 C CNN
	1    7150 4850
	1    0    0    -1  
$EndComp
Wire Wire Line
	7150 4850 7150 4950
$Comp
L Connector:TestPoint TP4
U 1 1 604745C3
P 7150 5050
F 0 "TP4" H 7092 5076 50  0000 R CNN
F 1 "TestPoint" H 7092 5167 50  0000 R CNN
F 2 "TestPoint:TestPoint_Pad_D2.0mm" H 7350 5050 50  0001 C CNN
F 3 "~" H 7350 5050 50  0001 C CNN
	1    7150 5050
	-1   0    0    1   
$EndComp
Wire Wire Line
	6850 5050 7150 5050
Connection ~ 6850 5050
$Comp
L Connector_Generic:Conn_01x02 JP3
U 1 1 604745CB
P 7700 4750
F 0 "JP3" V 7664 4562 50  0000 R CNN
F 1 "COOLANTTEMP" V 7573 4562 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x01_P2.54mm_Vertical" H 7700 4750 50  0001 C CNN
F 3 "~" H 7700 4750 50  0001 C CNN
	1    7700 4750
	0    -1   -1   0   
$EndComp
Wire Wire Line
	7150 4950 7700 4950
Connection ~ 7150 4950
Wire Wire Line
	7800 4950 8300 4950
$Comp
L Device:R R15
U 1 1 60475475
P 5450 2300
F 0 "R15" H 5520 2346 50  0000 L CNN
F 1 "100k" H 5520 2255 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 5380 2300 50  0001 C CNN
F 3 "~" H 5450 2300 50  0001 C CNN
	1    5450 2300
	1    0    0    -1  
$EndComp
Wire Wire Line
	5450 2150 5450 2050
Wire Wire Line
	5450 2050 5750 2050
Connection ~ 5750 2050
Wire Wire Line
	5750 2050 5750 2000
Wire Wire Line
	5450 2450 5450 2650
Connection ~ 5450 2650
Wire Wire Line
	5450 2650 5050 2650
$Comp
L Device:R R16
U 1 1 60478DC9
P 5450 4600
F 0 "R16" H 5520 4646 50  0000 L CNN
F 1 "100k" H 5520 4555 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 5380 4600 50  0001 C CNN
F 3 "~" H 5450 4600 50  0001 C CNN
	1    5450 4600
	1    0    0    -1  
$EndComp
Wire Wire Line
	5450 4750 5450 4950
Connection ~ 5450 4950
Wire Wire Line
	5450 4950 5050 4950
Wire Wire Line
	5450 4450 5450 4350
Wire Wire Line
	5450 4350 5750 4350
Connection ~ 5750 4350
Wire Wire Line
	5750 4350 5750 4300
$Comp
L Device:C C16
U 1 1 604B16D0
P 3900 2700
F 0 "C16" H 4015 2746 50  0000 L CNN
F 1 "100nF" H 4015 2655 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 3938 2550 50  0001 C CNN
F 3 "~" H 3900 2700 50  0001 C CNN
	1    3900 2700
	1    0    0    -1  
$EndComp
$Comp
L Device:C C14
U 1 1 604B19D2
P 3350 2700
F 0 "C14" H 3465 2746 50  0000 L CNN
F 1 "100nF" H 3465 2655 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 3388 2550 50  0001 C CNN
F 3 "~" H 3350 2700 50  0001 C CNN
	1    3350 2700
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 604B1CFA
P 3350 2350
AR Path="/604B1CFA" Ref="#PWR?"  Part="1" 
AR Path="/60517480/604B1CFA" Ref="#PWR056"  Part="1" 
F 0 "#PWR056" H 3350 2200 50  0001 C CNN
F 1 "+5V" H 3365 2523 50  0000 C CNN
F 2 "" H 3350 2350 50  0001 C CNN
F 3 "" H 3350 2350 50  0001 C CNN
	1    3350 2350
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 604B2040
P 3350 3050
AR Path="/604B2040" Ref="#PWR?"  Part="1" 
AR Path="/60517480/604B2040" Ref="#PWR057"  Part="1" 
F 0 "#PWR057" H 3350 2800 50  0001 C CNN
F 1 "GND" H 3355 2877 50  0000 C CNN
F 2 "" H 3350 3050 50  0001 C CNN
F 3 "" H 3350 3050 50  0001 C CNN
	1    3350 3050
	1    0    0    -1  
$EndComp
$Comp
L power:+12V #PWR?
U 1 1 604B23FF
P 3900 2350
AR Path="/604B23FF" Ref="#PWR?"  Part="1" 
AR Path="/60479334/604B23FF" Ref="#PWR?"  Part="1" 
AR Path="/60517480/604B23FF" Ref="#PWR060"  Part="1" 
F 0 "#PWR060" H 3900 2200 50  0001 C CNN
F 1 "+12V" H 3915 2523 50  0000 C CNN
F 2 "" H 3900 2350 50  0001 C CNN
F 3 "" H 3900 2350 50  0001 C CNN
	1    3900 2350
	-1   0    0    -1  
$EndComp
Wire Wire Line
	3350 2350 3350 2550
Wire Wire Line
	3900 2350 3900 2550
Wire Wire Line
	3900 2850 3900 2950
Wire Wire Line
	3900 2950 3350 2950
Wire Wire Line
	3350 2950 3350 2850
Wire Wire Line
	3350 2950 3350 3050
Connection ~ 3350 2950
$Comp
L Device:C C17
U 1 1 604B8F64
P 3900 5000
F 0 "C17" H 4015 5046 50  0000 L CNN
F 1 "100nF" H 4015 4955 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 3938 4850 50  0001 C CNN
F 3 "~" H 3900 5000 50  0001 C CNN
	1    3900 5000
	1    0    0    -1  
$EndComp
$Comp
L Device:C C15
U 1 1 604B8F6A
P 3350 5000
F 0 "C15" H 3465 5046 50  0000 L CNN
F 1 "100nF" H 3465 4955 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 3388 4850 50  0001 C CNN
F 3 "~" H 3350 5000 50  0001 C CNN
	1    3350 5000
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 604B8F70
P 3350 4650
AR Path="/604B8F70" Ref="#PWR?"  Part="1" 
AR Path="/60517480/604B8F70" Ref="#PWR058"  Part="1" 
F 0 "#PWR058" H 3350 4500 50  0001 C CNN
F 1 "+5V" H 3365 4823 50  0000 C CNN
F 2 "" H 3350 4650 50  0001 C CNN
F 3 "" H 3350 4650 50  0001 C CNN
	1    3350 4650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 604B8F76
P 3350 5350
AR Path="/604B8F76" Ref="#PWR?"  Part="1" 
AR Path="/60517480/604B8F76" Ref="#PWR059"  Part="1" 
F 0 "#PWR059" H 3350 5100 50  0001 C CNN
F 1 "GND" H 3355 5177 50  0000 C CNN
F 2 "" H 3350 5350 50  0001 C CNN
F 3 "" H 3350 5350 50  0001 C CNN
	1    3350 5350
	1    0    0    -1  
$EndComp
$Comp
L power:+12V #PWR?
U 1 1 604B8F7C
P 3900 4650
AR Path="/604B8F7C" Ref="#PWR?"  Part="1" 
AR Path="/60479334/604B8F7C" Ref="#PWR?"  Part="1" 
AR Path="/60517480/604B8F7C" Ref="#PWR061"  Part="1" 
F 0 "#PWR061" H 3900 4500 50  0001 C CNN
F 1 "+12V" H 3915 4823 50  0000 C CNN
F 2 "" H 3900 4650 50  0001 C CNN
F 3 "" H 3900 4650 50  0001 C CNN
	1    3900 4650
	-1   0    0    -1  
$EndComp
Wire Wire Line
	3350 4650 3350 4850
Wire Wire Line
	3900 4650 3900 4850
Wire Wire Line
	3900 5150 3900 5250
Wire Wire Line
	3900 5250 3350 5250
Wire Wire Line
	3350 5250 3350 5150
Wire Wire Line
	3350 5250 3350 5350
Connection ~ 3350 5250
$EndSCHEMATC
