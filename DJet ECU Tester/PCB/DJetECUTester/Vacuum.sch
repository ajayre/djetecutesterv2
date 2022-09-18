EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 6 7
Title "D-Jetronic ECU Tester"
Date "2021-04-04"
Rev "1.1"
Comp "(C) Britishideas 2021"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text HLabel 3500 3100 0    50   Input ~ 0
VAC1
$Comp
L Device:R R?
U 1 1 604F6EDA
P 3750 3100
AR Path="/604BF505/604F6EDA" Ref="R?"  Part="1" 
AR Path="/604F15FC/604F6EDA" Ref="R25"  Part="1" 
F 0 "R25" V 3543 3100 50  0000 C CNN
F 1 "1k" V 3634 3100 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 3680 3100 50  0001 C CNN
F 3 "~" H 3750 3100 50  0001 C CNN
	1    3750 3100
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 604F6EE6
P 4400 3650
AR Path="/604F6EE6" Ref="#PWR?"  Part="1" 
AR Path="/604BF505/604F6EE6" Ref="#PWR?"  Part="1" 
AR Path="/604F15FC/604F6EE6" Ref="#PWR045"  Part="1" 
F 0 "#PWR045" H 4400 3400 50  0001 C CNN
F 1 "GND" H 4405 3477 50  0000 C CNN
F 2 "" H 4400 3650 50  0001 C CNN
F 3 "" H 4400 3650 50  0001 C CNN
	1    4400 3650
	1    0    0    -1  
$EndComp
Wire Wire Line
	3500 3100 3600 3100
$Comp
L Transistor_BJT:MMBT3904 Q?
U 1 1 604F6EEE
P 4300 3100
AR Path="/604BF505/604F6EEE" Ref="Q?"  Part="1" 
AR Path="/604F15FC/604F6EEE" Ref="Q9"  Part="1" 
F 0 "Q9" H 4500 2950 50  0000 L CNN
F 1 "MMBT2222ALT1G" H 4250 2850 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 4500 3025 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N3904.pdf" H 4300 3100 50  0001 L CNN
F 4 "MMBT2222ALT1G" H 4300 3100 50  0001 C CNN "manf#"
	1    4300 3100
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 604F6EF4
P 4000 3350
AR Path="/604BF505/604F6EF4" Ref="R?"  Part="1" 
AR Path="/604F15FC/604F6EF4" Ref="R27"  Part="1" 
F 0 "R27" V 3793 3350 50  0000 C CNN
F 1 "10k" V 3884 3350 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 3930 3350 50  0001 C CNN
F 3 "~" H 4000 3350 50  0001 C CNN
	1    4000 3350
	1    0    0    -1  
$EndComp
Wire Wire Line
	4400 3300 4400 3600
Wire Wire Line
	3900 3100 4000 3100
Wire Wire Line
	4000 3100 4000 3200
Connection ~ 4000 3100
Wire Wire Line
	4000 3100 4100 3100
Wire Wire Line
	4000 3500 4000 3600
Wire Wire Line
	4000 3600 4400 3600
Connection ~ 4400 3600
Wire Wire Line
	4400 3600 4400 3650
$Comp
L Device:R R?
U 1 1 604F6F0F
P 3750 5200
AR Path="/604BF505/604F6F0F" Ref="R?"  Part="1" 
AR Path="/604F15FC/604F6F0F" Ref="R26"  Part="1" 
F 0 "R26" V 3543 5200 50  0000 C CNN
F 1 "1k" V 3634 5200 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 3680 5200 50  0001 C CNN
F 3 "~" H 3750 5200 50  0001 C CNN
	1    3750 5200
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 604F6F1B
P 4400 5750
AR Path="/604F6F1B" Ref="#PWR?"  Part="1" 
AR Path="/604BF505/604F6F1B" Ref="#PWR?"  Part="1" 
AR Path="/604F15FC/604F6F1B" Ref="#PWR046"  Part="1" 
F 0 "#PWR046" H 4400 5500 50  0001 C CNN
F 1 "GND" H 4405 5577 50  0000 C CNN
F 2 "" H 4400 5750 50  0001 C CNN
F 3 "" H 4400 5750 50  0001 C CNN
	1    4400 5750
	1    0    0    -1  
