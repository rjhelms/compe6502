EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 4 5
Title "Decoupling / Bypass Capacitors"
Date "2021-12-24"
Rev "2"
Comp "rjh"
Comment1 "CC-BY-SA 4.0"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Device:C_Small C1
U 1 1 61CF0D54
P 3800 2500
F 0 "C1" H 3892 2546 50  0000 L CNN
F 1 "100n" H 3892 2455 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 3800 2500 50  0001 C CNN
F 3 "~" H 3800 2500 50  0001 C CNN
	1    3800 2500
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C3
U 1 1 61CF106D
P 4200 2500
F 0 "C3" H 4292 2546 50  0000 L CNN
F 1 "100n" H 4292 2455 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 4200 2500 50  0001 C CNN
F 3 "~" H 4200 2500 50  0001 C CNN
	1    4200 2500
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C5
U 1 1 61CF129D
P 4600 2500
F 0 "C5" H 4692 2546 50  0000 L CNN
F 1 "100n" H 4692 2455 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 4600 2500 50  0001 C CNN
F 3 "~" H 4600 2500 50  0001 C CNN
	1    4600 2500
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C7
U 1 1 61CF1500
P 5000 2500
F 0 "C7" H 5092 2546 50  0000 L CNN
F 1 "100n" H 5092 2455 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 5000 2500 50  0001 C CNN
F 3 "~" H 5000 2500 50  0001 C CNN
	1    5000 2500
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C9
U 1 1 61CF16CD
P 5400 2500
F 0 "C9" H 5492 2546 50  0000 L CNN
F 1 "100n" H 5492 2455 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 5400 2500 50  0001 C CNN
F 3 "~" H 5400 2500 50  0001 C CNN
	1    5400 2500
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C11
U 1 1 61CF18E6
P 5800 2500
F 0 "C11" H 5892 2546 50  0000 L CNN
F 1 "100n" H 5892 2455 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 5800 2500 50  0001 C CNN
F 3 "~" H 5800 2500 50  0001 C CNN
	1    5800 2500
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C13
U 1 1 61CF1BCF
P 6200 2500
F 0 "C13" H 6292 2546 50  0000 L CNN
F 1 "100n" H 6292 2455 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 6200 2500 50  0001 C CNN
F 3 "~" H 6200 2500 50  0001 C CNN
	1    6200 2500
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C15
U 1 1 61CF1DD6
P 6600 2500
F 0 "C15" H 6692 2546 50  0000 L CNN
F 1 "100n" H 6692 2455 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 6600 2500 50  0001 C CNN
F 3 "~" H 6600 2500 50  0001 C CNN
	1    6600 2500
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C17
U 1 1 61CF1F72
P 7000 2500
F 0 "C17" H 7092 2546 50  0000 L CNN
F 1 "100n" H 7092 2455 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 7000 2500 50  0001 C CNN
F 3 "~" H 7000 2500 50  0001 C CNN
	1    7000 2500
	1    0    0    -1  
$EndComp
Wire Wire Line
	7000 2400 7000 2350
Wire Wire Line
	7000 2350 6600 2350
Wire Wire Line
	3800 2350 3800 2400
Wire Wire Line
	4200 2400 4200 2350
Connection ~ 4200 2350
Wire Wire Line
	4200 2350 3800 2350
Wire Wire Line
	4600 2400 4600 2350
Connection ~ 4600 2350
Wire Wire Line
	4600 2350 4200 2350
Wire Wire Line
	5000 2400 5000 2350
Connection ~ 5000 2350
Wire Wire Line
	5000 2350 4600 2350
Wire Wire Line
	5400 2400 5400 2350
Connection ~ 5400 2350
Wire Wire Line
	5400 2350 5000 2350
Wire Wire Line
	5800 2400 5800 2350
Connection ~ 5800 2350
Wire Wire Line
	5800 2350 5400 2350
Wire Wire Line
	6200 2400 6200 2350
Connection ~ 6200 2350
Wire Wire Line
	6200 2350 5800 2350
