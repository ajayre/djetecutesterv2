EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr B 17000 11000
encoding utf-8
Sheet 1 1
Title "Bosch D-Jetronic ECU 0 280 002 005 Injector Drivers"
Date "2021-03-12"
Rev "1.00"
Comp "Mercedes-Benz"
Comment1 "M117.982 Engine"
Comment2 "Bosch Order # 0 280 002 005"
Comment3 "Mercedes-Benz Part # A 000 545 26 32"
Comment4 "Main Board 2 288 300 028"
$EndDescr
Text GLabel 8050 6700 2    50   Input ~ 0
E24-12V
Text GLabel 8050 5200 2    50   Input ~ 0
E24-12V
$Comp
L Transistor_BJT:BC547 Q550
U 1 1 5F312D0A
P 7850 6100
F 0 "Q550" H 8040 6146 50  0000 L CNN
F 1 "BCY58" H 8040 6055 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 8050 6025 50  0001 L CIN
F 3 "http://www.fairchildsemi.com/ds/BC/BC547.pdf" H 7850 6100 50  0001 L CNN
F 4 "Center E" H 7850 6100 50  0001 C CNN "Notes"
	1    7850 6100
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R515
U 1 1 5F31A937
P 7950 4100
F 0 "R515" H 8018 4146 50  0000 L CNN
F 1 "300" H 8018 4055 50  0000 L CNN
F 2 "Upper Center K" V 7990 4090 50  0001 C CNN
F 3 "~" H 7950 4100 50  0001 C CNN
F 4 "O Bk Br Gd = 300Ω ±5%" H 7950 4100 50  0001 C CNN "Notes"
	1    7950 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	7950 3700 7950 3950
Text GLabel 8050 3700 2    50   Input ~ 0
E24-12V
$Comp
L Transistor_BJT:BC547 Q505
U 1 1 5F31A944
P 7850 4600
F 0 "Q505" H 8040 4646 50  0000 L CNN
F 1 "BCY58" H 8040 4555 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 8050 4525 50  0001 L CIN
F 3 "http://www.fairchildsemi.com/ds/BC/BC547.pdf" H 7850 4600 50  0001 L CNN
F 4 "Center K" H 7850 4600 50  0001 C CNN "Notes"
	1    7850 4600
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R503
U 1 1 5F31D027
P 7950 2600
F 0 "R503" H 8018 2646 50  0000 L CNN
F 1 "300" H 8018 2555 50  0000 L CNN
F 2 "Upper Center K" V 7990 2590 50  0001 C CNN
F 3 "~" H 7950 2600 50  0001 C CNN
F 4 "O Bk Br Gd = 300Ω ±5%" H 7950 2600 50  0001 C CNN "Notes"
	1    7950 2600
	1    0    0    -1  
$EndComp
Text GLabel 8100 1550 2    50   Input ~ 0
E24-12V
$Comp
L Transistor_BJT:BC547 Q500
U 1 1 5F31D034
P 7850 3100
F 0 "Q500" H 8040 3146 50  0000 L CNN
F 1 "BCY58" H 8040 3055 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 8050 3025 50  0001 L CIN
F 3 "http://www.fairchildsemi.com/ds/BC/BC547.pdf" H 7850 3100 50  0001 L CNN
F 4 "Center K" H 7850 3100 50  0001 C CNN "Notes"
	1    7850 3100
	1    0    0    -1  
$EndComp
Text GLabel 8050 6500 2    50   UnSpc ~ 0
E11-GND
Text GLabel 8050 3500 2    50   UnSpc ~ 0
E11-GND
Text GLabel 8050 8000 2    50   UnSpc ~ 0
E11-GND
$Comp
L Transistor_BJT:BC547 Q555
U 1 1 5F30D664
P 7850 7600
F 0 "Q555" H 8040 7646 50  0000 L CNN
F 1 "BCY58" H 8040 7555 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 8050 7525 50  0001 L CIN
F 3 "http://www.fairchildsemi.com/ds/BC/BC547.pdf" H 7850 7600 50  0001 L CNN
F 4 "Lower Center E" H 7850 7600 50  0001 C CNN "Notes"
	1    7850 7600
	1    0    0    -1  
$EndComp
Wire Wire Line
	7950 6700 7950 6950
$Comp
L Device:R_US R565
U 1 1 5F30D657
P 7950 7100
F 0 "R565" H 8018 7146 50  0000 L CNN
F 1 "300" H 8018 7055 50  0000 L CNN
F 2 "Lower Center E" V 7990 7090 50  0001 C CNN
F 3 "~" H 7950 7100 50  0001 C CNN
F 4 "O Bk Br Gd = 300Ω ±5%" H 7950 7100 50  0001 C CNN "Notes"
	1    7950 7100
	1    0    0    -1  
$EndComp
$Comp
L Transistor_BJT:BC337 Q501
U 1 1 5F391AD6
P 8850 2900
F 0 "Q501" H 9040 2946 50  0000 L CNN
F 1 "BSX95" H 9040 2855 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 9050 2825 50  0001 L CIN
F 3 "https://diotec.com/tl_files/diotec/files/pdf/datasheets/bc337.pdf" H 8850 2900 50  0001 L CNN
F 4 "Center Right K" H 8850 2900 50  0001 C CNN "Notes"
	1    8850 2900
	1    0    0    -1  
$EndComp
Wire Wire Line
	7950 3300 7950 3500
Wire Wire Line
	7950 4800 7950 5000
Wire Wire Line
	7950 6300 7950 6500
Wire Wire Line
	7950 7800 7950 8000
Wire Wire Line
	8650 2900 7950 2900
$Comp
L Transistor_BJT:BC337 Q504
U 1 1 5F3E4AE0
P 8850 4400
F 0 "Q504" H 9040 4446 50  0000 L CNN
F 1 "BSX95" H 9040 4355 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 9050 4325 50  0001 L CIN
F 3 "https://diotec.com/tl_files/diotec/files/pdf/datasheets/bc337.pdf" H 8850 4400 50  0001 L CNN
F 4 "Center Right K" H 8850 4400 50  0001 C CNN "Notes"
	1    8850 4400
	1    0    0    -1  
$EndComp
Wire Wire Line
	8650 4400 7950 4400
$Comp
L Transistor_BJT:BC337 Q551
U 1 1 5F3E970B
P 8850 5900
F 0 "Q551" H 9040 5946 50  0000 L CNN
F 1 "BSX95" H 9040 5855 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 9050 5825 50  0001 L CIN
F 3 "https://diotec.com/tl_files/diotec/files/pdf/datasheets/bc337.pdf" H 8850 5900 50  0001 L CNN
F 4 "Center Right E" H 8850 5900 50  0001 C CNN "Notes"
	1    8850 5900
	1    0    0    -1  
$EndComp
Wire Wire Line
	8650 5900 7950 5900
$Comp
L Transistor_BJT:BC337 Q554
U 1 1 5F3ED885
P 8850 7400
F 0 "Q554" H 9040 7446 50  0000 L CNN
F 1 "BSX95" H 9040 7355 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-92_Inline" H 9050 7325 50  0001 L CIN
F 3 "https://diotec.com/tl_files/diotec/files/pdf/datasheets/bc337.pdf" H 8850 7400 50  0001 L CNN
F 4 "Lower Right E" H 8850 7400 50  0001 C CNN "Notes"
	1    8850 7400
	1    0    0    -1  
