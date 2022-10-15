EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 7 7
Title "D-Jetronic ECU Tester"
Date "2022-10-15"
Rev "2.1"
Comp "(C) Britishideas 2021-2022"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text HLabel 4400 3800 0    50   Input ~ 0
MCU_START-18
Text HLabel 6800 3850 2    50   Output ~ 0
ECU_START-18
$Comp
L Device:R R48
U 1 1 6351183A
P 4650 3800
F 0 "R48" V 4443 3800 50  0000 C CNN
F 1 "1k" V 4534 3800 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 4580 3800 50  0001 C CNN
F 3 "~" H 4650 3800 50  0001 C CNN
	1    4650 3800
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 63511840
P 5300 4350
AR Path="/63511840" Ref="#PWR?"  Part="1" 
AR Path="/604BF505/63511840" Ref="#PWR?"  Part="1" 
AR Path="/634E02FB/63511840" Ref="#PWR076"  Part="1" 
F 0 "#PWR076" H 5300 4100 50  0001 C CNN
F 1 "GND" H 5305 4177 50  0000 C CNN
F 2 "" H 5300 4350 50  0001 C CNN
F 3 "" H 5300 4350 50  0001 C CNN
	1    5300 4350
	1    0    0    -1  
$EndComp
Wire Wire Line
	4400 3800 4500 3800
$Comp
L Transistor_BJT:MMBT3904 Q13
U 1 1 63511848
P 5200 3800
F 0 "Q13" H 5390 3846 50  0000 L CNN
F 1 "MMBT2222ALT1G" H 5390 3755 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 5400 3725 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N3904.pdf" H 5200 3800 50  0001 L CNN
F 4 "MMBT2222ALT1G" H 5200 3800 50  0001 C CNN "manf#"
	1    5200 3800
	1    0    0    -1  
$EndComp
$Comp
L Device:R R52
U 1 1 6351184E
P 4900 4050
F 0 "R52" V 4693 4050 50  0000 C CNN
F 1 "10k" V 4784 4050 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 4830 4050 50  0001 C CNN
F 3 "~" H 4900 4050 50  0001 C CNN
	1    4900 4050
	1    0    0    -1  
$EndComp
Wire Wire Line
	5300 3500 5300 3550
Wire Wire Line
	5300 4000 5300 4300
Wire Wire Line
	4800 3800 4900 3800
Wire Wire Line
	4900 3800 4900 3900
Connection ~ 4900 3800
Wire Wire Line
	4900 3800 5000 3800
Wire Wire Line
	4900 4200 4900 4300
Wire Wire Line
	4900 4300 5300 4300
Connection ~ 5300 4300
Wire Wire Line
	5300 4300 5300 4350
$Comp
L Device:R R58
U 1 1 6352E54F
P 5300 3350
F 0 "R58" V 5093 3350 50  0000 C CNN
F 1 "10k" V 5184 3350 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 5230 3350 50  0001 C CNN
F 3 "~" H 5300 3350 50  0001 C CNN
	1    5300 3350
	1    0    0    -1  
$EndComp
$Comp
L power:+12V #PWR075
U 1 1 6352EA62
P 5300 3050
F 0 "#PWR075" H 5300 2900 50  0001 C CNN
F 1 "+12V" H 5315 3223 50  0000 C CNN
F 2 "" H 5300 3050 50  0001 C CNN
F 3 "" H 5300 3050 50  0001 C CNN
	1    5300 3050
	1    0    0    -1  
$EndComp
Wire Wire Line
	5300 3050 5300 3100
$Comp
L Device:R R59
U 1 1 6352EF28
P 5650 3550
F 0 "R59" V 5443 3550 50  0000 C CNN
F 1 "1k" V 5534 3550 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 5580 3550 50  0001 C CNN
F 3 "~" H 5650 3550 50  0001 C CNN
	1    5650 3550
	0    1    1    0   
$EndComp
Wire Wire Line
	5500 3550 5300 3550
Connection ~ 5300 3550
Wire Wire Line
	5300 3550 5300 3600
$Comp
L Device:Q_PNP_BEC Q14
U 1 1 6353B833
P 6250 3550
F 0 "Q14" H 6441 3504 50  0000 L CNN
F 1 "MMBT3906LT1G" H 6441 3595 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 6450 3650 50  0001 C CNN
F 3 "~" H 6250 3550 50  0001 C CNN
F 4 "MMBT3906LT1G" H 6250 3550 50  0001 C CNN "manf#"
	1    6250 3550
	1    0    0    1   
$EndComp
Wire Wire Line
	6350 3350 6350 3100
Wire Wire Line
	6350 3100 5300 3100
Connection ~ 5300 3100
Wire Wire Line
	5300 3100 5300 3200
Wire Wire Line
	5800 3550 6050 3550
Wire Wire Line
	6800 3850 6350 3850
Wire Wire Line
	6350 3850 6350 3750
$Comp
L Device:R R60
U 1 1 6353D536
P 6350 4050
F 0 "R60" V 6143 4050 50  0000 C CNN
F 1 "680" V 6234 4050 50  0000 C CNN
F 2 "Resistor_SMD:R_1206_3216Metric" V 6280 4050 50  0001 C CNN
F 3 "~" H 6350 4050 50  0001 C CNN
	1    6350 4050
	1    0    0    -1  
$EndComp
Wire Wire Line
	6350 3900 6350 3850
Connection ~ 6350 3850
Wire Wire Line
	6350 4200 6350 4300
Wire Wire Line
	6350 4300 5300 4300
Text Notes 6450 4100 0    50   ~ 0
Acts like coil in thermo time switch
$EndSCHEMATC