Wire Wire Line
	6600 2400 6600 2350
Connection ~ 6600 2350
Wire Wire Line
	6600 2350 6200 2350
Wire Wire Line
	3800 2600 3800 2650
Wire Wire Line
	3800 2650 4200 2650
Wire Wire Line
	7000 2650 7000 2600
Wire Wire Line
	6600 2600 6600 2650
Connection ~ 6600 2650
Wire Wire Line
	6600 2650 7000 2650
Wire Wire Line
	6200 2600 6200 2650
Connection ~ 6200 2650
Wire Wire Line
	6200 2650 6600 2650
Wire Wire Line
	5800 2600 5800 2650
Connection ~ 5800 2650
Wire Wire Line
	5800 2650 6200 2650
Wire Wire Line
	5400 2600 5400 2650
Connection ~ 5400 2650
Wire Wire Line
	5400 2650 5800 2650
Wire Wire Line
	5000 2600 5000 2650
Connection ~ 5000 2650
Wire Wire Line
	5000 2650 5400 2650
Wire Wire Line
	4600 2600 4600 2650
Connection ~ 4600 2650
Wire Wire Line
	4600 2650 5000 2650
Wire Wire Line
	4200 2600 4200 2650
Connection ~ 4200 2650
Wire Wire Line
	4200 2650 4600 2650
$Comp
L power:+5V #PWR050
U 1 1 61CF5B7A
P 3800 2300
F 0 "#PWR050" H 3800 2150 50  0001 C CNN
F 1 "+5V" H 3815 2473 50  0000 C CNN
F 2 "" H 3800 2300 50  0001 C CNN
F 3 "" H 3800 2300 50  0001 C CNN
	1    3800 2300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR051
U 1 1 61CF674F
P 3800 2700
F 0 "#PWR051" H 3800 2450 50  0001 C CNN
F 1 "GND" H 3805 2527 50  0000 C CNN
F 2 "" H 3800 2700 50  0001 C CNN
F 3 "" H 3800 2700 50  0001 C CNN
	1    3800 2700
	1    0    0    -1  
$EndComp
Wire Wire Line
	3800 2300 3800 2350
Connection ~ 3800 2350
Wire Wire Line
	3800 2650 3800 2700
Connection ~ 3800 2650
$Comp
L Device:C_Small C2
U 1 1 61CF7A57
P 3800 3400
F 0 "C2" H 3892 3446 50  0000 L CNN
F 1 "100n" H 3892 3355 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 3800 3400 50  0001 C CNN
F 3 "~" H 3800 3400 50  0001 C CNN
	1    3800 3400
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C4
U 1 1 61CF7B2D
P 4200 3400
F 0 "C4" H 4292 3446 50  0000 L CNN
F 1 "100n" H 4292 3355 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 4200 3400 50  0001 C CNN
F 3 "~" H 4200 3400 50  0001 C CNN
	1    4200 3400
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C6
U 1 1 61CF7B37
P 4600 3400
F 0 "C6" H 4692 3446 50  0000 L CNN
F 1 "100n" H 4692 3355 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 4600 3400 50  0001 C CNN
F 3 "~" H 4600 3400 50  0001 C CNN
	1    4600 3400
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C8
U 1 1 61CF7B41
P 5000 3400
F 0 "C8" H 5092 3446 50  0000 L CNN
F 1 "100n" H 5092 3355 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 5000 3400 50  0001 C CNN
F 3 "~" H 5000 3400 50  0001 C CNN
	1    5000 3400
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C10
U 1 1 61CF7B4B
P 5400 3400
F 0 "C10" H 5492 3446 50  0000 L CNN
F 1 "100n" H 5492 3355 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 5400 3400 50  0001 C CNN
F 3 "~" H 5400 3400 50  0001 C CNN
	1    5400 3400
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C12
U 1 1 61CF7B55
P 5800 3400
F 0 "C12" H 5892 3446 50  0000 L CNN
F 1 "100n" H 5892 3355 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 5800 3400 50  0001 C CNN
F 3 "~" H 5800 3400 50  0001 C CNN
	1    5800 3400
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C14
U 1 1 61CF7B5F
P 6200 3400
F 0 "C14" H 6292 3446 50  0000 L CNN
F 1 "100n" H 6292 3355 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 6200 3400 50  0001 C CNN
F 3 "~" H 6200 3400 50  0001 C CNN
	1    6200 3400
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C16
U 1 1 61CF7B69
P 6600 3400
F 0 "C16" H 6692 3446 50  0000 L CNN
F 1 "100n" H 6692 3355 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 6600 3400 50  0001 C CNN
F 3 "~" H 6600 3400 50  0001 C CNN
	1    6600 3400
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C18
U 1 1 61CF7B73
P 7000 3400
F 0 "C18" H 7092 3446 50  0000 L CNN
F 1 "100n" H 7092 3355 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 7000 3400 50  0001 C CNN
F 3 "~" H 7000 3400 50  0001 C CNN
	1    7000 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	7000 3300 7000 3250
