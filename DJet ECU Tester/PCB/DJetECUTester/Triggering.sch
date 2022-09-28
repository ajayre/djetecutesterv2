EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 5 6
Title "D-Jetronic ECU Tester"
Date "2022-09-27"
Rev "2.0"
Comp "(C) Britishideas 2021-2022"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Device:R R17
U 1 1 60472D90
P 3200 2950
F 0 "R17" V 2993 2950 50  0000 C CNN
F 1 "1k" V 3084 2950 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 3130 2950 50  0001 C CNN
F 3 "~" H 3200 2950 50  0001 C CNN
	1    3200 2950
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 60472D9C
P 3850 3500
AR Path="/60472D9C" Ref="#PWR?"  Part="1" 
AR Path="/604BF505/60472D9C" Ref="#PWR?"  Part="1" 
AR Path="/6046850B/60472D9C" Ref="#PWR039"  Part="1" 
F 0 "#PWR039" H 3850 3250 50  0001 C CNN
F 1 "GND" H 3855 3327 50  0000 C CNN
F 2 "" H 3850 3500 50  0001 C CNN
F 3 "" H 3850 3500 50  0001 C CNN
	1    3850 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	2950 2950 3050 2950
$Comp
L Transistor_BJT:MMBT3904 Q5
U 1 1 60472DA4
P 3750 2950
F 0 "Q5" H 3940 2996 50  0000 L CNN
F 1 "MMBT2222ALT1G" H 3940 2905 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 3950 2875 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N3904.pdf" H 3750 2950 50  0001 L CNN
F 4 "MMBT2222ALT1G" H 3750 2950 50  0001 C CNN "manf#"
	1    3750 2950
	1    0    0    -1  
$EndComp
$Comp
L Device:R R19
U 1 1 60472DAA
P 3450 3200
F 0 "R19" V 3243 3200 50  0000 C CNN
F 1 "10k" V 3334 3200 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 3380 3200 50  0001 C CNN
F 3 "~" H 3450 3200 50  0001 C CNN
	1    3450 3200
	1    0    0    -1  
$EndComp
Wire Wire Line
	3850 2650 3850 2750
Wire Wire Line
	3850 3150 3850 3450
Wire Wire Line
	3350 2950 3450 2950
Wire Wire Line
	3450 2950 3450 3050
Connection ~ 3450 2950
Wire Wire Line
	3450 2950 3550 2950
Wire Wire Line
	3450 3350 3450 3450
Wire Wire Line
	3450 3450 3850 3450
Connection ~ 3850 3450
Wire Wire Line
	3850 3450 3850 3500
Wire Wire Line
	3850 2650 4650 2650
$Comp
L Device:R R18
U 1 1 60472DC5
P 3200 4850
F 0 "R18" V 2993 4850 50  0000 C CNN
F 1 "1k" V 3084 4850 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 3130 4850 50  0001 C CNN
F 3 "~" H 3200 4850 50  0001 C CNN
	1    3200 4850
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 60472DD1
P 3850 5400
AR Path="/60472DD1" Ref="#PWR?"  Part="1" 
AR Path="/604BF505/60472DD1" Ref="#PWR?"  Part="1" 
AR Path="/6046850B/60472DD1" Ref="#PWR040"  Part="1" 
F 0 "#PWR040" H 3850 5150 50  0001 C CNN
F 1 "GND" H 3855 5227 50  0000 C CNN
F 2 "" H 3850 5400 50  0001 C CNN
F 3 "" H 3850 5400 50  0001 C CNN
	1    3850 5400
	1    0    0    -1  
$EndComp
Wire Wire Line
	2950 4850 3050 4850
$Comp
L Transistor_BJT:MMBT3904 Q6
U 1 1 60472DD9
P 3750 4850
F 0 "Q6" H 3940 4896 50  0000 L CNN
F 1 "MMBT2222ALT1G" H 3940 4805 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 3950 4775 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N3904.pdf" H 3750 4850 50  0001 L CNN
F 4 "MMBT2222ALT1G" H 3750 4850 50  0001 C CNN "manf#"
	1    3750 4850
	1    0    0    -1  
$EndComp
$Comp
L Device:R R20
U 1 1 60472DDF
P 3450 5100
F 0 "R20" V 3243 5100 50  0000 C CNN
F 1 "10k" V 3334 5100 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 3380 5100 50  0001 C CNN
F 3 "~" H 3450 5100 50  0001 C CNN
	1    3450 5100
	1    0    0    -1  
$EndComp
Wire Wire Line
	3850 4550 3850 4650
Wire Wire Line
	3850 5050 3850 5350
Wire Wire Line
	3350 4850 3450 4850
Wire Wire Line
	3450 4850 3450 4950
Connection ~ 3450 4850
Wire Wire Line
	3450 4850 3550 4850
Wire Wire Line
	3450 5250 3450 5350
Wire Wire Line
	3450 5350 3850 5350
Connection ~ 3850 5350
Wire Wire Line
	3850 5350 3850 5400
Wire Wire Line
	3850 4550 4650 4550
$Comp
L Device:R R21
U 1 1 60472DFB
P 6900 3000
F 0 "R21" V 6693 3000 50  0000 C CNN
F 1 "1k" V 6784 3000 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 6830 3000 50  0001 C CNN
F 3 "~" H 6900 3000 50  0001 C CNN
	1    6900 3000
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 60472E07
P 7550 3550
AR Path="/60472E07" Ref="#PWR?"  Part="1" 
AR Path="/604BF505/60472E07" Ref="#PWR?"  Part="1" 
AR Path="/6046850B/60472E07" Ref="#PWR041"  Part="1" 
F 0 "#PWR041" H 7550 3300 50  0001 C CNN
F 1 "GND" H 7555 3377 50  0000 C CNN
F 2 "" H 7550 3550 50  0001 C CNN
F 3 "" H 7550 3550 50  0001 C CNN
	1    7550 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	6650 3000 6750 3000