$EndComp
Wire Wire Line
	3500 5200 3600 5200
$Comp
L Transistor_BJT:MMBT3904 Q?
U 1 1 604F6F23
P 4300 5200
AR Path="/604BF505/604F6F23" Ref="Q?"  Part="1" 
AR Path="/604F15FC/604F6F23" Ref="Q10"  Part="1" 
F 0 "Q10" H 4500 5100 50  0000 L CNN
F 1 "MMBT2222ALT1G" H 4250 4950 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 4500 5125 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N3904.pdf" H 4300 5200 50  0001 L CNN
F 4 "MMBT2222ALT1G" H 4300 5200 50  0001 C CNN "manf#"
	1    4300 5200
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 604F6F29
P 4000 5450
AR Path="/604BF505/604F6F29" Ref="R?"  Part="1" 
AR Path="/604F15FC/604F6F29" Ref="R28"  Part="1" 
F 0 "R28" V 3793 5450 50  0000 C CNN
F 1 "10k" V 3884 5450 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 3930 5450 50  0001 C CNN
F 3 "~" H 4000 5450 50  0001 C CNN
	1    4000 5450
	1    0    0    -1  
$EndComp
Wire Wire Line
	4400 5400 4400 5700
Wire Wire Line
	3900 5200 4000 5200
Wire Wire Line
	4000 5200 4000 5300
Connection ~ 4000 5200
Wire Wire Line
	4000 5200 4100 5200
Wire Wire Line
	4000 5600 4000 5700
Wire Wire Line
	4000 5700 4400 5700
Connection ~ 4400 5700
Wire Wire Line
	4400 5700 4400 5750
Text HLabel 3500 5200 0    50   Input ~ 0
VAC2
$Comp
L power:GND #PWR?
U 1 1 6051CD7E
P 7500 4150
AR Path="/6051CD7E" Ref="#PWR?"  Part="1" 
AR Path="/604BF505/6051CD7E" Ref="#PWR?"  Part="1" 
AR Path="/604F15FC/6051CD7E" Ref="#PWR051"  Part="1" 
F 0 "#PWR051" H 7500 3900 50  0001 C CNN
F 1 "GND" H 7505 3977 50  0000 C CNN
F 2 "" H 7500 4150 50  0001 C CNN
F 3 "" H 7500 4150 50  0001 C CNN
	1    7500 4150
	1    0    0    -1  
$EndComp
Wire Wire Line
	7500 4150 7500 3900
Wire Wire Line
	7500 3900 7600 3900
$Comp
L Device:Q_PNP_BEC Q?
U 1 1 604A72F6
P 5150 2800
AR Path="/60469920/604A72F6" Ref="Q?"  Part="1" 
AR Path="/604F15FC/604A72F6" Ref="Q13"  Part="1" 
F 0 "Q13" H 5341 2754 50  0000 L CNN
F 1 "MMBT3906LT1G" H 5341 2845 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 5350 2900 50  0001 C CNN
F 3 "~" H 5150 2800 50  0001 C CNN
F 4 "MMBT3906LT1G" H 5150 2800 50  0001 C CNN "manf#"
	1    5150 2800
	1    0    0    1   
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 6053D995
P 9600 1400
AR Path="/6053D995" Ref="#PWR?"  Part="1" 
AR Path="/604BF505/6053D995" Ref="#PWR?"  Part="1" 
AR Path="/604F15FC/6053D995" Ref="#PWR047"  Part="1" 
F 0 "#PWR047" H 9600 1250 50  0001 C CNN
F 1 "+5V" H 9615 1573 50  0000 C CNN
F 2 "" H 9600 1400 50  0001 C CNN
F 3 "" H 9600 1400 50  0001 C CNN
	1    9600 1400
	1    0    0    -1  