Wire Wire Line
	7000 3250 6600 3250
Wire Wire Line
	3800 3250 3800 3300
Wire Wire Line
	4200 3300 4200 3250
Connection ~ 4200 3250
Wire Wire Line
	4200 3250 3800 3250
Wire Wire Line
	4600 3300 4600 3250
Connection ~ 4600 3250
Wire Wire Line
	4600 3250 4200 3250
Wire Wire Line
	5000 3300 5000 3250
Connection ~ 5000 3250
Wire Wire Line
	5000 3250 4600 3250
Wire Wire Line
	5400 3300 5400 3250
Connection ~ 5400 3250
Wire Wire Line
	5400 3250 5000 3250
Wire Wire Line
	5800 3300 5800 3250
Connection ~ 5800 3250
Wire Wire Line
	5800 3250 5400 3250
Wire Wire Line
	6200 3300 6200 3250
Connection ~ 6200 3250
Wire Wire Line
	6200 3250 5800 3250
Wire Wire Line
	6600 3300 6600 3250
Connection ~ 6600 3250
Wire Wire Line
	6600 3250 6200 3250
Wire Wire Line
	3800 3500 3800 3550
Wire Wire Line
	3800 3550 4200 3550
Wire Wire Line
	7000 3550 7000 3500
Wire Wire Line
	6600 3500 6600 3550
Connection ~ 6600 3550
Wire Wire Line
	6600 3550 7000 3550
Wire Wire Line
	6200 3500 6200 3550
Connection ~ 6200 3550
Wire Wire Line
	6200 3550 6600 3550
Wire Wire Line
	5800 3500 5800 3550
Connection ~ 5800 3550
Wire Wire Line
	5800 3550 6200 3550
Wire Wire Line
	5400 3500 5400 3550
Connection ~ 5400 3550
Wire Wire Line
	5400 3550 5800 3550
Wire Wire Line
	5000 3500 5000 3550
Connection ~ 5000 3550
Wire Wire Line
	5000 3550 5400 3550
Wire Wire Line
	4600 3500 4600 3550
Connection ~ 4600 3550
Wire Wire Line
	4600 3550 5000 3550
Wire Wire Line
	4200 3500 4200 3550
Connection ~ 4200 3550
Wire Wire Line
	4200 3550 4600 3550
$Comp
L power:+5V #PWR052
U 1 1 61CF7BAD
P 3800 3200
F 0 "#PWR052" H 3800 3050 50  0001 C CNN
F 1 "+5V" H 3815 3373 50  0000 C CNN
F 2 "" H 3800 3200 50  0001 C CNN
F 3 "" H 3800 3200 50  0001 C CNN
	1    3800 3200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR053
U 1 1 61CF7BB7
P 3800 3600
F 0 "#PWR053" H 3800 3350 50  0001 C CNN
F 1 "GND" H 3805 3427 50  0000 C CNN
F 2 "" H 3800 3600 50  0001 C CNN
F 3 "" H 3800 3600 50  0001 C CNN
	1    3800 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	3800 3200 3800 3250