$EndComp
Wire Wire Line
	8650 7400 7950 7400
$Comp
L Device:R_US R504
U 1 1 5F485A3E
P 9950 2700
F 0 "R504" V 9745 2700 50  0000 C CNN
F 1 "30" V 9836 2700 50  0000 C CNN
F 2 "Upper Center D wired out to Heat Sink" V 9990 2690 50  0001 C CNN
F 3 "~" H 9950 2700 50  0001 C CNN
F 4 "014 measured ceramic" H 9950 2700 50  0001 C CNN "Notes"
	1    9950 2700
	0    1    1    0   
$EndComp
$Comp
L Device:R_US R509
U 1 1 5F486B62
P 9950 3100
F 0 "R509" V 9745 3100 50  0000 C CNN
F 1 "820" V 9836 3100 50  0000 C CNN
F 2 "Lower Right K" V 9990 3090 50  0001 C CNN
F 3 "~" H 9950 3100 50  0001 C CNN
F 4 "Gr R Br Gd = 820Ω ±5%" H 9950 3100 50  0001 C CNN "Notes"
	1    9950 3100
	0    1    1    0   
$EndComp
$Comp
L Device:R_US R513
U 1 1 5F4877AC
P 9950 4200
F 0 "R513" V 9745 4200 50  0000 C CNN
F 1 "30" V 9836 4200 50  0000 C CNN
F 2 "Upper Left D wired out to Heat Sink" V 9990 4190 50  0001 C CNN
F 3 "~" H 9950 4200 50  0001 C CNN
F 4 "014 measured ceramic" H 9950 4200 50  0001 C CNN "Notes"
	1    9950 4200
	0    1    1    0   
$EndComp
$Comp
L Device:R_US R554
U 1 1 5F48863A
P 9950 5700
F 0 "R554" V 9745 5700 50  0000 C CNN
F 1 "30" V 9836 5700 50  0000 C CNN
F 2 "Upper Left D wired out to Heat Sink" V 9990 5690 50  0001 C CNN
F 3 "~" H 9950 5700 50  0001 C CNN
F 4 "014 measured ceramic" H 9950 5700 50  0001 C CNN "Notes"
	1    9950 5700
	0    1    1    0   
$EndComp
$Comp
L Device:R_US R563
U 1 1 5F489A58
P 9950 7200
F 0 "R563" V 9745 7200 50  0000 C CNN
F 1 "30" V 9836 7200 50  0000 C CNN
F 2 "Upper Right D-E Line wired out to Heat Sink" V 9990 7190 50  0001 C CNN
F 3 "~" H 9950 7200 50  0001 C CNN
F 4 "014 measured ceramic" H 9950 7200 50  0001 C CNN "Notes"
	1    9950 7200
	0    1    1    0   
$EndComp
$Comp
L Device:R_US R559
U 1 1 5F48AD9A
P 9950 7600
F 0 "R559" V 9745 7600 50  0000 C CNN
F 1 "820" V 9836 7600 50  0000 C CNN
F 2 "Upper Right E" V 9990 7590 50  0001 C CNN
F 3 "~" H 9950 7600 50  0001 C CNN
F 4 "Gr R Br Gd = 820Ω ±5%" H 9950 7600 50  0001 C CNN "Notes"
	1    9950 7600
	0    1    1    0   
$EndComp
Wire Wire Line
	8950 7600 9100 7600
Wire Wire Line
	8950 7200 9800 7200
Wire Wire Line
	8950 5700 9800 5700
Wire Wire Line
	8950 4200 9800 4200
Wire Wire Line
	8950 2700 9800 2700
$Comp
L Device:R_US R555
U 1 1 5F4AD72F
P 10450 5450
F 0 "R555" H 10518 5496 50  0000 L CNN
F 1 "27" H 10518 5405 50  0000 L CNN
F 2 "Upper Right D" V 10490 5440 50  0001 C CNN
F 3 "~" H 10450 5450 50  0001 C CNN
F 4 "R W Bk Gd = 27Ω ±5%" H 10450 5450 50  0001 C CNN "Notes"
	1    10450 5450
	1    0    0    -1  
$EndComp
Text GLabel 10550 3700 2    50   Input ~ 0
E24-12V
Wire Wire Line
	10450 5300 10450 5200
Text GLabel 10550 5200 2    50   Input ~ 0
E24-12V
Wire Wire Line
	8950 6100 9450 6100
Wire Wire Line
	9450 6100 9450 7600
Connection ~ 9450 7600
Wire Wire Line
	9450 7600 9800 7600
Text GLabel 12300 1600 2    50   Input ~ 0
E24-12V
Wire Wire Line
	11200 2500 11950 2500
Wire Wire Line
	11950 7600 10100 7600
Wire Wire Line
	11200 4000 11950 4000
Connection ~ 11950 4000
Wire Wire Line
	11950 4000 11950 5500
Wire Wire Line
	11200 5500 11950 5500
Connection ~ 11950 5500
Wire Wire Line
	11950 5500 11950 7000
Wire Wire Line
	11200 7000 11950 7000
Connection ~ 11950 7000
Wire Wire Line
	11950 7000 11950 7600
$Comp
L Device:C C500
U 1 1 5F191FD1
P 12450 3050
F 0 "C500" H 12565 3096 50  0000 L CNN
F 1 "6.8u" H 12565 3005 50  0000 L CNN
F 2 "Right D Line" H 12488 2900 50  0001 C CNN
F 3 "~" H 12450 3050 50  0001 C CNN
F 4 "MK 6,8μF ±5% 100V" H 12450 3050 50  0001 C CNN "Notes"
	1    12450 3050
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R508
U 1 1 5F193BA3
P 12450 3350
F 0 "R508" H 12518 3396 50  0000 L CNN
F 1 "6.8" H 12518 3305 50  0000 L CNN
F 2 "Left E-K Line" V 12490 3340 50  0001 C CNN
F 3 "~" H 12450 3350 50  0001 C CNN
F 4 "Bl Gr Gd Gd = 6.8Ω ±5%" H 12450 3350 50  0001 C CNN "Notes"
	1    12450 3350
	1    0    0    -1  
$EndComp
Text GLabel 12800 4050 2    50   UnSpc ~ 0
E11-GND
Wire Wire Line
	11200 2900 12450 2900
$Comp
L Device:C C501
U 1 1 5F1A0F09
P 12450 4550
F 0 "C501" H 12565 4596 50  0000 L CNN
F 1 "6.8u" H 12565 4505 50  0000 L CNN
F 2 "Right D Line" H 12488 4400 50  0001 C CNN
F 3 "~" H 12450 4550 50  0001 C CNN
F 4 "MK 6,8μF ±5% 100V" H 12450 4550 50  0001 C CNN "Notes"
	1    12450 4550
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R510
U 1 1 5F1A0F13
P 12450 4850
F 0 "R510" H 12518 4896 50  0000 L CNN
F 1 "6.8" H 12518 4805 50  0000 L CNN
F 2 "Center Left K" V 12490 4840 50  0001 C CNN
F 3 "~" H 12450 4850 50  0001 C CNN
F 4 "Bl Gr Gd Gd = 6.8Ω ±5%" H 12450 4850 50  0001 C CNN "Notes"
	1    12450 4850
	1    0    0    -1  