$EndComp
$Comp
L power:+12V #PWR?
U 1 1 6053D628
P 9000 1400
AR Path="/6053D628" Ref="#PWR?"  Part="1" 
AR Path="/60479334/6053D628" Ref="#PWR?"  Part="1" 
AR Path="/604F15FC/6053D628" Ref="#PWR043"  Part="1" 
F 0 "#PWR043" H 9000 1250 50  0001 C CNN
F 1 "+12V" H 9015 1573 50  0000 C CNN
F 2 "" H 9000 1400 50  0001 C CNN
F 3 "" H 9000 1400 50  0001 C CNN
	1    9000 1400
	-1   0    0    -1  
$EndComp
Wire Wire Line
	9400 1900 9600 1900
Wire Wire Line
	9400 1800 9400 1900
Wire Wire Line
	9200 1900 9000 1900
Wire Wire Line
	9200 1800 9200 1900
$Comp
L Connector_Generic:Conn_01x03 JP4
U 1 1 605397C1
P 9300 1600
F 0 "JP4" V 9200 1500 50  0000 R CNN
F 1 "VAC VCC" V 9400 1750 50  0000 R CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Vertical" H 9300 1600 50  0001 C CNN
F 3 "~" H 9300 1600 50  0001 C CNN
	1    9300 1600
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R?
U 1 1 604AE8D1
P 4400 2550
AR Path="/604BF505/604AE8D1" Ref="R?"  Part="1" 
AR Path="/604F15FC/604AE8D1" Ref="R29"  Part="1" 
F 0 "R29" V 4193 2550 50  0000 C CNN
F 1 "10k" V 4284 2550 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 4330 2550 50  0001 C CNN
F 3 "~" H 4400 2550 50  0001 C CNN
	1    4400 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	4400 2300 5250 2300
Wire Wire Line
	5250 2300 5250 2600
Wire Wire Line
	4400 2300 4400 2400
Wire Wire Line
	9000 1400 9000 1900
Wire Wire Line
	9600 1400 9600 1900
Wire Wire Line
	9300 1800 9300 2350
Text Label 9300 2350 1    50   ~ 0
VACVCC
Text Label 5050 2300 2    50   ~ 0
VACVCC
Text Label 7500 3400 2    50   ~ 0
VACVCC
$Comp
L Connector:Screw_Terminal_01x06 J7
U 1 1 604BDF6A
P 7800 3600
F 0 "J7" H 7880 3592 50  0000 L CNN
F 1 "VAC" H 7880 3501 50  0000 L CNN
F 2 "TerminalBlock_TE-Connectivity:TerminalBlock_TE_282834-6_1x06_P2.54mm_Horizontal" H 7800 3600 50  0001 C CNN
F 3 "~" H 7800 3600 50  0001 C CNN
F 4 "282834-6" H 7800 3600 50  0001 C CNN "manf#"
	1    7800 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	7500 3400 7600 3400
$Comp
L Device:R R?
U 1 1 604C2A47
P 4400 4650
AR Path="/604BF505/604C2A47" Ref="R?"  Part="1" 
AR Path="/604F15FC/604C2A47" Ref="R30"  Part="1" 
F 0 "R30" V 4193 4650 50  0000 C CNN
F 1 "10k" V 4284 4650 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 4330 4650 50  0001 C CNN
F 3 "~" H 4400 4650 50  0001 C CNN
	1    4400 4650
	1    0    0    -1  
$EndComp
$Comp
L Device:Q_PNP_BEC Q?
U 1 1 604C38A0
P 5150 4900
AR Path="/60469920/604C38A0" Ref="Q?"  Part="1" 
AR Path="/604F15FC/604C38A0" Ref="Q14"  Part="1" 
F 0 "Q14" H 5341 4854 50  0000 L CNN
F 1 "MMBT3906LT1G" H 5341 4945 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 5350 5000 50  0001 C CNN
F 3 "~" H 5150 4900 50  0001 C CNN
F 4 "MMBT3906LT1G" H 5150 4900 50  0001 C CNN "manf#"
	1    5150 4900
	1    0    0    1   
$EndComp
Wire Wire Line
	5250 4700 5250 4350
Wire Wire Line
	5250 4350 4400 4350
