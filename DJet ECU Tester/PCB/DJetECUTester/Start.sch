EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 7 7
Title "D-Jetronic ECU Tester"
Date "2021-04-04"
Rev "1.1"
Comp "(C) Britishideas 2021"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text HLabel 6950 4150 2    50   Output ~ 0
ECU_START
Text HLabel 4450 4100 0    50   Input ~ 0
START
$Comp
L Device:R R?
U 1 1 60493C1A
P 4700 4100
AR Path="/604BF505/60493C1A" Ref="R?"  Part="1" 
AR Path="/60469920/60493C1A" Ref="R33"  Part="1" 
F 0 "R33" V 4493 4100 50  0000 C CNN
F 1 "1k" V 4584 4100 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 4630 4100 50  0001 C CNN
F 3 "~" H 4700 4100 50  0001 C CNN
	1    4700 4100
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 60493C20
P 5350 4650
AR Path="/60493C20" Ref="#PWR?"  Part="1" 
AR Path="/604BF505/60493C20" Ref="#PWR?"  Part="1" 
AR Path="/60469920/60493C20" Ref="#PWR055"  Part="1" 
F 0 "#PWR055" H 5350 4400 50  0001 C CNN
F 1 "GND" H 5355 4477 50  0000 C CNN
F 2 "" H 5350 4650 50  0001 C CNN
F 3 "" H 5350 4650 50  0001 C CNN
	1    5350 4650
	1    0    0    -1  
$EndComp
Wire Wire Line
	4450 4100 4550 4100
$Comp
L Transistor_BJT:MMBT3904 Q?
U 1 1 60493C28
P 5250 4100
AR Path="/604BF505/60493C28" Ref="Q?"  Part="1" 
AR Path="/60469920/60493C28" Ref="Q11"  Part="1" 
F 0 "Q11" H 5440 4146 50  0000 L CNN
F 1 "MMBT2222ALT1G" H 5440 4055 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 5450 4025 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N3904.pdf" H 5250 4100 50  0001 L CNN
F 4 "MMBT2222ALT1G" H 5250 4100 50  0001 C CNN "manf#"
	1    5250 4100
	1    0    0    -1  
$EndComp
$Comp
L Device:R R?
U 1 1 60493C2E
P 4950 4350
AR Path="/604BF505/60493C2E" Ref="R?"  Part="1" 
AR Path="/60469920/60493C2E" Ref="R34"  Part="1" 
F 0 "R34" V 4743 4350 50  0000 C CNN
F 1 "10k" V 4834 4350 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 4880 4350 50  0001 C CNN
F 3 "~" H 4950 4350 50  0001 C CNN
	1    4950 4350
	1    0    0    -1  
$EndComp
Wire Wire Line
	5350 4300 5350 4600
Wire Wire Line
	4850 4100 4950 4100
Wire Wire Line
	4950 4100 4950 4200
Connection ~ 4950 4100
Wire Wire Line
	4950 4100 5050 4100
Wire Wire Line
	4950 4500 4950 4600
Wire Wire Line
	4950 4600 5350 4600
Connection ~ 5350 4600
Wire Wire Line
	5350 4600 5350 4650
$Comp
L Device:Q_PNP_BEC Q12
U 1 1 6049479C
P 6100 3850
F 0 "Q12" H 6291 3804 50  0000 L CNN
F 1 "MMBT3906LT1G" H 6291 3895 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 6300 3950 50  0001 C CNN
F 3 "~" H 6100 3850 50  0001 C CNN
F 4 "MMBT3906LT1G" H 6100 3850 50  0001 C CNN "manf#"
	1    6100 3850
	1    0    0    1   
$EndComp
$Comp
L Device:R R?
U 1 1 60494E3C
P 5350 3650
AR Path="/604BF505/60494E3C" Ref="R?"  Part="1" 
AR Path="/60469920/60494E3C" Ref="R35"  Part="1" 
F 0 "R35" V 5143 3650 50  0000 C CNN
F 1 "10k" V 5234 3650 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 5280 3650 50  0001 C CNN
F 3 "~" H 5350 3650 50  0001 C CNN
	1    5350 3650
	1    0    0    -1  
$EndComp
$Comp
L power:+12V #PWR?
U 1 1 60495295
P 5350 3400
AR Path="/60495295" Ref="#PWR?"  Part="1" 
AR Path="/60479334/60495295" Ref="#PWR?"  Part="1" 
AR Path="/60469920/60495295" Ref="#PWR054"  Part="1" 
F 0 "#PWR054" H 5350 3250 50  0001 C CNN
F 1 "+12V" H 5365 3573 50  0000 C CNN
F 2 "" H 5350 3400 50  0001 C CNN
F 3 "" H 5350 3400 50  0001 C CNN
	1    5350 3400
	-1   0    0    -1  
$EndComp
Wire Wire Line
	5350 3400 5350 3450
Wire Wire Line
	6200 3650 6200 3450
Wire Wire Line
	6200 3450 5350 3450
Connection ~ 5350 3450
Wire Wire Line
	5350 3450 5350 3500
Wire Wire Line
	6200 4050 6200 4150
Wire Wire Line
	6200 4150 6950 4150
$Comp
L Device:R R?
U 1 1 6050F32C
P 5650 3850
AR Path="/604BF505/6050F32C" Ref="R?"  Part="1" 
AR Path="/60469920/6050F32C" Ref="R38"  Part="1" 
F 0 "R38" V 5443 3850 50  0000 C CNN
F 1 "1k" V 5534 3850 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 5580 3850 50  0001 C CNN
F 3 "~" H 5650 3850 50  0001 C CNN
	1    5650 3850
	0    1    1    0   
$EndComp
Wire Wire Line
	5350 3800 5350 3850
Wire Wire Line
	5800 3850 5900 3850
Wire Wire Line
	5500 3850 5350 3850
Connection ~ 5350 3850
Wire Wire Line
	5350 3850 5350 3900
$EndSCHEMATC