$EndComp
Wire Wire Line
	11200 4400 12450 4400
$Comp
L Device:C C550
U 1 1 5F1B5047
P 12450 6050
F 0 "C550" H 12565 6096 50  0000 L CNN
F 1 "6.8u" H 12565 6005 50  0000 L CNN
F 2 "Right K Line" H 12488 5900 50  0001 C CNN
F 3 "~" H 12450 6050 50  0001 C CNN
F 4 "MK 6,8μF ±5% 100V" H 12450 6050 50  0001 C CNN "Notes"
	1    12450 6050
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R558
U 1 1 5F1B5051
P 12450 6350
F 0 "R558" H 12518 6396 50  0000 L CNN
F 1 "6.8" H 12518 6305 50  0000 L CNN
F 2 "Upper Left K" V 12490 6340 50  0001 C CNN
F 3 "~" H 12450 6350 50  0001 C CNN
F 4 "Bl Gr Gd Gd = 6.8Ω ±5%" H 12450 6350 50  0001 C CNN "Notes"
	1    12450 6350
	1    0    0    -1  
$EndComp
Text GLabel 12550 6500 2    50   UnSpc ~ 0
E11-GND
Wire Wire Line
	11200 5900 12450 5900
$Comp
L Device:C C551
U 1 1 5F1BC0B5
P 12450 7550
F 0 "C551" H 12565 7596 50  0000 L CNN
F 1 "6.8u" H 12565 7505 50  0000 L CNN
F 2 "Right K Line" H 12488 7400 50  0001 C CNN
F 3 "~" H 12450 7550 50  0001 C CNN
F 4 "MK 6,8μF ±5% 100V" H 12450 7550 50  0001 C CNN "Notes"
	1    12450 7550
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R560
U 1 1 5F1BC0BF
P 12450 7850
F 0 "R560" H 12518 7896 50  0000 L CNN
F 1 "6.8" H 12518 7805 50  0000 L CNN
F 2 "Center Left E" V 12490 7840 50  0001 C CNN
F 3 "~" H 12450 7850 50  0001 C CNN
F 4 "Bl Gr Gd Gd = 6.8Ω ±5%" H 12450 7850 50  0001 C CNN "Notes"
	1    12450 7850
	1    0    0    -1  
$EndComp
Text GLabel 12550 8000 2    50   UnSpc ~ 0
E11-GND
Wire Wire Line
	11200 7400 12450 7400
Text GLabel 12550 5000 2    50   UnSpc ~ 0
E11-GND
Text GLabel 8050 5000 2    50   UnSpc ~ 0
E11-GND
$Comp
L Device:R_US R506
U 1 1 5F274A48
P 13700 2900
F 0 "R506" V 13495 2900 50  0000 C CNN
F 1 "6" V 13586 2900 50  0000 C CNN
F 2 "Upper Left C wired out to Heat Sink" V 13740 2890 50  0001 C CNN
F 3 "~" H 13700 2900 50  0001 C CNN
F 4 "014 measured ceramic" H 13700 2900 50  0001 C CNN "Notes"
	1    13700 2900
	0    1    1    0   
$EndComp
$Comp
L Device:R_US R507
U 1 1 5F277513
P 13700 3350
F 0 "R507" V 13495 3350 50  0000 C CNN
F 1 "6" V 13586 3350 50  0000 C CNN
F 2 "Upper Left C wired out to Heat Sink" V 13740 3340 50  0001 C CNN
F 3 "~" H 13700 3350 50  0001 C CNN
F 4 "014 measured ceramic" H 13700 3350 50  0001 C CNN "Notes"
	1    13700 3350
	0    1    1    0   
$EndComp
Connection ~ 12450 2900
Wire Wire Line
	13950 2900 14300 2900
$Comp
L Device:R_US R511
U 1 1 5F287875
P 13700 4400
F 0 "R511" V 13495 4400 50  0000 C CNN
F 1 "6" V 13586 4400 50  0000 C CNN
F 2 "Upper A-B Line wired out to Heat Sink" V 13740 4390 50  0001 C CNN
F 3 "~" H 13700 4400 50  0001 C CNN
F 4 "014 measured ceramic" H 13700 4400 50  0001 C CNN "Notes"
	1    13700 4400
	0    1    1    0   
$EndComp
$Comp
L Device:R_US R512
U 1 1 5F28787F
P 13700 4850
F 0 "R512" V 13495 4850 50  0000 C CNN
F 1 "6" V 13586 4850 50  0000 C CNN
F 2 "Upper A-B Line wired out to Heat Sink" V 13740 4840 50  0001 C CNN
F 3 "~" H 13700 4850 50  0001 C CNN
F 4 "014 measured ceramic" H 13700 4850 50  0001 C CNN "Notes"
	1    13700 4850
	0    1    1    0   
$EndComp
Wire Wire Line
	12450 4400 13450 4400
Wire Wire Line
	13950 4400 14300 4400
Connection ~ 12450 4400
$Comp
L Device:R_US R556
U 1 1 5F28F6CC
P 13700 5900
F 0 "R556" V 13495 5900 50  0000 C CNN
F 1 "6" V 13586 5900 50  0000 C CNN
F 2 "Upper A-B Line wired out to Heat Sink" V 13740 5890 50  0001 C CNN
F 3 "~" H 13700 5900 50  0001 C CNN
F 4 "014 measured ceramic" H 13700 5900 50  0001 C CNN "Notes"
	1    13700 5900
	0    1    1    0   
$EndComp
$Comp
L Device:R_US R557
U 1 1 5F28F6D6
P 13700 6400
F 0 "R557" V 13495 6400 50  0000 C CNN
F 1 "6" V 13586 6400 50  0000 C CNN
F 2 "Upper A-B Line wired out to Heat Sink" V 13740 6390 50  0001 C CNN
F 3 "~" H 13700 6400 50  0001 C CNN
F 4 "014 measured ceramic" H 13700 6400 50  0001 C CNN "Notes"
	1    13700 6400
	0    1    1    0   
$EndComp
Wire Wire Line
	12450 5900 13450 5900
Wire Wire Line
	13950 5900 14300 5900
Connection ~ 12450 5900
$Comp
L Device:R_US R561
U 1 1 5F297AE8
P 13700 7400
F 0 "R561" V 13495 7400 50  0000 C CNN
F 1 "6" V 13586 7400 50  0000 C CNN
F 2 "Upper Left C wired out to Heat Sink" V 13740 7390 50  0001 C CNN
F 3 "~" H 13700 7400 50  0001 C CNN
F 4 "R501 on Peter's - 014 measured ceramic" H 13700 7400 50  0001 C CNN "Notes"
	1    13700 7400
	0    1    1    0   
$EndComp
$Comp
L Device:R_US R562
U 1 1 5F297AF2
P 13700 7900
F 0 "R562" V 13495 7900 50  0000 C CNN
F 1 "6" V 13586 7900 50  0000 C CNN
F 2 "Upper Left C wired out to Heat Sink" V 13740 7890 50  0001 C CNN
F 3 "~" H 13700 7900 50  0001 C CNN
F 4 "R502 on Peter's - 014 measured ceramic" H 13700 7900 50  0001 C CNN "Notes"
	1    13700 7900
	0    1    1    0   