Wire Wire Line
	4400 4350 4400 4500
Text Label 5000 4350 2    50   ~ 0
VACVCC
Wire Wire Line
	5250 5100 5250 5200
$Comp
L Device:R R?
U 1 1 604CC25E
P 5250 3400
AR Path="/604BF505/604CC25E" Ref="R?"  Part="1" 
AR Path="/604F15FC/604CC25E" Ref="R36"  Part="1" 
F 0 "R36" V 5043 3400 50  0000 C CNN
F 1 "10k" V 5134 3400 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 5180 3400 50  0001 C CNN
F 3 "~" H 5250 3400 50  0001 C CNN
	1    5250 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	4400 3600 5250 3600
Wire Wire Line
	5250 3600 5250 3550
$Comp
L Device:R R?
U 1 1 604CE537
P 5250 5500
AR Path="/604BF505/604CE537" Ref="R?"  Part="1" 
AR Path="/604F15FC/604CE537" Ref="R37"  Part="1" 
F 0 "R37" V 5043 5500 50  0000 C CNN
F 1 "10k" V 5134 5500 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 5180 5500 50  0001 C CNN
F 3 "~" H 5250 5500 50  0001 C CNN
	1    5250 5500
	1    0    0    -1  
$EndComp
Wire Wire Line
	4400 5700 5250 5700
Wire Wire Line
	5250 5700 5250 5650
Wire Wire Line
	5250 5350 5250 5200
Connection ~ 5250 5200
Wire Wire Line
	4400 4800 4400 4900
$Comp
L Device:R R?
U 1 1 604D2795
P 4700 4900
AR Path="/604BF505/604D2795" Ref="R?"  Part="1" 
AR Path="/604F15FC/604D2795" Ref="R32"  Part="1" 
F 0 "R32" V 4493 4900 50  0000 C CNN
F 1 "1k" V 4584 4900 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 4630 4900 50  0001 C CNN
F 3 "~" H 4700 4900 50  0001 C CNN
	1    4700 4900
	0    1    1    0   
$EndComp
Wire Wire Line
	4950 4900 4850 4900
Wire Wire Line
	4550 4900 4400 4900
Connection ~ 4400 4900
Wire Wire Line
	4400 4900 4400 5000
Wire Wire Line
	4400 4900 4050 4900
Wire Wire Line
	4050 4900 4050 4200
Wire Wire Line
	4400 2700 4400 2800
$Comp
L Device:R R?
U 1 1 604D5B27
P 4700 2800
AR Path="/604BF505/604D5B27" Ref="R?"  Part="1" 
AR Path="/604F15FC/604D5B27" Ref="R31"  Part="1" 
F 0 "R31" V 4493 2800 50  0000 C CNN
F 1 "1k" V 4584 2800 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 4630 2800 50  0001 C CNN
F 3 "~" H 4700 2800 50  0001 C CNN
	1    4700 2800
	0    1    1    0   
$EndComp
Wire Wire Line
	4950 2800 4850 2800
Wire Wire Line
	4550 2800 4400 2800
Connection ~ 4400 2800
Wire Wire Line
	4400 2800 4400 2900
Wire Wire Line
	4400 2800 4050 2800
Wire Wire Line
	4050 2800 4050 2150
Wire Wire Line
	5250 3000 5250 3100
Connection ~ 5250 3100
Wire Wire Line
	5250 3100 5250 3250
Wire Wire Line
	7150 2150 7150 3500
Wire Wire Line
	7150 3500 7600 3500
Wire Wire Line
	4050 2150 7150 2150
Wire Wire Line
	7050 3100 7050 3600
Wire Wire Line
	7050 3600 7600 3600
Wire Wire Line
	5250 3100 7050 3100
Wire Wire Line
	7050 4200 7050 3700
Wire Wire Line
	7050 3700 7600 3700
Wire Wire Line
	4050 4200 7050 4200
Wire Wire Line
	7150 5200 7150 3800
Wire Wire Line
	7150 3800 7600 3800
Wire Wire Line
	5250 5200 7150 5200
$EndSCHEMATC
