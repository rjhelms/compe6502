EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 5 5
Title "System I/O"
Date "2021-07-29"
Rev "1"
Comp "rjh"
Comment1 "CC-BY-SA 4.0"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Text Label 6100 2650 2    50   ~ 0
A0
Text Label 6700 2650 0    50   ~ 0
A1
Text Label 6100 2750 2    50   ~ 0
A2
Text Label 6700 2750 0    50   ~ 0
A3
Text Label 6100 2850 2    50   ~ 0
A4
Text Label 6700 2850 0    50   ~ 0
A5
Text Label 6100 2950 2    50   ~ 0
A6
Text Label 6700 2950 0    50   ~ 0
A7
Text Label 6100 3050 2    50   ~ 0
A8
Text Label 6700 3050 0    50   ~ 0
A9
Text Label 6100 3800 2    50   ~ 0
D0
Text Label 6700 3800 0    50   ~ 0
D1
Text Label 6100 3900 2    50   ~ 0
D2
Text Label 6700 3900 0    50   ~ 0
D3
Text Label 6100 4000 2    50   ~ 0
D4
Text Label 6700 4000 0    50   ~ 0
D5
Text Label 6100 4100 2    50   ~ 0
D6
Text Label 6700 4100 0    50   ~ 0
D7
Text Label 6100 4550 2    50   ~ 0
PH2
Text Label 6100 4750 2    50   ~ 0
R~W
Text Label 6700 4550 0    50   ~ 0
PH2
Text Label 6700 4650 0    50   ~ 0
RDY
Text Label 6700 4750 0    50   ~ 0
~IRQ
Text Label 6700 4850 0    50   ~ 0
~NMI
Text Label 6700 4950 0    50   ~ 0
SYNC
Text Label 6700 5050 0    50   ~ 0
BE
$Comp
L power:+5V #PWR?
U 1 1 61A5B284
P 6100 5150
AR Path="/61A5B284" Ref="#PWR?"  Part="1" 
AR Path="/61A54DB4/61A5B284" Ref="#PWR058"  Part="1" 
F 0 "#PWR058" H 6100 5000 50  0001 C CNN
F 1 "+5V" V 6115 5278 50  0000 L CNN
F 2 "" H 6100 5150 50  0001 C CNN
F 3 "" H 6100 5150 50  0001 C CNN
	1    6100 5150
	0    -1   -1   0   
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 61A5B28A
P 6850 5150
AR Path="/61A5B28A" Ref="#PWR?"  Part="1" 
AR Path="/61A54DB4/61A5B28A" Ref="#PWR060"  Part="1" 
F 0 "#PWR060" H 6850 5000 50  0001 C CNN
F 1 "+5V" V 6865 5278 50  0000 L CNN
F 2 "" H 6850 5150 50  0001 C CNN
F 3 "" H 6850 5150 50  0001 C CNN
	1    6850 5150
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 61A5B290
P 6100 5250
AR Path="/61A5B290" Ref="#PWR?"  Part="1" 
AR Path="/61A54DB4/61A5B290" Ref="#PWR059"  Part="1" 
F 0 "#PWR059" H 6100 5000 50  0001 C CNN
F 1 "GND" V 6105 5122 50  0000 R CNN
F 2 "" H 6100 5250 50  0001 C CNN
F 3 "" H 6100 5250 50  0001 C CNN
	1    6100 5250
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR?
U 1 1 61A5B296
P 6850 5250
AR Path="/61A5B296" Ref="#PWR?"  Part="1" 
AR Path="/61A54DB4/61A5B296" Ref="#PWR061"  Part="1" 
F 0 "#PWR061" H 6850 5000 50  0001 C CNN
F 1 "GND" V 6855 5122 50  0000 R CNN
F 2 "" H 6850 5250 50  0001 C CNN
F 3 "" H 6850 5250 50  0001 C CNN
	1    6850 5250
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6100 4550 6150 4550
Wire Wire Line
	6100 4650 6150 4650
Wire Wire Line
	6100 5150 6150 5150
Wire Wire Line
	6100 5250 6150 5250
Wire Wire Line
	6650 4750 6700 4750
Wire Wire Line
	6650 4950 6700 4950