$EndComp
Wire Wire Line
	12450 7400 13450 7400
Wire Wire Line
	13950 7400 14300 7400
Connection ~ 12450 7400
Text GLabel 14650 7400 2    50   Output ~ 0
E6-INJ7_2
Text GLabel 14650 5900 2    50   Output ~ 0
E4-INJ4_8
Text GLabel 14650 4400 2    50   Output ~ 0
E5-INJ6_3
Text GLabel 14650 2900 2    50   Output ~ 0
E3-INJ1_5
$Comp
L Device:R_US R505
U 1 1 5F4AB10D
P 10450 2400
F 0 "R505" H 10518 2446 50  0000 L CNN
F 1 "27" H 10518 2355 50  0000 L CNN
F 2 "Upper Right D" V 10490 2390 50  0001 C CNN
F 3 "~" H 10450 2400 50  0001 C CNN
F 4 "R W Bk Gd = 27Ω ±5%" H 10450 2400 50  0001 C CNN "Notes"
	1    10450 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	10450 3800 10450 3700
Wire Wire Line
	10450 3700 10550 3700
Wire Wire Line
	10450 5200 10550 5200
Wire Wire Line
	7950 3500 8050 3500
Wire Wire Line
	7950 6500 8050 6500
Wire Wire Line
	7950 5000 8050 5000
Wire Wire Line
	7950 1550 8100 1550
Wire Wire Line
	7950 5200 8050 5200
Wire Wire Line
	7950 8000 8050 8000
Wire Wire Line
	12450 6500 12550 6500
Wire Wire Line
	7950 6700 8050 6700
Wire Wire Line
	7950 3700 8050 3700
$Comp
L Device:R_US R501
U 1 1 5F337836
P 7200 3100
F 0 "R501" V 6995 3100 50  0000 C CNN
F 1 "3k9" V 7086 3100 50  0000 C CNN
F 2 "Lower Right J" V 7240 3090 50  0001 C CNN
F 3 "~" H 7200 3100 50  0001 C CNN
F 4 "O W R Gd = 3.9KΩ ±5%" H 7200 3100 50  0001 C CNN "Notes"
	1    7200 3100
	0    1    1    0   
$EndComp
$Comp
L Device:R_US R517
U 1 1 5F335038
P 7200 4600
F 0 "R517" V 6995 4600 50  0000 C CNN
F 1 "3k9" V 7086 4600 50  0000 C CNN
F 2 "Lower Right J" V 7240 4590 50  0001 C CNN
F 3 "~" H 7200 4600 50  0001 C CNN
F 4 "O W R Gd = 3.9KΩ ±5%" H 7200 4600 50  0001 C CNN "Notes"
	1    7200 4600
	0    1    1    0   
$EndComp
$Comp
L Device:R_US R551
U 1 1 5F32FCCB
P 7200 6100
F 0 "R551" V 6995 6100 50  0000 C CNN
F 1 "3k9" V 7086 6100 50  0000 C CNN
F 2 "Upper Left D" V 7240 6090 50  0001 C CNN
F 3 "~" H 7200 6100 50  0001 C CNN
F 4 "O W R Gd = 3.9KΩ ±5%" H 7200 6100 50  0001 C CNN "Notes"
	1    7200 6100
	0    1    1    0   
$EndComp
$Comp
L Device:R_US R567
U 1 1 5F32957C
P 7200 7600
F 0 "R567" V 6995 7600 50  0000 C CNN
F 1 "3k9" V 7086 7600 50  0000 C CNN
F 2 "Upper Right C" V 7240 7590 50  0001 C CNN
F 3 "~" H 7200 7600 50  0001 C CNN
F 4 "O W R Gd = 3.9KΩ ±5%" H 7200 7600 50  0001 C CNN "Notes"
	1    7200 7600
	0    1    1    0   
$EndComp
Wire Wire Line
	6700 4600 7050 4600
Wire Wire Line
	6700 6100 7050 6100
Wire Wire Line
	6750 7600 7050 7600
Wire Wire Line
	7950 2750 7950 2900
Connection ~ 7950 2900
Wire Wire Line
	7950 4250 7950 4400
Connection ~ 7950 4400
Wire Wire Line
	10100 2700 10450 2700
Wire Wire Line
	10450 2550 10450 2700
Connection ~ 10450 2700
Wire Wire Line
	10450 2700 10900 2700
$Comp
L Device:R_US R514
U 1 1 5F4ABE6C
P 10450 3950
F 0 "R514" H 10518 3996 50  0000 L CNN
F 1 "27" H 10518 3905 50  0000 L CNN
F 2 "Upper Center D" V 10490 3940 50  0001 C CNN
F 3 "~" H 10450 3950 50  0001 C CNN
F 4 "R W Bk Gd = 27Ω ±5%" H 10450 3950 50  0001 C CNN "Notes"
	1    10450 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	10100 4200 10450 4200
Wire Wire Line
	10450 4100 10450 4200
Connection ~ 10450 4200
Wire Wire Line
	12450 2900 13450 2900
Wire Wire Line
	13550 2900 13450 2900
Connection ~ 13450 2900
Wire Wire Line
	13850 2900 13950 2900
Connection ~ 13950 2900
Wire Wire Line
	13450 3350 13550 3350
Wire Wire Line
	13450 2900 13450 3350
Wire Wire Line
	13850 3350 13950 3350
Wire Wire Line
	13950 2900 13950 3350
Wire Wire Line
	13450 4400 13550 4400
Connection ~ 13450 4400
Wire Wire Line
	13850 4400 13950 4400
Connection ~ 13950 4400
Wire Wire Line
	13450 4850 13550 4850
Wire Wire Line
	13450 4400 13450 4850
Wire Wire Line
	13850 4850 13950 4850
Wire Wire Line
	13950 4400 13950 4850
Wire Wire Line
	10450 6700 10550 6700
Text GLabel 10550 6700 2    50   Input ~ 0
E24-12V
Wire Wire Line
	10450 6800 10450 6700
$Comp
L Device:R_US R564
U 1 1 5F4AE4B9
P 10450 6950
F 0 "R564" H 10518 6996 50  0000 L CNN
F 1 "27" H 10518 6905 50  0000 L CNN
F 2 "Upper Left E" V 10490 6940 50  0001 C CNN
F 3 "~" H 10450 6950 50  0001 C CNN
F 4 "R W Bk Gd = 27Ω ±5%" H 10450 6950 50  0001 C CNN "Notes"
	1    10450 6950
	1    0    0    -1  
$EndComp
Wire Wire Line
	10100 7200 10450 7200
Wire Wire Line
	10100 5700 10450 5700
Wire Wire Line
	10450 5600 10450 5700
Connection ~ 10450 5700
Wire Wire Line
	10450 5700 10900 5700
Wire Wire Line
	10450 7100 10450 7200
Connection ~ 10450 7200
Wire Wire Line
	10450 7200 10900 7200
Wire Wire Line
	13450 5900 13550 5900
Connection ~ 13450 5900
Wire Wire Line
	13850 5900 13950 5900
Connection ~ 13950 5900
Wire Wire Line
	13450 6400 13550 6400
Wire Wire Line
	13450 5900 13450 6400
Wire Wire Line
	13850 6400 13950 6400
Wire Wire Line
	13950 5900 13950 6400
Wire Wire Line
	13450 7400 13550 7400