Connection ~ 3800 3250
Wire Wire Line
	3800 3550 3800 3600
Connection ~ 3800 3550
$Comp
L Device:C_Small C19
U 1 1 61DCAF03
P 7400 2500
F 0 "C19" H 7492 2546 50  0000 L CNN
F 1 "100n" H 7492 2455 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 7400 2500 50  0001 C CNN
F 3 "~" H 7400 2500 50  0001 C CNN
	1    7400 2500
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C20
U 1 1 61DCB129
P 7400 3400
F 0 "C20" H 7492 3446 50  0000 L CNN
F 1 "100n" H 7492 3355 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 7400 3400 50  0001 C CNN
F 3 "~" H 7400 3400 50  0001 C CNN
	1    7400 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	7000 2350 7400 2350
Wire Wire Line
	7400 2350 7400 2400
Connection ~ 7000 2350
Wire Wire Line
	7400 2600 7400 2650
Wire Wire Line
	7400 2650 7000 2650
Connection ~ 7000 2650
Wire Wire Line
	7000 3250 7400 3250
Wire Wire Line
	7400 3250 7400 3300
Connection ~ 7000 3250
Wire Wire Line
	7400 3500 7400 3550
Wire Wire Line
	7400 3550 7000 3550
Connection ~ 7000 3550
$Comp
L Device:C_Small C21
U 1 1 61499E12
P 7800 2500
F 0 "C21" H 7892 2546 50  0000 L CNN
F 1 "100n" H 7892 2455 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 7800 2500 50  0001 C CNN
F 3 "~" H 7800 2500 50  0001 C CNN
	1    7800 2500
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C22
U 1 1 61499FC5
P 7800 3400
F 0 "C22" H 7892 3446 50  0000 L CNN
F 1 "100n" H 7892 3355 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 7800 3400 50  0001 C CNN
F 3 "~" H 7800 3400 50  0001 C CNN
	1    7800 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	7400 2350 7800 2350
Wire Wire Line
	7800 2350 7800 2400
Connection ~ 7400 2350
Wire Wire Line
	7400 2650 7800 2650
Wire Wire Line
	7800 2650 7800 2600
Connection ~ 7400 2650
Wire Wire Line
	7400 3250 7800 3250
Wire Wire Line
	7800 3250 7800 3300
Connection ~ 7400 3250
Wire Wire Line
	7800 3550 7800 3500
Connection ~ 7400 3550
$Comp
L Device:C_Small C23
U 1 1 618D34D5
P 8200 2500
F 0 "C23" H 8292 2546 50  0000 L CNN
F 1 "100n" H 8292 2455 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 8200 2500 50  0001 C CNN
F 3 "~" H 8200 2500 50  0001 C CNN
	1    8200 2500
	1    0    0    -1  
$EndComp
Wire Wire Line
	7800 2350 8200 2350
Wire Wire Line
	8200 2350 8200 2400
Connection ~ 7800 2350
Wire Wire Line
	7800 2650 8200 2650
Wire Wire Line
	8200 2650 8200 2600
Connection ~ 7800 2650
$Comp
L Device:C_Small C24
U 1 1 61EBAB4A
P 8200 3400
F 0 "C24" H 8292 3446 50  0000 L CNN
F 1 "100n" H 8292 3355 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 8200 3400 50  0001 C CNN
F 3 "~" H 8200 3400 50  0001 C CNN
	1    8200 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	7800 3250 8200 3250
Wire Wire Line
	8200 3250 8200 3300
Connection ~ 7800 3250
Wire Wire Line
	8200 3550 8200 3500
Wire Wire Line
	7400 3550 7800 3550
Connection ~ 7800 3550
Wire Wire Line
	7800 3550 8200 3550