Wire Wire Line
	6650 5050 6700 5050
Wire Wire Line
	6650 5150 6700 5150
Wire Wire Line
	6650 5250 6800 5250
$Comp
L power:PWR_FLAG #FLG?
U 1 1 61A5B2A8
P 6800 5300
AR Path="/61A5B2A8" Ref="#FLG?"  Part="1" 
AR Path="/61A54DB4/61A5B2A8" Ref="#FLG04"  Part="1" 
F 0 "#FLG04" H 6800 5375 50  0001 C CNN
F 1 "PWR_FLAG" H 6800 5473 50  0001 C CNN
F 2 "" H 6800 5300 50  0001 C CNN
F 3 "~" H 6800 5300 50  0001 C CNN
	1    6800 5300
	-1   0    0    1   
$EndComp
$Comp
L power:PWR_FLAG #FLG?
U 1 1 61A5B2AE
P 6700 5300
AR Path="/61A5B2AE" Ref="#FLG?"  Part="1" 
AR Path="/61A54DB4/61A5B2AE" Ref="#FLG03"  Part="1" 
F 0 "#FLG03" H 6700 5375 50  0001 C CNN
F 1 "PWR_FLAG" H 6700 5473 50  0001 C CNN
F 2 "" H 6700 5300 50  0001 C CNN
F 3 "~" H 6700 5300 50  0001 C CNN
	1    6700 5300
	-1   0    0    1   
$EndComp
Wire Wire Line
	6700 5150 6700 5300
Connection ~ 6700 5150
Wire Wire Line
	6700 5150 6850 5150
Wire Wire Line
	6800 5250 6800 5300
Connection ~ 6800 5250
Wire Wire Line
	6800 5250 6850 5250
Text Label 6100 3350 2    50   ~ 0
A14
Text Label 6100 3250 2    50   ~ 0
A12
Text Label 6100 3150 2    50   ~ 0
A10
Text Label 6700 3350 0    50   ~ 0
A15
Text Label 6700 3250 0    50   ~ 0
A13
Text Label 6700 3150 0    50   ~ 0
A11
$Comp
L Connector_Generic:Conn_02x08_Odd_Even J?
U 1 1 61A5B2C0
P 6350 4850
AR Path="/61A5B2C0" Ref="J?"  Part="1" 
AR Path="/61A54DB4/61A5B2C0" Ref="J7"  Part="1" 
F 0 "J7" H 6400 5367 50  0000 C CNN
F 1 "Conn_02x08_Odd_Even" H 6400 5276 50  0000 C CNN
F 2 "Connector_IDC:IDC-Header_2x08_P2.54mm_Vertical" H 6350 4850 50  0001 C CNN
F 3 "~" H 6350 4850 50  0001 C CNN
	1    6350 4850
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_02x04_Odd_Even J?
U 1 1 61A5B2C6
P 6350 3900
AR Path="/61A5B2C6" Ref="J?"  Part="1" 
AR Path="/61A54DB4/61A5B2C6" Ref="J6"  Part="1" 
F 0 "J6" H 6400 4217 50  0000 C CNN
F 1 "Conn_02x04_Odd_Even" H 6400 4126 50  0000 C CNN
F 2 "Connector_IDC:IDC-Header_2x04_P2.54mm_Vertical" H 6350 3900 50  0001 C CNN
F 3 "~" H 6350 3900 50  0001 C CNN
	1    6350 3900
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_02x08_Odd_Even J?
U 1 1 61A5B2CC
P 6350 2950
AR Path="/61A5B2CC" Ref="J?"  Part="1" 
AR Path="/61A54DB4/61A5B2CC" Ref="J5"  Part="1" 
F 0 "J5" H 6400 3467 50  0000 C CNN
F 1 "Conn_02x08_Odd_Even" H 6400 3376 50  0000 C CNN
F 2 "Connector_IDC:IDC-Header_2x08_P2.54mm_Vertical" H 6350 2950 50  0001 C CNN
F 3 "~" H 6350 2950 50  0001 C CNN
	1    6350 2950
	1    0    0    -1  
$EndComp
Text Label 6100 4650 2    50   ~ 0
~RES
Wire Wire Line
	6700 4650 6650 4650