Connection ~ 13450 7400
Wire Wire Line
	13850 7400 13950 7400
Connection ~ 13950 7400
Wire Wire Line
	13850 7900 13950 7900
Wire Wire Line
	13950 7400 13950 7900
Wire Wire Line
	13450 7900 13550 7900
Wire Wire Line
	13450 7400 13450 7900
Connection ~ 12450 5000
Wire Wire Line
	12450 5000 12550 5000
Wire Wire Line
	7950 7250 7950 7400
Connection ~ 7950 7400
Wire Wire Line
	7950 5450 7950 5200
$Comp
L Device:R_US R553
U 1 1 5F312CFD
P 7950 5600
F 0 "R553" H 8018 5646 50  0000 L CNN
F 1 "300" H 8018 5555 50  0000 L CNN
F 2 "Lower Right E" V 7990 5590 50  0001 C CNN
F 3 "~" H 7950 5600 50  0001 C CNN
F 4 "O Bk Br Gd = 300Ω ±5%" H 7950 5600 50  0001 C CNN "Notes"
	1    7950 5600
	1    0    0    -1  
$EndComp
Wire Wire Line
	7950 5750 7950 5900
Connection ~ 7950 5900
Wire Wire Line
	6700 3100 7050 3100
Wire Wire Line
	7350 6100 7650 6100
Wire Wire Line
	7350 7600 7650 7600
Wire Wire Line
	7350 3100 7650 3100
Wire Wire Line
	7350 4600 7650 4600
Text GLabel 6700 3100 0    50   Input ~ 0
IN_INJ1_5
Text GLabel 6700 4600 0    50   Input ~ 0
IN_INJ6_3
Text GLabel 6700 6100 0    50   Input ~ 0
IN_INJ4_8
Text GLabel 6750 7600 0    50   Input ~ 0
IN_INJ7_2
Wire Wire Line
	9650 5000 12450 5000
Wire Wire Line
	10450 1600 12150 1600
Wire Wire Line
	12150 1600 12150 2250
Connection ~ 12150 1600
Wire Wire Line
	12150 1600 12300 1600
Wire Bus Line
	12150 1600 12300 1600
Wire Wire Line
	9100 7600 9100 7650
Connection ~ 9100 7600
Wire Wire Line
	9100 7600 9450 7600
Connection ~ 12450 8000
Wire Wire Line
	12450 8000 12550 8000
Text GLabel 1900 3900 2    50   Input ~ 0
IN_INJ1_5
Text GLabel 2700 3750 2    50   Input ~ 0
IN_INJ6_3
Text GLabel 3500 3500 2    50   Input ~ 0
IN_INJ4_8
Text GLabel 4350 3250 2    50   Input ~ 0
IN_INJ7_2
$Comp
L Simulation_SPICE:DIODE D3
U 1 1 6057ACE0
P 12150 2400
F 0 "D3" V 12104 2480 50  0000 L CNN
F 1 "DIODE" V 12195 2480 50  0000 L CNN
F 2 "" H 12150 2400 50  0001 C CNN
F 3 "~" H 12150 2400 50  0001 C CNN
F 4 "Y" H 12150 2400 50  0001 L CNN "Spice_Netlist_Enabled"
F 5 "D" H 12150 2400 50  0001 L CNN "Spice_Primitive"
	1    12150 2400
	0    1    1    0   
$EndComp
$Comp
L Simulation_SPICE:DIODE D2
U 1 1 6057B49A
P 9650 4750
F 0 "D2" V 9604 4830 50  0000 L CNN
F 1 "DIODE" V 9695 4830 50  0000 L CNN
F 2 "" H 9650 4750 50  0001 C CNN
F 3 "~" H 9650 4750 50  0001 C CNN
F 4 "Y" H 9650 4750 50  0001 L CNN "Spice_Netlist_Enabled"
F 5 "D" H 9650 4750 50  0001 L CNN "Spice_Primitive"
	1    9650 4750
	0    1    1    0   
$EndComp
$Comp
L Simulation_SPICE:DIODE D1
U 1 1 6057B7D9
P 9100 7800
F 0 "D1" V 9054 7880 50  0000 L CNN
F 1 "DIODE" V 9145 7880 50  0000 L CNN
F 2 "" H 9100 7800 50  0001 C CNN
F 3 "~" H 9100 7800 50  0001 C CNN
F 4 "Y" H 9100 7800 50  0001 L CNN "Spice_Netlist_Enabled"
F 5 "D" H 9100 7800 50  0001 L CNN "Spice_Primitive"
	1    9100 7800
	0    1    1    0   
$EndComp
Wire Wire Line
	9100 8000 9100 7950
Wire Wire Line
	9100 8000 12450 8000
Wire Wire Line
	9650 4900 9650 5000
Wire Wire Line
	12150 2550 12150 2650
Text Notes 2050 5300 0    50   ~ 0
.model DIODE D\n.model BCY58 npn\n.model BSX95 npn\n.model AUY21 pnp\n.tran 1ms 420ms 120m
Wire Wire Line
	8950 3100 9650 3100
Wire Wire Line
	8950 4600 9650 4600
$Comp
L Device:Q_PNP_CBE Q502
U 1 1 605ABD59
P 11100 2700
F 0 "Q502" H 11291 2654 50  0000 L CNN
F 1 "AUY21" H 11291 2745 50  0000 L CNN
F 2 "" H 11300 2800 50  0001 C CNN
F 3 "~" H 11100 2700 50  0001 C CNN
	1    11100 2700
	1    0    0    1   
$EndComp
Wire Wire Line
	10450 4200 10900 4200
$Comp
L Device:Q_PNP_CBE Q503
U 1 1 605AD57F
P 11100 4200
F 0 "Q503" H 11291 4154 50  0000 L CNN
F 1 "AUY21" H 11291 4245 50  0000 L CNN
F 2 "" H 11300 4300 50  0001 C CNN
F 3 "~" H 11100 4200 50  0001 C CNN
	1    11100 4200
	1    0    0    1   
$EndComp
$Comp
L Device:Q_PNP_CBE Q552
U 1 1 605AF76F
P 11100 5700
F 0 "Q552" H 11291 5654 50  0000 L CNN
F 1 "AUY21" H 11291 5745 50  0000 L CNN
F 2 "" H 11300 5800 50  0001 C CNN
F 3 "~" H 11100 5700 50  0001 C CNN
	1    11100 5700
	1    0    0    1   
$EndComp
$Comp
L Device:Q_PNP_CBE Q553
U 1 1 605B07E1
P 11100 7200
F 0 "Q553" H 11291 7154 50  0000 L CNN
F 1 "AUY21" H 11291 7245 50  0000 L CNN
F 2 "" H 11300 7300 50  0001 C CNN
F 3 "~" H 11100 7200 50  0001 C CNN
	1    11100 7200
	1    0    0    1   
$EndComp
Text GLabel 1250 4750 3    50   UnSpc ~ 0
E11-GND
Wire Wire Line
	1250 3750 1250 4050