$Comp
L Device:C_Small C26
U 1 1 61761379
P 4250 4300
F 0 "C26" H 4342 4346 50  0000 L CNN
F 1 "1u" H 4342 4255 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 4250 4300 50  0001 C CNN
F 3 "~" H 4250 4300 50  0001 C CNN
	1    4250 4300
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C27
U 1 1 617616EA
P 4650 4300
F 0 "C27" H 4742 4346 50  0000 L CNN
F 1 "1u" H 4742 4255 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 4650 4300 50  0001 C CNN
F 3 "~" H 4650 4300 50  0001 C CNN
	1    4650 4300
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C28
U 1 1 6176191F
P 5050 4300
F 0 "C28" H 5142 4346 50  0000 L CNN
F 1 "1u" H 5142 4255 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 5050 4300 50  0001 C CNN
F 3 "~" H 5050 4300 50  0001 C CNN
	1    5050 4300
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C29
U 1 1 61761B2B
P 5450 4300
F 0 "C29" H 5542 4346 50  0000 L CNN
F 1 "1u" H 5542 4255 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 5450 4300 50  0001 C CNN
F 3 "~" H 5450 4300 50  0001 C CNN
	1    5450 4300
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C30
U 1 1 61761D81
P 5850 4300
F 0 "C30" H 5942 4346 50  0000 L CNN
F 1 "1u" H 5942 4255 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 5850 4300 50  0001 C CNN
F 3 "~" H 5850 4300 50  0001 C CNN
	1    5850 4300
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C25
U 1 1 617654E6
P 3800 4300
F 0 "C25" H 3892 4346 50  0000 L CNN
F 1 "10u" H 3892 4255 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 3800 4300 50  0001 C CNN
F 3 "~" H 3800 4300 50  0001 C CNN
	1    3800 4300
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR055
U 1 1 6176589A
P 3800 4500
F 0 "#PWR055" H 3800 4250 50  0001 C CNN
F 1 "GND" H 3805 4327 50  0000 C CNN
F 2 "" H 3800 4500 50  0001 C CNN
F 3 "" H 3800 4500 50  0001 C CNN
	1    3800 4500
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR054
U 1 1 61765B74
P 3800 4100
F 0 "#PWR054" H 3800 3950 50  0001 C CNN
F 1 "+5V" H 3815 4273 50  0000 C CNN
F 2 "" H 3800 4100 50  0001 C CNN
F 3 "" H 3800 4100 50  0001 C CNN
	1    3800 4100
	1    0    0    -1  
$EndComp
Wire Wire Line
	3800 4100 3800 4150
Wire Wire Line
	3800 4500 3800 4450
Wire Wire Line
	3800 4450 4250 4450
Wire Wire Line
	5850 4450 5850 4400
Connection ~ 3800 4450
Wire Wire Line
	3800 4450 3800 4400
Wire Wire Line
	5450 4400 5450 4450
Connection ~ 5450 4450
Wire Wire Line
	5450 4450 5850 4450
Wire Wire Line
	5050 4400 5050 4450
Connection ~ 5050 4450
Wire Wire Line
	5050 4450 5450 4450
Wire Wire Line
	4650 4400 4650 4450
Connection ~ 4650 4450
Wire Wire Line
	4650 4450 5050 4450
Wire Wire Line
	4250 4400 4250 4450
Connection ~ 4250 4450
Wire Wire Line
	4250 4450 4650 4450
Wire Wire Line
	3800 4150 4250 4150
Wire Wire Line
	4250 4150 4250 4200
Connection ~ 3800 4150
Wire Wire Line
	3800 4150 3800 4200
Wire Wire Line
	4250 4150 4650 4150
Wire Wire Line
	4650 4150 4650 4200
Connection ~ 4250 4150
Wire Wire Line
	4650 4150 5050 4150
Wire Wire Line
	5050 4150 5050 4200
Connection ~ 4650 4150
Wire Wire Line
	5050 4150 5450 4150
Wire Wire Line
	5450 4150 5450 4200
Connection ~ 5050 4150
Wire Wire Line
	5450 4150 5850 4150
Wire Wire Line
	5850 4150 5850 4200
Connection ~ 5450 4150
$EndSCHEMATC