$Comp
L Transistor_BJT:MMBT3904 Q7
U 1 1 60472E0F
P 7450 3000
F 0 "Q7" H 7640 3046 50  0000 L CNN
F 1 "MMBT2222ALT1G" H 7640 2955 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 7650 2925 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N3904.pdf" H 7450 3000 50  0001 L CNN
F 4 "MMBT2222ALT1G" H 7450 3000 50  0001 C CNN "manf#"
	1    7450 3000
	1    0    0    -1  
$EndComp
$Comp
L Device:R R23
U 1 1 60472E15
P 7150 3250
F 0 "R23" V 6943 3250 50  0000 C CNN
F 1 "10k" V 7034 3250 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 7080 3250 50  0001 C CNN
F 3 "~" H 7150 3250 50  0001 C CNN
	1    7150 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	7550 2700 7550 2800
Wire Wire Line
	7550 3200 7550 3500
Wire Wire Line
	7050 3000 7150 3000
Wire Wire Line
	7150 3000 7150 3100
Connection ~ 7150 3000
Wire Wire Line
	7150 3000 7250 3000
Wire Wire Line
	7150 3400 7150 3500
Wire Wire Line
	7150 3500 7550 3500
Connection ~ 7550 3500
Wire Wire Line
	7550 3500 7550 3550
Wire Wire Line
	7550 2700 8350 2700
$Comp
L Device:R R22
U 1 1 60472E2F
P 6900 4900
F 0 "R22" V 6693 4900 50  0000 C CNN
F 1 "1k" V 6784 4900 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 6830 4900 50  0001 C CNN
F 3 "~" H 6900 4900 50  0001 C CNN
	1    6900 4900
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 60472E3B
P 7550 5450
AR Path="/60472E3B" Ref="#PWR?"  Part="1" 
AR Path="/604BF505/60472E3B" Ref="#PWR?"  Part="1" 
AR Path="/6046850B/60472E3B" Ref="#PWR042"  Part="1" 
F 0 "#PWR042" H 7550 5200 50  0001 C CNN
F 1 "GND" H 7555 5277 50  0000 C CNN
F 2 "" H 7550 5450 50  0001 C CNN
F 3 "" H 7550 5450 50  0001 C CNN
	1    7550 5450
	1    0    0    -1  
$EndComp
Wire Wire Line
	6650 4900 6750 4900
$Comp
L Transistor_BJT:MMBT3904 Q8
U 1 1 60472E43
P 7450 4900
F 0 "Q8" H 7640 4946 50  0000 L CNN
F 1 "MMBT2222ALT1G" H 7640 4855 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 7650 4825 50  0001 L CIN
F 3 "https://www.fairchildsemi.com/datasheets/2N/2N3904.pdf" H 7450 4900 50  0001 L CNN
F 4 "MMBT2222ALT1G" H 7450 4900 50  0001 C CNN "manf#"
	1    7450 4900
	1    0    0    -1  
$EndComp
$Comp
L Device:R R24
U 1 1 60472E49
P 7150 5150
F 0 "R24" V 6943 5150 50  0000 C CNN
F 1 "10k" V 7034 5150 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" V 7080 5150 50  0001 C CNN
F 3 "~" H 7150 5150 50  0001 C CNN
	1    7150 5150
	1    0    0    -1  
$EndComp
Wire Wire Line
	7550 4600 7550 4700
Wire Wire Line
	7550 5100 7550 5400
Wire Wire Line
	7050 4900 7150 4900
Wire Wire Line
	7150 4900 7150 5000
Connection ~ 7150 4900
Wire Wire Line
	7150 4900 7250 4900
Wire Wire Line
	7150 5300 7150 5400
Wire Wire Line
	7150 5400 7550 5400
Connection ~ 7550 5400
Wire Wire Line
	7550 5400 7550 5450
Wire Wire Line
	7550 4600 8350 4600
Text HLabel 4650 2650 2    50   Output ~ 0
ECU_TRIGGERGROUP1
Text HLabel 8350 2700 2    50   Output ~ 0
ECU_TRIGGERGROUP2
Text HLabel 4650 4550 2    50   Output ~ 0
ECU_TRIGGERGROUP3
Text HLabel 8350 4600 2    50   Output ~ 0
ECU_TRIGGERGROUP4
Text HLabel 2950 2950 0    50   Input ~ 0
TRIGGERGROUP1
Text HLabel 2950 4850 0    50   Input ~ 0
TRIGGERGROUP3
Text HLabel 6650 3000 0    50   Input ~ 0
TRIGGERGROUP2
Text HLabel 6650 4900 0    50   Input ~ 0
TRIGGERGROUP4
Text Notes 2950 2500 0    50   ~ 0
Group I - E21-PG cyl 1/5 rising edge 360 ATDC
Text Notes 6700 2500 0    50   ~ 0
Group II - E13-PG cyl 4/8 rising edge 540 ATDC\n
Text Notes 3100 4450 0    50   ~ 0
Group III - E22-PG cyl 6/3 rising edge TDC
Text Notes 6550 4450 0    50   ~ 0
Group IV - E14-PG cyl 7/2 rising edge 180 ATDC
$EndSCHEMATC