Text GLabel 1250 3100 1    50   Input ~ 0
E24-12V
$Comp
L Simulation_SPICE:VDC V1
U 1 1 604E83CA
P 1250 4250
F 0 "V1" H 1380 4341 50  0000 L CNN
F 1 "12" H 1380 4250 50  0000 L CNN
F 2 "" H 1250 4250 50  0001 C CNN
F 3 "~" H 1250 4250 50  0001 C CNN
F 4 "Y" H 1250 4250 50  0001 L CNN "Spice_Netlist_Enabled"
F 5 "V" H 1250 4250 50  0001 L CNN "Spice_Primitive"
F 6 "dc(12)" H 1380 4159 50  0000 L CNN "Spice_Model"
	1    1250 4250
	1    0    0    -1  
$EndComp
$Comp
L pspice:INDUCTOR L1
U 1 1 604ECB0B
P 14750 3350
F 0 "L1" H 14750 3565 50  0000 C CNN
F 1 "3.77mH" H 14750 3474 50  0000 C CNN
F 2 "" H 14750 3350 50  0001 C CNN
F 3 "~" H 14750 3350 50  0001 C CNN
	1    14750 3350
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R2
U 1 1 604ED3F7
P 15300 3350
F 0 "R2" V 15095 3350 50  0000 C CNN
F 1 "2.6" V 15186 3350 50  0000 C CNN
F 2 "Upper Left C wired out to Heat Sink" V 15340 3340 50  0001 C CNN
F 3 "~" H 15300 3350 50  0001 C CNN
F 4 "014 measured ceramic" H 15300 3350 50  0001 C CNN "Notes"
	1    15300 3350
	0    1    1    0   
$EndComp
Wire Wire Line
	14500 3350 14300 3350
Wire Wire Line
	14300 3350 14300 2900
Connection ~ 14300 2900
Wire Wire Line
	14300 2900 14650 2900
Wire Wire Line
	15000 3350 15150 3350
Text GLabel 15600 4200 2    50   UnSpc ~ 0
E11-GND
Wire Wire Line
	15600 3350 15450 3350
$Comp
L pspice:INDUCTOR L2
U 1 1 60501C75
P 14750 4850
F 0 "L2" H 14750 5065 50  0000 C CNN
F 1 "3.77mH" H 14750 4974 50  0000 C CNN
F 2 "" H 14750 4850 50  0001 C CNN
F 3 "~" H 14750 4850 50  0001 C CNN
	1    14750 4850
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R3
U 1 1 60501C7C
P 15300 4850
F 0 "R3" V 15095 4850 50  0000 C CNN
F 1 "2.6" V 15186 4850 50  0000 C CNN
F 2 "Upper Left C wired out to Heat Sink" V 15340 4840 50  0001 C CNN
F 3 "~" H 15300 4850 50  0001 C CNN
F 4 "014 measured ceramic" H 15300 4850 50  0001 C CNN "Notes"
	1    15300 4850
	0    1    1    0   
$EndComp
Wire Wire Line
	14500 4850 14300 4850
Wire Wire Line
	14300 4850 14300 4400
Wire Wire Line
	15000 4850 15150 4850
Text GLabel 15800 5800 2    50   UnSpc ~ 0
E11-GND
Wire Wire Line
	15600 4850 15450 4850
$Comp
L pspice:INDUCTOR L3
U 1 1 60509157
P 14750 6350
F 0 "L3" H 14750 6565 50  0000 C CNN
F 1 "3.77mH" H 14750 6474 50  0000 C CNN
F 2 "" H 14750 6350 50  0001 C CNN
F 3 "~" H 14750 6350 50  0001 C CNN
	1    14750 6350
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R4
U 1 1 6050915E
P 15300 6350
F 0 "R4" V 15095 6350 50  0000 C CNN
F 1 "2.6" V 15186 6350 50  0000 C CNN
F 2 "Upper Left C wired out to Heat Sink" V 15340 6340 50  0001 C CNN
F 3 "~" H 15300 6350 50  0001 C CNN
F 4 "014 measured ceramic" H 15300 6350 50  0001 C CNN "Notes"
	1    15300 6350
	0    1    1    0   
$EndComp
Wire Wire Line
	14500 6350 14300 6350
Wire Wire Line
	14300 6350 14300 5900
Wire Wire Line
	15000 6350 15150 6350
Text GLabel 15800 6700 2    50   UnSpc ~ 0
E11-GND
Wire Wire Line
	15600 6350 15450 6350
$Comp
L pspice:INDUCTOR L4
U 1 1 60510949
P 14750 7850
F 0 "L4" H 14750 8065 50  0000 C CNN
F 1 "3.77mH" H 14750 7974 50  0000 C CNN
F 2 "" H 14750 7850 50  0001 C CNN
F 3 "~" H 14750 7850 50  0001 C CNN
	1    14750 7850
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R5
U 1 1 60510950
P 15300 7850
F 0 "R5" V 15095 7850 50  0000 C CNN
F 1 "2.6" V 15186 7850 50  0000 C CNN
F 2 "Upper Left C wired out to Heat Sink" V 15340 7840 50  0001 C CNN
F 3 "~" H 15300 7850 50  0001 C CNN
F 4 "014 measured ceramic" H 15300 7850 50  0001 C CNN "Notes"
	1    15300 7850
	0    1    1    0   
$EndComp
Wire Wire Line
	14500 7850 14300 7850
Wire Wire Line
	14300 7850 14300 7400
Wire Wire Line
	15000 7850 15150 7850
Text GLabel 15800 8200 2    50   UnSpc ~ 0
E11-GND
Wire Wire Line
	15600 7850 15450 7850
Wire Wire Line
	9650 4600 9650 3100
Connection ~ 9650 4600
Connection ~ 9650 3100
Wire Wire Line
	9650 3100 9800 3100
Text GLabel 1450 4600 3    50   Input ~ 0
0
$Comp
L Simulation_SPICE:VPULSE V2
U 1 1 605351C4
P 1900 4250
F 0 "V2" H 2030 4341 50  0000 L CNN
F 1 "VPULSE" H 2030 4250 50  0000 L CNN
F 2 "" H 1900 4250 50  0001 C CNN
F 3 "~" H 1900 4250 50  0001 C CNN
F 4 "Y" H 1900 4250 50  0001 L CNN "Spice_Netlist_Enabled"
F 5 "V" H 1900 4250 50  0001 L CNN "Spice_Primitive"
F 6 "pulse(0 5 2n 2n 2n 95ms 100ms)" H 2030 4159 50  0000 L CNN "Spice_Model"
	1    1900 4250
	1    0    0    -1  
$EndComp
Wire Wire Line
	1900 4600 1900 4450
Wire Wire Line
	1900 3900 1900 4050
Connection ~ 14300 4400
Wire Wire Line
	14300 4400 14650 4400
Connection ~ 14300 5900
Wire Wire Line
	14300 5900 14650 5900
Connection ~ 14300 7400
Wire Wire Line
	14300 7400 14650 7400
$Comp
L Simulation_SPICE:VPULSE V4
U 1 1 604FE76E
P 2700 4050
F 0 "V4" H 2830 4141 50  0000 L CNN
F 1 "VPULSE" H 2830 4050 50  0000 L CNN
F 2 "" H 2700 4050 50  0001 C CNN
F 3 "~" H 2700 4050 50  0001 C CNN
F 4 "Y" H 2700 4050 50  0001 L CNN "Spice_Netlist_Enabled"
F 5 "V" H 2700 4050 50  0001 L CNN "Spice_Primitive"
F 6 "pulse(0 5 25ms 2n 2n 95ms 100ms)" H 2830 3959 50  0000 L CNN "Spice_Model"
	1    2700 4050
	1    0    0    -1  