Wire Wire Line
	6100 4850 6150 4850
Text Label 6100 4850 2    50   ~ 0
RESV1
Text Label 6100 4950 2    50   ~ 0
RESV2
Text Label 6100 5050 2    50   ~ 0
RESV3
Wire Wire Line
	6100 4950 6150 4950
Wire Wire Line
	6100 5050 6150 5050
Text HLabel 7150 3500 2    50   Output ~ 0
A[0..15]
Text HLabel 7150 4250 2    50   Output ~ 0
D[0..7]
Text HLabel 7150 4550 2    50   Output ~ 0
PH2
Text HLabel 7150 4850 2    50   Input ~ 0
~NMI
Entry Wire Line
	6900 2650 7000 2750
Entry Wire Line
	6900 2750 7000 2850
Entry Wire Line
	6900 2850 7000 2950
Entry Wire Line
	6900 2950 7000 3050
Entry Wire Line
	6900 3050 7000 3150
Entry Wire Line
	6900 3150 7000 3250
Entry Wire Line
	6900 3250 7000 3350
Entry Wire Line
	6900 3350 7000 3450
Entry Wire Line
	6900 3800 7000 3900
Entry Wire Line
	6900 3900 7000 4000
Entry Wire Line
	6900 4000 7000 4100
Entry Wire Line
	6900 4100 7000 4200
Entry Wire Line
	5900 2650 5800 2750
Entry Wire Line
	5900 2750 5800 2850
Entry Wire Line
	5900 2850 5800 2950
Entry Wire Line
	5900 2950 5800 3050
Entry Wire Line
	5900 3050 5800 3150
Entry Wire Line
	5900 3150 5800 3250
Entry Wire Line
	5900 3250 5800 3350
Entry Wire Line
	5900 3350 5800 3450
Entry Wire Line
	5900 3800 5800 3900
Entry Wire Line
	5900 3900 5800 4000
Entry Wire Line
	5900 4000 5800 4100
Entry Wire Line
	5900 4100 5800 4200
Wire Wire Line
	6650 2650 6900 2650
Wire Wire Line
	6650 2750 6900 2750
Wire Wire Line
	6650 2850 6900 2850
Wire Wire Line
	6650 2950 6900 2950
Wire Wire Line
	6650 3050 6900 3050
Wire Wire Line
	6650 3150 6900 3150
Wire Wire Line
	6650 3250 6900 3250
Wire Wire Line
	6650 3350 6900 3350
Wire Wire Line
	6650 3800 6900 3800
Wire Wire Line
	6650 3900 6900 3900
Wire Wire Line
	6650 4000 6900 4000
Wire Wire Line
	6650 4100 6900 4100
Wire Wire Line
	5900 2650 6150 2650
Wire Wire Line
	5900 2750 6150 2750
Wire Wire Line
	5900 2850 6150 2850
Wire Wire Line
	5900 2950 6150 2950
Wire Wire Line
	5900 3050 6150 3050
Wire Wire Line
	5900 3150 6150 3150
Wire Wire Line
	5900 3250 6150 3250
Wire Wire Line
	5900 3350 6150 3350
Wire Wire Line
	5900 3800 6150 3800
Wire Wire Line
	5900 3900 6150 3900
Wire Wire Line
	5900 4000 6150 4000
Wire Wire Line
	5900 4100 6150 4100
Wire Bus Line
	7000 3500 7150 3500
Wire Bus Line
	5800 3500 7000 3500
Connection ~ 7000 3500
Wire Bus Line
	5800 4250 7000 4250
Wire Bus Line
	7000 4250 7150 4250
Connection ~ 7000 4250
Wire Wire Line
	6650 4550 7150 4550
Wire Wire Line
	6650 4850 7150 4850
Text HLabel 5850 4750 0    50   Output ~ 0
R~W
Wire Wire Line
	5850 4750 6150 4750
Wire Bus Line
	5800 3900 5800 4250
Wire Bus Line
	7000 3900 7000 4250
Wire Bus Line
	7000 2750 7000 3500
Wire Bus Line
	5800 2750 5800 3500
$EndSCHEMATC