$EndComp
Wire Wire Line
	2700 4250 2700 4600
Wire Wire Line
	2700 4600 1900 4600
Wire Wire Line
	2700 3750 2700 3850
$Comp
L Simulation_SPICE:VPULSE V3
U 1 1 6051C9EF
P 3500 3800
F 0 "V3" H 3630 3891 50  0000 L CNN
F 1 "VPULSE" H 3630 3800 50  0000 L CNN
F 2 "" H 3500 3800 50  0001 C CNN
F 3 "~" H 3500 3800 50  0001 C CNN
F 4 "Y" H 3500 3800 50  0001 L CNN "Spice_Netlist_Enabled"
F 5 "V" H 3500 3800 50  0001 L CNN "Spice_Primitive"
F 6 "pulse(0 5 50ms 2n 2n 95ms 100ms)" H 3630 3709 50  0000 L CNN "Spice_Model"
	1    3500 3800
	1    0    0    -1  
$EndComp
Wire Wire Line
	3500 4000 3500 4600
Wire Wire Line
	3500 4600 2700 4600
Connection ~ 2700 4600
Wire Wire Line
	3500 3500 3500 3600
$Comp
L Simulation_SPICE:VPULSE V5
U 1 1 6053457D
P 4350 3550
F 0 "V5" H 4480 3641 50  0000 L CNN
F 1 "VPULSE" H 4480 3550 50  0000 L CNN
F 2 "" H 4350 3550 50  0001 C CNN
F 3 "~" H 4350 3550 50  0001 C CNN
F 4 "Y" H 4350 3550 50  0001 L CNN "Spice_Netlist_Enabled"
F 5 "V" H 4350 3550 50  0001 L CNN "Spice_Primitive"
F 6 "pulse(0 5 75ms 2n 2n 95ms 100ms)" H 4480 3459 50  0000 L CNN "Spice_Model"
	1    4350 3550
	1    0    0    -1  
$EndComp
Wire Wire Line
	4350 3750 4350 4600
Wire Wire Line
	4350 4600 3500 4600
Connection ~ 3500 4600
Wire Wire Line
	4350 3250 4350 3350
Wire Wire Line
	1250 4450 1250 4600
Connection ~ 1900 4600
Wire Wire Line
	1250 4600 1900 4600
Connection ~ 1250 4600
Wire Wire Line
	1250 4600 1250 4750
$Comp
L Simulation_SPICE:VDC VBOGUS1
U 1 1 6056FD5A
P 1250 3550
F 0 "VBOGUS1" H 1380 3641 50  0000 L CNN
F 1 "0" H 1380 3550 50  0000 L CNN
F 2 "" H 1250 3550 50  0001 C CNN
F 3 "~" H 1250 3550 50  0001 C CNN
F 4 "Y" H 1250 3550 50  0001 L CNN "Spice_Netlist_Enabled"
F 5 "V" H 1250 3550 50  0001 L CNN "Spice_Primitive"
F 6 "dc(0)" H 1380 3459 50  0000 L CNN "Spice_Model"
	1    1250 3550
	-1   0    0    1   
$EndComp
Wire Wire Line
	1250 3100 1250 3350
$Comp
L Simulation_SPICE:VDC VINJBOGUS1
U 1 1 60581E00
P 15600 3900
F 0 "VINJBOGUS1" H 15730 3991 50  0000 L CNN
F 1 "0" H 15730 3900 50  0000 L CNN
F 2 "" H 15600 3900 50  0001 C CNN
F 3 "~" H 15600 3900 50  0001 C CNN
F 4 "Y" H 15600 3900 50  0001 L CNN "Spice_Netlist_Enabled"
F 5 "V" H 15600 3900 50  0001 L CNN "Spice_Primitive"
F 6 "dc(0)" H 15730 3809 50  0000 L CNN "Spice_Model"
	1    15600 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	15600 4100 15600 4200
$Comp
L pspice:INDUCTOR L5
U 1 1 604E1B13
P 14750 3650
F 0 "L5" H 14750 3865 50  0000 C CNN
F 1 "3.77mH" H 14750 3774 50  0000 C CNN
F 2 "" H 14750 3650 50  0001 C CNN
F 3 "~" H 14750 3650 50  0001 C CNN
	1    14750 3650
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R1
U 1 1 604E1EA3
P 15300 3650
F 0 "R1" V 15095 3650 50  0000 C CNN
F 1 "2.6" V 15186 3650 50  0000 C CNN
F 2 "Upper Left C wired out to Heat Sink" V 15340 3640 50  0001 C CNN
F 3 "~" H 15300 3650 50  0001 C CNN
F 4 "014 measured ceramic" H 15300 3650 50  0001 C CNN "Notes"
	1    15300 3650
	0    1    1    0   
$EndComp
Wire Wire Line
	15450 3650 15600 3650
Wire Wire Line
	15600 3650 15600 3700
Wire Wire Line
	15150 3650 15000 3650
Wire Wire Line
	14500 3650 14300 3650
Wire Wire Line
	14300 3650 14300 3350
Connection ~ 14300 3350
$Comp
L pspice:INDUCTOR L6
U 1 1 605096E6
P 14750 5200
F 0 "L6" H 14750 5415 50  0000 C CNN
F 1 "3.77mH" H 14750 5324 50  0000 C CNN
F 2 "" H 14750 5200 50  0001 C CNN
F 3 "~" H 14750 5200 50  0001 C CNN
	1    14750 5200
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R6
U 1 1 60509CA8
P 15300 5200
F 0 "R6" V 15095 5200 50  0000 C CNN
F 1 "2.6" V 15186 5200 50  0000 C CNN
F 2 "Upper Left C wired out to Heat Sink" V 15340 5190 50  0001 C CNN
F 3 "~" H 15300 5200 50  0001 C CNN
F 4 "014 measured ceramic" H 15300 5200 50  0001 C CNN "Notes"
	1    15300 5200
	0    1    1    0   
$EndComp
Wire Wire Line
	14300 4850 14300 5200
Wire Wire Line
	14300 5200 14500 5200
Connection ~ 14300 4850
Wire Wire Line
	15000 5200 15150 5200
Wire Wire Line
	15600 4850 15600 5200
Wire Wire Line
	15600 5200 15450 5200
$Comp
L pspice:INDUCTOR L7
U 1 1 60533E6C
P 14750 6700
F 0 "L7" H 14750 6915 50  0000 C CNN
F 1 "3.77mH" H 14750 6824 50  0000 C CNN
F 2 "" H 14750 6700 50  0001 C CNN
F 3 "~" H 14750 6700 50  0001 C CNN
	1    14750 6700
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R7
U 1 1 605343A8
P 15300 6700
F 0 "R7" V 15095 6700 50  0000 C CNN
F 1 "2.6" V 15186 6700 50  0000 C CNN
F 2 "Upper Left C wired out to Heat Sink" V 15340 6690 50  0001 C CNN
F 3 "~" H 15300 6700 50  0001 C CNN
F 4 "014 measured ceramic" H 15300 6700 50  0001 C CNN "Notes"
	1    15300 6700
	0    1    1    0   
$EndComp
Wire Wire Line
	15800 6700 15600 6700
Wire Wire Line
	15150 6700 15000 6700
Wire Wire Line
	14500 6700 14300 6700
Wire Wire Line
	14300 6700 14300 6350
Connection ~ 14300 6350
Wire Wire Line
	15600 6350 15600 6700
Connection ~ 15600 6700
Wire Wire Line
	15600 6700 15450 6700
$Comp
L pspice:INDUCTOR L8
U 1 1 6055808F
P 14750 8200
F 0 "L8" H 14750 8415 50  0000 C CNN
F 1 "3.77mH" H 14750 8324 50  0000 C CNN
F 2 "" H 14750 8200 50  0001 C CNN
F 3 "~" H 14750 8200 50  0001 C CNN
	1    14750 8200
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R8
U 1 1 60558449
P 15300 8200
F 0 "R8" V 15095 8200 50  0000 C CNN
F 1 "2.6" V 15186 8200 50  0000 C CNN
F 2 "Upper Left C wired out to Heat Sink" V 15340 8190 50  0001 C CNN
F 3 "~" H 15300 8200 50  0001 C CNN
F 4 "014 measured ceramic" H 15300 8200 50  0001 C CNN "Notes"
	1    15300 8200
	0    1    1    0   
$EndComp
Wire Wire Line
	15800 8200 15600 8200
Wire Wire Line
	15150 8200 15000 8200
Wire Wire Line
	14500 8200 14300 8200
Wire Wire Line
	14300 8200 14300 7850
Connection ~ 14300 7850
Wire Wire Line
	15600 7850 15600 8200
Connection ~ 15600 8200
Wire Wire Line
	15600 8200 15450 8200
Text GLabel 15600 3350 2    50   UnSpc ~ 0
E11-GND
$Comp
L Simulation_SPICE:VDC VINJGROUPBOGUS1
U 1 1 6057F436
P 15600 5500
F 0 "VINJGROUPBOGUS1" H 14800 5500 50  0000 L CNN
F 1 "0" H 15730 5500 50  0000 L CNN
F 2 "" H 15600 5500 50  0001 C CNN
F 3 "~" H 15600 5500 50  0001 C CNN
F 4 "Y" H 15600 5500 50  0001 L CNN "Spice_Netlist_Enabled"
F 5 "V" H 15600 5500 50  0001 L CNN "Spice_Primitive"
F 6 "dc(0)" H 15730 5409 50  0000 L CNN "Spice_Model"
	1    15600 5500
	1    0    0    -1  
$EndComp
Wire Wire Line
	15600 5200 15600 5300
Connection ~ 15600 5200
Wire Wire Line
	15600 5700 15600 5800
Wire Wire Line
	15600 5800 15800 5800
$Comp
L Simulation_SPICE:VDC VD3BOGUS1
U 1 1 606361A5
P 12700 2450
F 0 "VD3BOGUS1" H 12830 2541 50  0000 L CNN
F 1 "0" H 12830 2450 50  0000 L CNN
F 2 "" H 12700 2450 50  0001 C CNN
F 3 "~" H 12700 2450 50  0001 C CNN
F 4 "Y" H 12700 2450 50  0001 L CNN "Spice_Netlist_Enabled"
F 5 "V" H 12700 2450 50  0001 L CNN "Spice_Primitive"
F 6 "dc(0)" H 12830 2359 50  0000 L CNN "Spice_Model"
	1    12700 2450
	1    0    0    -1  
$EndComp
Wire Wire Line
	11950 2500 11950 2750
Wire Wire Line
	12150 2650 12500 2650
Wire Wire Line
	12500 2650 12500 2250
Wire Wire Line
	12500 2250 12700 2250
Wire Wire Line
	12700 2650 12700 2750
Wire Wire Line
	12700 2750 11950 2750
Connection ~ 11950 2750
$Comp
L Simulation_SPICE:VDC VR508BOGUS
U 1 1 610C9752
P 12450 3800
F 0 "VR508BOGUS" H 12580 3891 50  0000 L CNN
F 1 "0" H 12580 3800 50  0000 L CNN
F 2 "" H 12450 3800 50  0001 C CNN
F 3 "~" H 12450 3800 50  0001 C CNN
F 4 "Y" H 12450 3800 50  0001 L CNN "Spice_Netlist_Enabled"
F 5 "V" H 12450 3800 50  0001 L CNN "Spice_Primitive"
F 6 "dc(0)" H 12580 3709 50  0000 L CNN "Spice_Model"
	1    12450 3800
	1    0    0    -1  
$EndComp
Wire Wire Line
	12450 3500 12450 3600
Wire Wire Line
	12450 4000 12450 4050
Wire Wire Line
	12450 4050 12800 4050
$Comp
L Simulation_SPICE:VDC VR505BOGUS
U 1 1 611A5D53
P 10450 1900
F 0 "VR505BOGUS" H 10580 1991 50  0000 L CNN
F 1 "0" H 10580 1900 50  0000 L CNN
F 2 "" H 10450 1900 50  0001 C CNN
F 3 "~" H 10450 1900 50  0001 C CNN
F 4 "Y" H 10450 1900 50  0001 L CNN "Spice_Netlist_Enabled"
F 5 "V" H 10450 1900 50  0001 L CNN "Spice_Primitive"
F 6 "dc(0)" H 10580 1809 50  0000 L CNN "Spice_Model"
	1    10450 1900
	1    0    0    -1  
$EndComp
Wire Wire Line
	10450 1700 10450 1600
Wire Wire Line
	10450 2100 10450 2250
Wire Wire Line
	11950 2750 11950 3100
Connection ~ 11950 3100
Wire Wire Line
	11950 3100 11950 4000
$Comp
L Simulation_SPICE:VDC VR509BOGUS
U 1 1 611C586E
P 10750 3100
F 0 "VR509BOGUS" V 10550 2900 50  0000 L CNN
F 1 "0" H 10880 3100 50  0000 L CNN
F 2 "" H 10750 3100 50  0001 C CNN
F 3 "~" H 10750 3100 50  0001 C CNN
F 4 "Y" H 10750 3100 50  0001 L CNN "Spice_Netlist_Enabled"
F 5 "V" H 10750 3100 50  0001 L CNN "Spice_Primitive"
F 6 "dc(0)" H 10880 3009 50  0000 L CNN "Spice_Model"
	1    10750 3100
	0    -1   -1   0   
$EndComp
Wire Wire Line
	10950 3100 11950 3100
Wire Wire Line
	10550 3100 10100 3100
$Comp
L Simulation_SPICE:VDC VR503BOGUS
U 1 1 611EF31B
P 7950 2000
F 0 "VR503BOGUS" H 8080 2091 50  0000 L CNN
F 1 "0" H 8080 2000 50  0000 L CNN
F 2 "" H 7950 2000 50  0001 C CNN
F 3 "~" H 7950 2000 50  0001 C CNN
F 4 "Y" H 7950 2000 50  0001 L CNN "Spice_Netlist_Enabled"
F 5 "V" H 7950 2000 50  0001 L CNN "Spice_Primitive"
F 6 "dc(0)" H 8080 1909 50  0000 L CNN "Spice_Model"
	1    7950 2000
	1    0    0    -1  
$EndComp
Wire Wire Line
	7950 1550 7950 1800
Wire Wire Line
	7950 2200 7950 2450
$EndSCHEMATC
