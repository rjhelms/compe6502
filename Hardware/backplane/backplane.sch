EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "Compe 6502 Prototyping Backplane"
Date "2021-12-06"
Rev "1"
Comp "rjh"
Comment1 "CC-BY-SA 4.0"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Connector_Generic:Conn_02x08_Odd_Even J1
U 1 1 619156A8
P 1800 1550
F 0 "J1" H 1850 2067 50  0000 C CNN
F 1 "Conn_02x08_Odd_Even" H 1850 1976 50  0000 C CNN
F 2 "Connector_IDC:IDC-Header_2x08_P2.54mm_Vertical" H 1800 1550 50  0001 C CNN
F 3 "~" H 1800 1550 50  0001 C CNN
F 4 "302-S161" H 1800 1550 50  0001 C CNN "MPN"
F 5 "On Shore" H 1800 1550 50  0001 C CNN "Manufacturer"
	1    1800 1550
	1    0    0    -1  
$EndComp
Text Label 1550 1250 2    50   ~ 0
PH2
Text Label 1550 1350 2    50   ~ 0
~RES
Text Label 1550 1450 2    50   ~ 0
~RW
Text Label 2150 1250 0    50   ~ 0
PH2
Text Label 2150 1350 0    50   ~ 0
RDY
Text Label 2150 1450 0    50   ~ 0
~IRQ
Text Label 2150 1550 0    50   ~ 0
~NMI
Text Label 2150 1650 0    50   ~ 0
SYNC
Text Label 2150 1750 0    50   ~ 0
BE
Text Label 2150 1850 0    50   ~ 0
+5V
Text Label 2150 1950 0    50   ~ 0
GND
Text Label 1550 1950 2    50   ~ 0
GND
Text Label 1550 1850 2    50   ~ 0
+5V
Wire Wire Line
	1550 1250 1600 1250
Wire Wire Line
	1550 1350 1600 1350
Wire Wire Line
	1550 1450 1600 1450
Wire Wire Line
	1550 1850 1600 1850
Wire Wire Line
	1550 1950 1600 1950
Wire Wire Line
	2100 1250 2150 1250
Wire Wire Line
	2100 1350 2150 1350
Wire Wire Line
	2100 1450 2150 1450
Wire Wire Line
	2100 1550 2150 1550
Wire Wire Line
	2100 1650 2150 1650
Wire Wire Line
	2100 1750 2150 1750
Wire Wire Line
	2100 1850 2150 1850
Wire Wire Line
	2100 1950 2150 1950
NoConn ~ 1600 1750
$Comp
L Connector_Generic:Conn_02x08_Odd_Even J2
U 1 1 61917FFD
P 2900 1550
F 0 "J2" H 2950 2067 50  0000 C CNN
F 1 "Conn_02x08_Odd_Even" H 2950 1976 50  0000 C CNN
F 2 "Connector_IDC:IDC-Header_2x08_P2.54mm_Vertical" H 2900 1550 50  0001 C CNN
F 3 "~" H 2900 1550 50  0001 C CNN
F 4 "302-S161" H 2900 1550 50  0001 C CNN "MPN"
F 5 "On Shore" H 2900 1550 50  0001 C CNN "Manufacturer"
	1    2900 1550
	1    0    0    -1  
$EndComp
Text Label 2650 1250 2    50   ~ 0
A0
Text Label 2650 1350 2    50   ~ 0
A2
Text Label 2650 1450 2    50   ~ 0
A4
Text Label 2650 1550 2    50   ~ 0
A6
Text Label 2650 1650 2    50   ~ 0
A8
Text Label 2650 1750 2    50   ~ 0
A10
Text Label 2650 1850 2    50   ~ 0
A12
Text Label 2650 1950 2    50   ~ 0
A14
Text Label 3250 1250 0    50   ~ 0
A1
Text Label 3250 1350 0    50   ~ 0
A3
Text Label 3250 1450 0    50   ~ 0
A5
Text Label 3250 1550 0    50   ~ 0
A7
Text Label 3250 1650 0    50   ~ 0
A9
Text Label 3250 1750 0    50   ~ 0
A11
Text Label 3250 1850 0    50   ~ 0
A13
Text Label 3250 1950 0    50   ~ 0
A15
Wire Wire Line
	2650 1250 2700 1250
Wire Wire Line
	2650 1350 2700 1350
Wire Wire Line
	2650 1450 2700 1450
Wire Wire Line
	2650 1550 2700 1550
Wire Wire Line
	2650 1650 2700 1650
Wire Wire Line
	2650 1750 2700 1750
Wire Wire Line
	2650 1850 2700 1850
Wire Wire Line
	2650 1950 2700 1950
Wire Wire Line
	3200 1250 3250 1250
Wire Wire Line
	3200 1350 3250 1350
Wire Wire Line
	3200 1450 3250 1450
Wire Wire Line
	3200 1550 3250 1550
Wire Wire Line
	3200 1650 3250 1650
Wire Wire Line
	3200 1750 3250 1750
Wire Wire Line
	3200 1850 3250 1850
Wire Wire Line
	3200 1950 3250 1950
$Comp
L Connector_Generic:Conn_02x04_Odd_Even J3
U 1 1 6191CE8A
P 3900 1550
F 0 "J3" H 3950 1867 50  0000 C CNN
F 1 "Conn_02x04_Odd_Even" H 3950 1776 50  0000 C CNN
F 2 "Connector_IDC:IDC-Header_2x04_P2.54mm_Vertical" H 3900 1550 50  0001 C CNN
F 3 "~" H 3900 1550 50  0001 C CNN
F 4 "75869-132LF" H 3900 1550 50  0001 C CNN "MPN"
F 5 "Amphenol FCI" H 3900 1550 50  0001 C CNN "Manufacturer"
	1    3900 1550
	1    0    0    -1  
$EndComp
Text Label 3650 1450 2    50   ~ 0
D0
Text Label 3650 1550 2    50   ~ 0
D2
Text Label 3650 1650 2    50   ~ 0
D4
Text Label 3650 1750 2    50   ~ 0
D6
Text Label 4250 1450 0    50   ~ 0
D1
Text Label 4250 1550 0    50   ~ 0
D3
Text Label 4250 1650 0    50   ~ 0
D5
Text Label 4250 1750 0    50   ~ 0
D7
Wire Wire Line
	3650 1450 3700 1450
Wire Wire Line
	3650 1550 3700 1550
Wire Wire Line
	3650 1650 3700 1650
Wire Wire Line
	3650 1750 3700 1750
Wire Wire Line
	4200 1450 4250 1450
Wire Wire Line
	4200 1550 4250 1550
Wire Wire Line
	4200 1650 4250 1650
Wire Wire Line
	4200 1750 4250 1750
$Comp
L 74xx:74LS138 U1
U 1 1 6192353D
P 9100 1650
F 0 "U1" H 8800 2100 50  0000 C CNN
F 1 "74HC138" H 9400 2100 50  0000 C CNN
F 2 "Package_DIP:DIP-16_W7.62mm_LongPads" H 9100 1650 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74HC138" H 9100 1650 50  0001 C CNN
F 4 "SN74HC138N" H 9100 1650 50  0001 C CNN "MPN"
F 5 "Texas Instruments" H 9100 1650 50  0001 C CNN "Manufacturer"
	1    9100 1650
	1    0    0    -1  
$EndComp
Text Label 8550 1850 2    50   ~ 0
A15
Text Label 8550 1450 2    50   ~ 0
A13
Text Label 8550 1350 2    50   ~ 0
A12
Wire Wire Line
	8550 1350 8600 1350
Wire Wire Line
	8550 1450 8600 1450
Wire Wire Line
	8550 1550 8600 1550
Wire Wire Line
	8550 1850 8600 1850
$Comp
L power:GND #PWR02
U 1 1 619275E1
P 8550 2100
F 0 "#PWR02" H 8550 1850 50  0001 C CNN
F 1 "GND" H 8555 1927 50  0000 C CNN
F 2 "" H 8550 2100 50  0001 C CNN
F 3 "" H 8550 2100 50  0001 C CNN
	1    8550 2100
	1    0    0    -1  
$EndComp
Wire Wire Line
	8600 1950 8550 1950
Wire Wire Line
	8550 2050 8600 2050
Wire Wire Line
	8550 2050 8550 2100
$Comp
L power:GND #PWR03
U 1 1 61929C43
P 9100 2400
F 0 "#PWR03" H 9100 2150 50  0001 C CNN
F 1 "GND" H 9105 2227 50  0000 C CNN
F 2 "" H 9100 2400 50  0001 C CNN
F 3 "" H 9100 2400 50  0001 C CNN
	1    9100 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	9100 2350 9100 2400
$Comp
L power:+5V #PWR01
U 1 1 6192ADBC
P 9100 900
F 0 "#PWR01" H 9100 750 50  0001 C CNN
F 1 "+5V" H 9115 1073 50  0000 C CNN
F 2 "" H 9100 900 50  0001 C CNN
F 3 "" H 9100 900 50  0001 C CNN
	1    9100 900 
	1    0    0    -1  
$EndComp
Wire Wire Line
	9100 900  9100 950 
Wire Wire Line
	9600 1350 9650 1350
Wire Wire Line
	9600 1450 9650 1450
Wire Wire Line
	9600 1550 9650 1550
Wire Wire Line
	9600 1650 9650 1650
Wire Wire Line
	9600 1750 9650 1750
Wire Wire Line
	9600 1850 9650 1850
Wire Wire Line
	9600 1950 9650 1950
Wire Wire Line
	9600 2050 9650 2050
$Comp
L Connector_Generic:Conn_02x08_Odd_Even J4
U 1 1 6193AFF2
P 5000 1550
F 0 "J4" H 5050 2067 50  0000 C CNN
F 1 "Conn_02x08_Odd_Even" H 5050 1976 50  0000 C CNN
F 2 "Connector_IDC:IDC-Header_2x08_P2.54mm_Vertical" H 5000 1550 50  0001 C CNN
F 3 "~" H 5000 1550 50  0001 C CNN
F 4 "302-S161" H 5000 1550 50  0001 C CNN "MPN"
F 5 "On Shore" H 5000 1550 50  0001 C CNN "Manufacturer"
	1    5000 1550
	1    0    0    -1  
$EndComp
Text Label 4750 1250 2    50   ~ 0
PH2
Text Label 4750 1350 2    50   ~ 0
~RES
Text Label 4750 1450 2    50   ~ 0
~RW
Text Label 5350 1250 0    50   ~ 0
PH2
Text Label 5350 1350 0    50   ~ 0
RDY
Text Label 5350 1450 0    50   ~ 0
~IRQ
Text Label 5350 1550 0    50   ~ 0
~NMI
Text Label 5350 1650 0    50   ~ 0
SYNC
Text Label 5350 1750 0    50   ~ 0
BE
Text Label 5350 1850 0    50   ~ 0
+5V
Text Label 5350 1950 0    50   ~ 0
GND
Text Label 4750 1950 2    50   ~ 0
GND
Text Label 4750 1850 2    50   ~ 0
+5V
Wire Wire Line
	4750 1250 4800 1250
Wire Wire Line
	4750 1350 4800 1350
Wire Wire Line
	4750 1450 4800 1450
Wire Wire Line
	4750 1850 4800 1850
Wire Wire Line
	4750 1950 4800 1950
Wire Wire Line
	5300 1250 5350 1250
Wire Wire Line
	5300 1350 5350 1350
Wire Wire Line
	5300 1450 5350 1450
Wire Wire Line
	5300 1550 5350 1550
Wire Wire Line
	5300 1650 5350 1650
Wire Wire Line
	5300 1750 5350 1750
Wire Wire Line
	5300 1850 5350 1850
Wire Wire Line
	5300 1950 5350 1950
NoConn ~ 4800 1750
$Comp
L Connector_Generic:Conn_02x08_Odd_Even J5
U 1 1 6193B179
P 6100 1550
F 0 "J5" H 6150 2067 50  0000 C CNN
F 1 "Conn_02x08_Odd_Even" H 6150 1976 50  0000 C CNN
F 2 "Connector_IDC:IDC-Header_2x08_P2.54mm_Vertical" H 6100 1550 50  0001 C CNN
F 3 "~" H 6100 1550 50  0001 C CNN
F 4 "302-S161" H 6100 1550 50  0001 C CNN "MPN"
F 5 "On Shore" H 6100 1550 50  0001 C CNN "Manufacturer"
	1    6100 1550
	1    0    0    -1  
$EndComp
Text Label 5850 1250 2    50   ~ 0
A0
Text Label 5850 1350 2    50   ~ 0
A2
Text Label 5850 1450 2    50   ~ 0
A4
Text Label 5850 1550 2    50   ~ 0
A6
Text Label 5850 1650 2    50   ~ 0
A8
Text Label 5850 1750 2    50   ~ 0
A10
Text Label 5850 1850 2    50   ~ 0
A12
Text Label 5850 1950 2    50   ~ 0
A14
Text Label 6450 1250 0    50   ~ 0
A1
Text Label 6450 1350 0    50   ~ 0
A3
Text Label 6450 1450 0    50   ~ 0
A5
Text Label 6450 1550 0    50   ~ 0
A7
Text Label 6450 1650 0    50   ~ 0
A9
Text Label 6450 1750 0    50   ~ 0
A11
Text Label 6450 1850 0    50   ~ 0
A13
Text Label 6450 1950 0    50   ~ 0
A15
Wire Wire Line
	5850 1250 5900 1250
Wire Wire Line
	5850 1350 5900 1350
Wire Wire Line
	5850 1450 5900 1450
Wire Wire Line
	5850 1550 5900 1550
Wire Wire Line
	5850 1650 5900 1650
Wire Wire Line
	5850 1750 5900 1750
Wire Wire Line
	5850 1850 5900 1850
Wire Wire Line
	5850 1950 5900 1950
Wire Wire Line
	6400 1250 6450 1250
Wire Wire Line
	6400 1350 6450 1350
Wire Wire Line
	6400 1450 6450 1450
Wire Wire Line
	6400 1550 6450 1550
Wire Wire Line
	6400 1650 6450 1650
Wire Wire Line
	6400 1750 6450 1750
Wire Wire Line
	6400 1850 6450 1850
Wire Wire Line
	6400 1950 6450 1950
$Comp
L Connector_Generic:Conn_02x04_Odd_Even J6
U 1 1 6193B1A3
P 7100 1550
F 0 "J6" H 7150 1867 50  0000 C CNN
F 1 "Conn_02x04_Odd_Even" H 7150 1776 50  0000 C CNN
F 2 "Connector_IDC:IDC-Header_2x04_P2.54mm_Vertical" H 7100 1550 50  0001 C CNN
F 3 "~" H 7100 1550 50  0001 C CNN
F 4 "75869-132LF" H 7100 1550 50  0001 C CNN "MPN"
F 5 "Amphenol FCI" H 7100 1550 50  0001 C CNN "Manufacturer"
	1    7100 1550
	1    0    0    -1  
$EndComp
Text Label 6850 1450 2    50   ~ 0
D0
Text Label 6850 1550 2    50   ~ 0
D2
Text Label 6850 1650 2    50   ~ 0
D4
Text Label 6850 1750 2    50   ~ 0
D6
Text Label 7450 1450 0    50   ~ 0
D1
Text Label 7450 1550 0    50   ~ 0
D3
Text Label 7450 1650 0    50   ~ 0
D5
Text Label 7450 1750 0    50   ~ 0
D7
Wire Wire Line
	6850 1450 6900 1450
Wire Wire Line
	6850 1550 6900 1550
Wire Wire Line
	6850 1650 6900 1650
Wire Wire Line
	6850 1750 6900 1750
Wire Wire Line
	7400 1450 7450 1450
Wire Wire Line
	7400 1550 7450 1550
Wire Wire Line
	7400 1650 7450 1650
Wire Wire Line
	7400 1750 7450 1750
$Comp
L Connector_Generic:Conn_02x25_Odd_Even J7
U 1 1 621E083C
P 2400 4100
F 0 "J7" H 2450 5517 50  0000 C CNN
F 1 "345-050-520-202" H 2450 5426 50  0000 C CNN
F 2 "Connectors_Custom:EDAC_345-050-520-202" H 2400 4100 50  0001 C CNN
F 3 "~" H 2400 4100 50  0001 C CNN
F 4 "345-050-520-202" H 2400 4100 50  0001 C CNN "MPN"
F 5 "EDAC" H 2400 4100 50  0001 C CNN "Manufacturer"
	1    2400 4100
	-1   0    0    -1  
$EndComp
Wire Wire Line
	2050 2900 2100 2900
Wire Wire Line
	2050 3000 2100 3000
Wire Wire Line
	2050 3100 2100 3100
Wire Wire Line
	2050 3200 2100 3200
Wire Wire Line
	2050 3300 2100 3300
Wire Wire Line
	2050 3400 2100 3400
Wire Wire Line
	2050 3500 2100 3500
Wire Wire Line
	2050 3600 2100 3600
Wire Wire Line
	2050 3700 2100 3700
Wire Wire Line
	2050 3800 2100 3800
Wire Wire Line
	2050 3900 2100 3900
Wire Wire Line
	2050 4000 2100 4000
Wire Wire Line
	2050 4100 2100 4100
Wire Wire Line
	2050 4200 2100 4200
Wire Wire Line
	2050 4300 2100 4300
Wire Wire Line
	2050 4400 2100 4400
Wire Wire Line
	2050 4500 2100 4500
Wire Wire Line
	2050 4600 2100 4600
Wire Wire Line
	2050 4700 2100 4700
Wire Wire Line
	2050 4800 2100 4800
Wire Wire Line
	2050 4900 2100 4900
Wire Wire Line
	2050 5000 2100 5000
Wire Wire Line
	2050 5100 2100 5100
Wire Wire Line
	2050 5200 2100 5200
Wire Wire Line
	2050 5300 2100 5300
Wire Wire Line
	2600 2900 2650 2900
Wire Wire Line
	2600 3000 2650 3000
Wire Wire Line
	2600 3100 2650 3100
Wire Wire Line
	2600 3200 2650 3200
Wire Wire Line
	2600 3300 2650 3300
Wire Wire Line
	2600 3400 2650 3400
Wire Wire Line
	2600 3500 2650 3500
Wire Wire Line
	2600 3600 2650 3600
Wire Wire Line
	2600 3700 2650 3700
Wire Wire Line
	2600 3800 2650 3800
Wire Wire Line
	2600 3900 2650 3900
Wire Wire Line
	2600 4000 2650 4000
Wire Wire Line
	2600 4100 2650 4100
Wire Wire Line
	2600 4200 2650 4200
Wire Wire Line
	2600 4300 2650 4300
Wire Wire Line
	2600 4400 2650 4400
Wire Wire Line
	2600 4500 2650 4500
Wire Wire Line
	2600 4600 2650 4600
Wire Wire Line
	2600 4700 2650 4700
Wire Wire Line
	2600 4800 2650 4800
Wire Wire Line
	2600 4900 2650 4900
Wire Wire Line
	2600 5000 2650 5000
Wire Wire Line
	2600 5100 2650 5100
Wire Wire Line
	2600 5200 2650 5200
Wire Wire Line
	2600 5300 2650 5300
$Comp
L Connector_Generic:Conn_02x25_Odd_Even J8
U 1 1 621E0EA6
P 3650 4100
F 0 "J8" H 3700 5517 50  0000 C CNN
F 1 "345-050-520-202" H 3700 5426 50  0000 C CNN
F 2 "Connectors_Custom:EDAC_345-050-520-202" H 3650 4100 50  0001 C CNN
F 3 "~" H 3650 4100 50  0001 C CNN
F 4 "345-050-520-202" H 3650 4100 50  0001 C CNN "MPN"
F 5 "EDAC" H 3650 4100 50  0001 C CNN "Manufacturer"
	1    3650 4100
	-1   0    0    -1  
$EndComp
Wire Wire Line
	3300 2900 3350 2900
Wire Wire Line
	3300 3000 3350 3000
Wire Wire Line
	3300 3100 3350 3100
Wire Wire Line
	3300 3200 3350 3200
Wire Wire Line
	3300 3300 3350 3300
Wire Wire Line
	3300 3400 3350 3400
Wire Wire Line
	3300 3500 3350 3500
Wire Wire Line
	3300 3600 3350 3600
Wire Wire Line
	3300 3700 3350 3700
Wire Wire Line
	3300 3800 3350 3800
Wire Wire Line
	3300 3900 3350 3900
Wire Wire Line
	3300 4000 3350 4000
Wire Wire Line
	3300 4100 3350 4100
Wire Wire Line
	3300 4200 3350 4200
Wire Wire Line
	3300 4300 3350 4300
Wire Wire Line
	3300 4400 3350 4400
Wire Wire Line
	3300 4500 3350 4500
Wire Wire Line
	3300 4600 3350 4600
Wire Wire Line
	3300 4700 3350 4700
Wire Wire Line
	3300 4800 3350 4800
Wire Wire Line
	3300 4900 3350 4900
Wire Wire Line
	3300 5000 3350 5000
Wire Wire Line
	3300 5100 3350 5100
Wire Wire Line
	3300 5200 3350 5200
Wire Wire Line
	3300 5300 3350 5300
Wire Wire Line
	3850 2900 3900 2900
Wire Wire Line
	3850 3000 3900 3000
Wire Wire Line
	3850 3100 3900 3100
Wire Wire Line
	3850 3200 3900 3200
Wire Wire Line
	3850 3300 3900 3300
Wire Wire Line
	3850 3400 3900 3400
Wire Wire Line
	3850 3500 3900 3500
Wire Wire Line
	3850 3600 3900 3600
Wire Wire Line
	3850 3700 3900 3700
Wire Wire Line
	3850 3800 3900 3800
Wire Wire Line
	3850 3900 3900 3900
Wire Wire Line
	3850 4000 3900 4000
Wire Wire Line
	3850 4100 3900 4100
Wire Wire Line
	3850 4200 3900 4200
Wire Wire Line
	3850 4300 3900 4300
Wire Wire Line
	3850 4400 3900 4400
Wire Wire Line
	3850 4500 3900 4500
Wire Wire Line
	3850 4600 3900 4600
Wire Wire Line
	3850 4700 3900 4700
Wire Wire Line
	3850 4800 3900 4800
Wire Wire Line
	3850 4900 3900 4900
Wire Wire Line
	3850 5000 3900 5000
Wire Wire Line
	3850 5100 3900 5100
Wire Wire Line
	3850 5200 3900 5200
Wire Wire Line
	3850 5300 3900 5300
$Comp
L Connector_Generic:Conn_02x25_Odd_Even J9
U 1 1 621E0F14
P 4900 4100
F 0 "J9" H 4950 5517 50  0000 C CNN
F 1 "345-050-520-202" H 4950 5426 50  0000 C CNN
F 2 "Connectors_Custom:EDAC_345-050-520-202" H 4900 4100 50  0001 C CNN
F 3 "~" H 4900 4100 50  0001 C CNN
F 4 "345-050-520-202" H 4900 4100 50  0001 C CNN "MPN"
F 5 "EDAC" H 4900 4100 50  0001 C CNN "Manufacturer"
	1    4900 4100
	-1   0    0    -1  
$EndComp
Wire Wire Line
	4550 2900 4600 2900
Wire Wire Line
	4550 3000 4600 3000
Wire Wire Line
	4550 3100 4600 3100
Wire Wire Line
	4550 3200 4600 3200
Wire Wire Line
	4550 3300 4600 3300
Wire Wire Line
	4550 3400 4600 3400
Wire Wire Line
	4550 3500 4600 3500
Wire Wire Line
	4550 3600 4600 3600
Wire Wire Line
	4550 3700 4600 3700
Wire Wire Line
	4550 3800 4600 3800
Wire Wire Line
	4550 3900 4600 3900
Wire Wire Line
	4550 4000 4600 4000
Wire Wire Line
	4550 4100 4600 4100
Wire Wire Line
	4550 4200 4600 4200
Wire Wire Line
	4550 4300 4600 4300
Wire Wire Line
	4550 4400 4600 4400
Wire Wire Line
	4550 4500 4600 4500
Wire Wire Line
	4550 4600 4600 4600
Wire Wire Line
	4550 4700 4600 4700
Wire Wire Line
	4550 4800 4600 4800
Wire Wire Line
	4550 4900 4600 4900
Wire Wire Line
	4550 5000 4600 5000
Wire Wire Line
	4550 5100 4600 5100
Wire Wire Line
	4550 5200 4600 5200
Wire Wire Line
	4550 5300 4600 5300
Wire Wire Line
	5100 2900 5150 2900
Wire Wire Line
	5100 3000 5150 3000
Wire Wire Line
	5100 3100 5150 3100
Wire Wire Line
	5100 3200 5150 3200
Wire Wire Line
	5100 3300 5150 3300
Wire Wire Line
	5100 3400 5150 3400
Wire Wire Line
	5100 3500 5150 3500
Wire Wire Line
	5100 3600 5150 3600
Wire Wire Line
	5100 3700 5150 3700
Wire Wire Line
	5100 3800 5150 3800
Wire Wire Line
	5100 3900 5150 3900
Wire Wire Line
	5100 4000 5150 4000
Wire Wire Line
	5100 4100 5150 4100
Wire Wire Line
	5100 4200 5150 4200
Wire Wire Line
	5100 4300 5150 4300
Wire Wire Line
	5100 4400 5150 4400
Wire Wire Line
	5100 4500 5150 4500
Wire Wire Line
	5100 4600 5150 4600
Wire Wire Line
	5100 4700 5150 4700
Wire Wire Line
	5100 4800 5150 4800
Wire Wire Line
	5100 4900 5150 4900
Wire Wire Line
	5100 5000 5150 5000
Wire Wire Line
	5100 5100 5150 5100
Wire Wire Line
	5100 5200 5150 5200
Wire Wire Line
	5100 5300 5150 5300
$Comp
L Connector_Generic:Conn_02x25_Odd_Even J10
U 1 1 621E0F82
P 6150 4100
F 0 "J10" H 6200 5517 50  0000 C CNN
F 1 "345-050-520-202" H 6200 5426 50  0000 C CNN
F 2 "Connectors_Custom:EDAC_345-050-520-202" H 6150 4100 50  0001 C CNN
F 3 "~" H 6150 4100 50  0001 C CNN
F 4 "345-050-520-202" H 6150 4100 50  0001 C CNN "MPN"
F 5 "EDAC" H 6150 4100 50  0001 C CNN "Manufacturer"
	1    6150 4100
	-1   0    0    -1  
$EndComp
Wire Wire Line
	5800 2900 5850 2900
Wire Wire Line
	5800 3000 5850 3000
Wire Wire Line
	5800 3100 5850 3100
Wire Wire Line
	5800 3200 5850 3200
Wire Wire Line
	5800 3300 5850 3300
Wire Wire Line
	5800 3400 5850 3400
Wire Wire Line
	5800 3500 5850 3500
Wire Wire Line
	5800 3600 5850 3600
Wire Wire Line
	5800 3700 5850 3700
Wire Wire Line
	5800 3800 5850 3800
Wire Wire Line
	5800 3900 5850 3900
Wire Wire Line
	5800 4000 5850 4000
Wire Wire Line
	5800 4100 5850 4100
Wire Wire Line
	5800 4200 5850 4200
Wire Wire Line
	5800 4300 5850 4300
Wire Wire Line
	5800 4400 5850 4400
Wire Wire Line
	5800 4500 5850 4500
Wire Wire Line
	5800 4600 5850 4600
Wire Wire Line
	5800 4700 5850 4700
Wire Wire Line
	5800 4800 5850 4800
Wire Wire Line
	5800 4900 5850 4900
Wire Wire Line
	5800 5000 5850 5000
Wire Wire Line
	5800 5100 5850 5100
Wire Wire Line
	5800 5200 5850 5200
Wire Wire Line
	5800 5300 5850 5300
Wire Wire Line
	6350 2900 6400 2900
Wire Wire Line
	6350 3000 6400 3000
Wire Wire Line
	6350 3100 6400 3100
Wire Wire Line
	6350 3200 6400 3200
Wire Wire Line
	6350 3300 6400 3300
Wire Wire Line
	6350 3400 6400 3400
Wire Wire Line
	6350 3500 6400 3500
Wire Wire Line
	6350 3600 6400 3600
Wire Wire Line
	6350 3700 6400 3700
Wire Wire Line
	6350 3800 6400 3800
Wire Wire Line
	6350 3900 6400 3900
Wire Wire Line
	6350 4000 6400 4000
Wire Wire Line
	6350 4100 6400 4100
Wire Wire Line
	6350 4200 6400 4200
Wire Wire Line
	6350 4300 6400 4300
Wire Wire Line
	6350 4400 6400 4400
Wire Wire Line
	6350 4500 6400 4500
Wire Wire Line
	6350 4600 6400 4600
Wire Wire Line
	6350 4700 6400 4700
Wire Wire Line
	6350 4800 6400 4800
Wire Wire Line
	6350 4900 6400 4900
Wire Wire Line
	6350 5000 6400 5000
Wire Wire Line
	6350 5100 6400 5100
Wire Wire Line
	6350 5200 6400 5200
Wire Wire Line
	6350 5300 6400 5300
Text Label 1550 1550 2    50   ~ 0
DMA
Text Label 4750 1550 2    50   ~ 0
DMA
Wire Wire Line
	4800 1550 4750 1550
Wire Wire Line
	1600 1550 1550 1550
Text Label 9650 1350 0    50   ~ 0
~IOSEL0
Text Label 9650 1450 0    50   ~ 0
~IOSEL1
Text Label 9650 1550 0    50   ~ 0
~IOSEL2
Text Label 9650 1650 0    50   ~ 0
~IOSEL3
Text Label 9650 1750 0    50   ~ 0
~IOSEL4
Text Label 9650 1850 0    50   ~ 0
~IOSEL5
Text Label 9650 1950 0    50   ~ 0
~IOSEL6
Text Label 9650 2050 0    50   ~ 0
~IOSEL7
Text Label 2850 6600 2    50   ~ 0
~IOSEL7
Text Label 2850 6500 2    50   ~ 0
~IOSEL6
Text Label 2850 6400 2    50   ~ 0
~IOSEL5
Text Label 2850 6300 2    50   ~ 0
~IOSEL4
Text Label 2850 6200 2    50   ~ 0
~IOSEL3
Text Label 2850 6100 2    50   ~ 0
~IOSEL2
Text Label 2850 6000 2    50   ~ 0
~IOSEL1
Text Label 2850 5900 2    50   ~ 0
~IOSEL0
$Comp
L Device:C_Small C1
U 1 1 6340138F
P 9500 950
F 0 "C1" V 9271 950 50  0000 C CNN
F 1 "100n" V 9362 950 50  0000 C CNN
F 2 "Capacitor_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 9500 950 50  0001 C CNN
F 3 "~" H 9500 950 50  0001 C CNN
F 4 "K104K15X7RF5TL2 " H 9500 950 50  0001 C CNN "MPN"
F 5 "Vishay" H 9500 950 50  0001 C CNN "Manufacturer"
	1    9500 950 
	0    1    1    0   
$EndComp
Wire Wire Line
	9100 950  9400 950 
Connection ~ 9100 950 
Wire Wire Line
	9100 950  9100 1050
Wire Wire Line
	9600 950  9700 950 
Wire Wire Line
	9700 950  9700 1000
$Comp
L power:GND #PWR04
U 1 1 634A0263
P 9700 1000
F 0 "#PWR04" H 9700 750 50  0001 C CNN
F 1 "GND" H 9705 827 50  0000 C CNN
F 2 "" H 9700 1000 50  0001 C CNN
F 3 "" H 9700 1000 50  0001 C CNN
	1    9700 1000
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H1
U 1 1 6364DFC1
P 10500 650
F 0 "H1" H 10600 650 50  0000 L CNN
F 1 "MountingHole" H 10600 605 50  0001 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 10500 650 50  0001 C CNN
F 3 "~" H 10500 650 50  0001 C CNN
	1    10500 650 
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H2
U 1 1 6364EB63
P 10500 850
F 0 "H2" H 10600 850 50  0000 L CNN
F 1 "MountingHole" H 10600 805 50  0001 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 10500 850 50  0001 C CNN
F 3 "~" H 10500 850 50  0001 C CNN
	1    10500 850 
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H3
U 1 1 6364ECCA
P 10500 1050
F 0 "H3" H 10600 1050 50  0000 L CNN
F 1 "MountingHole" H 10600 1005 50  0001 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 10500 1050 50  0001 C CNN
F 3 "~" H 10500 1050 50  0001 C CNN
	1    10500 1050
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H4
U 1 1 6364EEF9
P 10500 1250
F 0 "H4" H 10600 1250 50  0000 L CNN
F 1 "MountingHole" H 10600 1205 50  0001 L CNN
F 2 "MountingHole:MountingHole_3.2mm_M3" H 10500 1250 50  0001 C CNN
F 3 "~" H 10500 1250 50  0001 C CNN
	1    10500 1250
	1    0    0    -1  
$EndComp
Text Label 4750 1650 2    50   ~ 0
14M
Text Label 1550 1650 2    50   ~ 0
14M
Wire Wire Line
	4800 1650 4750 1650
Wire Wire Line
	1550 1650 1600 1650
Text Label 2650 2900 0    50   ~ 0
A0
Text Label 2650 3000 0    50   ~ 0
A1
Text Label 2650 3100 0    50   ~ 0
A2
Text Label 2650 3200 0    50   ~ 0
A3
Text Label 2650 3300 0    50   ~ 0
A4
Text Label 2650 3400 0    50   ~ 0
A5
Text Label 2650 3500 0    50   ~ 0
A6
Text Label 2650 3600 0    50   ~ 0
A7
Text Label 2650 3700 0    50   ~ 0
A8
Text Label 2650 3800 0    50   ~ 0
A9
Text Label 2650 3900 0    50   ~ 0
A10
Text Label 2650 4000 0    50   ~ 0
A11
Text Label 2650 4100 0    50   ~ 0
A12
Text Label 2650 4200 0    50   ~ 0
A13
Text Label 2650 4300 0    50   ~ 0
A14
Text Label 2650 4400 0    50   ~ 0
A15
Text Label 2650 4500 0    50   ~ 0
GND
Text Label 2650 4600 0    50   ~ 0
D0
Text Label 2650 4700 0    50   ~ 0
D1
Text Label 2650 4800 0    50   ~ 0
D2
Text Label 2650 4900 0    50   ~ 0
D3
Text Label 2650 5000 0    50   ~ 0
D4
Text Label 2650 5100 0    50   ~ 0
D5
Text Label 2650 5200 0    50   ~ 0
D6
Text Label 2650 5300 0    50   ~ 0
D7
Text Label 2050 2900 2    50   ~ 0
-12V
Text Label 2050 3000 2    50   ~ 0
+12V
Text Label 2050 3100 2    50   ~ 0
+5V
Text Label 2050 3200 2    50   ~ 0
GND
Text Label 2050 3300 2    50   ~ 0
PH2
Text Label 2050 3400 2    50   ~ 0
~RES
Text Label 2050 3500 2    50   ~ 0
GND
Text Label 2050 3600 2    50   ~ 0
RDY
Text Label 2050 3700 2    50   ~ 0
~RW
Text Label 2050 3800 2    50   ~ 0
GND
Text Label 2050 3900 2    50   ~ 0
~IRQ
Text Label 2050 4000 2    50   ~ 0
DMA
Text Label 2050 4100 2    50   ~ 0
GND
Text Label 2050 4200 2    50   ~ 0
~NMI
Text Label 2050 4300 2    50   ~ 0
14M
Text Label 2050 4400 2    50   ~ 0
GND
Text Label 2050 4500 2    50   ~ 0
SYNC
Text Label 2050 4600 2    50   ~ 0
BE
Text Label 2050 4700 2    50   ~ 0
GND
Text Label 2050 4800 2    50   ~ 0
~BIOSEL0
Text Label 2050 4900 2    50   ~ 0
USR0
Text Label 2050 5000 2    50   ~ 0
USR1
Text Label 2050 5100 2    50   ~ 0
GND
Text Label 2050 5200 2    50   ~ 0
USR2
Text Label 2050 5300 2    50   ~ 0
USR3
Text Label 3300 2900 2    50   ~ 0
-12V
Text Label 3300 3000 2    50   ~ 0
+12V
Text Label 3300 3100 2    50   ~ 0
+5V
Text Label 3300 3200 2    50   ~ 0
GND
Text Label 3300 3300 2    50   ~ 0
PH2
Text Label 3300 3400 2    50   ~ 0
~RES
Text Label 3300 3500 2    50   ~ 0
GND
Text Label 3300 3600 2    50   ~ 0
RDY
Text Label 3300 3700 2    50   ~ 0
~RW
Text Label 3300 3800 2    50   ~ 0
GND
Text Label 3300 3900 2    50   ~ 0
~IRQ
Text Label 3300 4000 2    50   ~ 0
DMA
Text Label 3300 4100 2    50   ~ 0
GND
Text Label 3300 4200 2    50   ~ 0
~NMI
Text Label 3300 4300 2    50   ~ 0
14M
Text Label 3300 4400 2    50   ~ 0
GND
Text Label 3300 4500 2    50   ~ 0
SYNC
Text Label 3300 4600 2    50   ~ 0
BE
Text Label 3300 4700 2    50   ~ 0
GND
Text Label 3300 4800 2    50   ~ 0
~BIOSEL1
Text Label 3300 4900 2    50   ~ 0
USR0
Text Label 3300 5000 2    50   ~ 0
USR1
Text Label 3300 5100 2    50   ~ 0
GND
Text Label 3300 5200 2    50   ~ 0
USR2
Text Label 3300 5300 2    50   ~ 0
USR3
Text Label 4550 2900 2    50   ~ 0
-12V
Text Label 4550 3000 2    50   ~ 0
+12V
Text Label 4550 3100 2    50   ~ 0
+5V
Text Label 4550 3200 2    50   ~ 0
GND
Text Label 4550 3300 2    50   ~ 0
PH2
Text Label 4550 3400 2    50   ~ 0
~RES
Text Label 4550 3500 2    50   ~ 0
GND
Text Label 4550 3600 2    50   ~ 0
RDY
Text Label 4550 3700 2    50   ~ 0
~RW
Text Label 4550 3800 2    50   ~ 0
GND
Text Label 4550 3900 2    50   ~ 0
~IRQ
Text Label 4550 4000 2    50   ~ 0
DMA
Text Label 4550 4100 2    50   ~ 0
GND
Text Label 4550 4200 2    50   ~ 0
~NMI
Text Label 4550 4300 2    50   ~ 0
14M
Text Label 4550 4400 2    50   ~ 0
GND
Text Label 4550 4500 2    50   ~ 0
SYNC
Text Label 4550 4600 2    50   ~ 0
BE
Text Label 4550 4700 2    50   ~ 0
GND
Text Label 4550 4800 2    50   ~ 0
~BIOSEL2
Text Label 4550 4900 2    50   ~ 0
USR0
Text Label 4550 5000 2    50   ~ 0
USR1
Text Label 4550 5100 2    50   ~ 0
GND
Text Label 4550 5200 2    50   ~ 0
USR2
Text Label 4550 5300 2    50   ~ 0
USR3
Text Label 5800 2900 2    50   ~ 0
-12V
Text Label 5800 3000 2    50   ~ 0
+12V
Text Label 5800 3100 2    50   ~ 0
+5V
Text Label 5800 3200 2    50   ~ 0
GND
Text Label 5800 3300 2    50   ~ 0
PH2
Text Label 5800 3400 2    50   ~ 0
~RES
Text Label 5800 3500 2    50   ~ 0
GND
Text Label 5800 3600 2    50   ~ 0
RDY
Text Label 5800 3700 2    50   ~ 0
~RW
Text Label 5800 3800 2    50   ~ 0
GND
Text Label 5800 3900 2    50   ~ 0
~IRQ
Text Label 5800 4000 2    50   ~ 0
DMA
Text Label 5800 4100 2    50   ~ 0
GND
Text Label 5800 4200 2    50   ~ 0
~NMI
Text Label 5800 4300 2    50   ~ 0
14M
Text Label 5800 4400 2    50   ~ 0
GND
Text Label 5800 4500 2    50   ~ 0
SYNC
Text Label 5800 4600 2    50   ~ 0
BE
Text Label 5800 4700 2    50   ~ 0
GND
Text Label 5800 4800 2    50   ~ 0
~BIOSEL3
Text Label 5800 4900 2    50   ~ 0
USR0
Text Label 5800 5000 2    50   ~ 0
USR1
Text Label 5800 5100 2    50   ~ 0
GND
Text Label 5800 5200 2    50   ~ 0
USR2
Text Label 5800 5300 2    50   ~ 0
USR3
Text Label 3900 2900 0    50   ~ 0
A0
Text Label 3900 3000 0    50   ~ 0
A1
Text Label 3900 3100 0    50   ~ 0
A2
Text Label 3900 3200 0    50   ~ 0
A3
Text Label 3900 3300 0    50   ~ 0
A4
Text Label 3900 3400 0    50   ~ 0
A5
Text Label 3900 3500 0    50   ~ 0
A6
Text Label 3900 3600 0    50   ~ 0
A7
Text Label 3900 3700 0    50   ~ 0
A8
Text Label 3900 3800 0    50   ~ 0
A9
Text Label 3900 3900 0    50   ~ 0
A10
Text Label 3900 4000 0    50   ~ 0
A11
Text Label 3900 4100 0    50   ~ 0
A12
Text Label 3900 4200 0    50   ~ 0
A13
Text Label 3900 4300 0    50   ~ 0
A14
Text Label 3900 4400 0    50   ~ 0
A15
Text Label 3900 4500 0    50   ~ 0
GND
Text Label 3900 4600 0    50   ~ 0
D0
Text Label 3900 4700 0    50   ~ 0
D1
Text Label 3900 4800 0    50   ~ 0
D2
Text Label 3900 4900 0    50   ~ 0
D3
Text Label 3900 5000 0    50   ~ 0
D4
Text Label 3900 5100 0    50   ~ 0
D5
Text Label 3900 5200 0    50   ~ 0
D6
Text Label 3900 5300 0    50   ~ 0
D7
Text Label 5150 2900 0    50   ~ 0
A0
Text Label 5150 3000 0    50   ~ 0
A1
Text Label 5150 3100 0    50   ~ 0
A2
Text Label 5150 3200 0    50   ~ 0
A3
Text Label 5150 3300 0    50   ~ 0
A4
Text Label 5150 3400 0    50   ~ 0
A5
Text Label 5150 3500 0    50   ~ 0
A6
Text Label 5150 3600 0    50   ~ 0
A7
Text Label 5150 3700 0    50   ~ 0
A8
Text Label 5150 3800 0    50   ~ 0
A9
Text Label 5150 3900 0    50   ~ 0
A10
Text Label 5150 4000 0    50   ~ 0
A11
Text Label 5150 4100 0    50   ~ 0
A12
Text Label 5150 4200 0    50   ~ 0
A13
Text Label 5150 4300 0    50   ~ 0
A14
Text Label 5150 4400 0    50   ~ 0
A15
Text Label 5150 4500 0    50   ~ 0
GND
Text Label 5150 4600 0    50   ~ 0
D0
Text Label 5150 4700 0    50   ~ 0
D1
Text Label 5150 4800 0    50   ~ 0
D2
Text Label 5150 4900 0    50   ~ 0
D3
Text Label 5150 5000 0    50   ~ 0
D4
Text Label 5150 5100 0    50   ~ 0
D5
Text Label 5150 5200 0    50   ~ 0
D6
Text Label 5150 5300 0    50   ~ 0
D7
Text Label 6400 2900 0    50   ~ 0
A0
Text Label 6400 3000 0    50   ~ 0
A1
Text Label 6400 3100 0    50   ~ 0
A2
Text Label 6400 3200 0    50   ~ 0
A3
Text Label 6400 3300 0    50   ~ 0
A4
Text Label 6400 3400 0    50   ~ 0
A5
Text Label 6400 3500 0    50   ~ 0
A6
Text Label 6400 3600 0    50   ~ 0
A7
Text Label 6400 3700 0    50   ~ 0
A8
Text Label 6400 3800 0    50   ~ 0
A9
Text Label 6400 3900 0    50   ~ 0
A10
Text Label 6400 4000 0    50   ~ 0
A11
Text Label 6400 4100 0    50   ~ 0
A12
Text Label 6400 4200 0    50   ~ 0
A13
Text Label 6400 4300 0    50   ~ 0
A14
Text Label 6400 4400 0    50   ~ 0
A15
Text Label 6400 4500 0    50   ~ 0
GND
Text Label 6400 4600 0    50   ~ 0
D0
Text Label 6400 4700 0    50   ~ 0
D1
Text Label 6400 4800 0    50   ~ 0
D2
Text Label 6400 4900 0    50   ~ 0
D3
Text Label 6400 5000 0    50   ~ 0
D4
Text Label 6400 5100 0    50   ~ 0
D5
Text Label 6400 5200 0    50   ~ 0
D6
Text Label 6400 5300 0    50   ~ 0
D7
Text Label 8250 4750 0    50   ~ 0
-12V
Text Label 8250 3550 0    50   ~ 0
+12V
Text Label 8250 3950 0    50   ~ 0
+5V
Text Label 8250 4350 0    50   ~ 0
GND
$Comp
L Device:CP_Small C4
U 1 1 6237EFCE
P 8650 4550
F 0 "C4" H 8738 4596 50  0000 L CNN
F 1 "100u" H 8738 4505 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 8650 4550 50  0001 C CNN
F 3 "~" H 8650 4550 50  0001 C CNN
F 4 "860020573008" H 8650 4550 50  0001 C CNN "MPN"
F 5 "Würth Elektronik" H 8650 4550 50  0001 C CNN "Manufacturer"
	1    8650 4550
	1    0    0    -1  
$EndComp
$Comp
L Device:CP_Small C3
U 1 1 623B6297
P 8650 4150
F 0 "C3" H 8562 4196 50  0000 R CNN
F 1 "100u" H 8562 4105 50  0000 R CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 8650 4150 50  0001 C CNN
F 3 "~" H 8650 4150 50  0001 C CNN
F 4 "860020573008" H 8650 4150 50  0001 C CNN "MPN"
F 5 "Würth Elektronik" H 8650 4150 50  0001 C CNN "Manufacturer"
	1    8650 4150
	1    0    0    -1  
$EndComp
$Comp
L Device:CP_Small C2
U 1 1 623B65E0
P 9200 3750
F 0 "C2" H 9288 3796 50  0000 L CNN
F 1 "100u" H 9288 3705 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D6.3mm_P2.50mm" H 9200 3750 50  0001 C CNN
F 3 "~" H 9200 3750 50  0001 C CNN
F 4 "860020573008" H 9200 3750 50  0001 C CNN "MPN"
F 5 "Würth Elektronik" H 9200 3750 50  0001 C CNN "Manufacturer"
	1    9200 3750
	1    0    0    -1  
$EndComp
Wire Wire Line
	9200 3550 9200 3650
Connection ~ 8650 3950
Wire Wire Line
	8650 3950 8650 4050
Wire Wire Line
	8650 4350 8650 4250
Wire Wire Line
	8650 4350 8650 4450
Connection ~ 8650 4350
Wire Wire Line
	8650 4750 8650 4650
$Comp
L Device:R_Small R1
U 1 1 6256ADFF
P 9450 3550
F 0 "R1" V 9254 3550 50  0000 C CNN
F 1 "3K3" V 9345 3550 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" H 9450 3550 50  0001 C CNN
F 3 "~" H 9450 3550 50  0001 C CNN
F 4 "CF14JT3K30" H 9450 3550 50  0001 C CNN "MPN"
F 5 "Stackpole" H 9450 3550 50  0001 C CNN "Manufacturer"
	1    9450 3550
	0    1    1    0   
$EndComp
$Comp
L Device:LED_Small D1
U 1 1 6256B358
P 9650 3750
F 0 "D1" V 9696 3680 50  0000 R CNN
F 1 "LED_Small" V 9605 3680 50  0000 R CNN
F 2 "LED_THT:LED_D5.0mm" V 9650 3750 50  0001 C CNN
F 3 "~" V 9650 3750 50  0001 C CNN
F 4 "SLR-56MG3F" H 9650 3750 50  0001 C CNN "MPN"
F 5 "Rohm" H 9650 3750 50  0001 C CNN "Manufacturer"
	1    9650 3750
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_Small R2
U 1 1 6256C1B6
P 8900 3950
F 0 "R2" V 8704 3950 50  0000 C CNN
F 1 "1K0" V 8795 3950 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" H 8900 3950 50  0001 C CNN
F 3 "~" H 8900 3950 50  0001 C CNN
F 4 "CF14JT1K00" H 8900 3950 50  0001 C CNN "MPN"
F 5 "Stackpole" H 8900 3950 50  0001 C CNN "Manufacturer"
	1    8900 3950
	0    1    1    0   
$EndComp
$Comp
L Device:LED_Small D2
U 1 1 6256C920
P 9100 4150
F 0 "D2" V 9146 4080 50  0000 R CNN
F 1 "LED_Small" V 9055 4080 50  0000 R CNN
F 2 "LED_THT:LED_D5.0mm" V 9100 4150 50  0001 C CNN
F 3 "~" V 9100 4150 50  0001 C CNN
F 4 "SLR-56MG3F" H 9100 4150 50  0001 C CNN "MPN"
F 5 "Rohm" H 9100 4150 50  0001 C CNN "Manufacturer"
	1    9100 4150
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_Small R3
U 1 1 625A4393
P 8900 4750
F 0 "R3" V 9004 4750 50  0000 C CNN
F 1 "3K3" V 9095 4750 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" H 8900 4750 50  0001 C CNN
F 3 "~" H 8900 4750 50  0001 C CNN
F 4 "CF14JT3K30" H 8900 4750 50  0001 C CNN "MPN"
F 5 "Stackpole" H 8900 4750 50  0001 C CNN "Manufacturer"
	1    8900 4750
	0    1    1    0   
$EndComp
$Comp
L Device:LED_Small D3
U 1 1 625A4B25
P 9100 4550
F 0 "D3" V 9146 4480 50  0000 R CNN
F 1 "LED_Small" V 9055 4480 50  0000 R CNN
F 2 "LED_THT:LED_D5.0mm" V 9100 4550 50  0001 C CNN
F 3 "~" V 9100 4550 50  0001 C CNN
F 4 "SLR-56MG3F" H 9100 4550 50  0001 C CNN "MPN"
F 5 "Rohm" H 9100 4550 50  0001 C CNN "Manufacturer"
	1    9100 4550
	0    -1   -1   0   
$EndComp
Wire Wire Line
	9100 4350 9100 4450
Wire Wire Line
	9100 4750 9100 4650
Connection ~ 8650 4750
Wire Wire Line
	8650 3950 8800 3950
Wire Wire Line
	9000 3950 9100 3950
Wire Wire Line
	9100 3950 9100 4050
Wire Wire Line
	9100 4250 9100 4350
Connection ~ 9100 4350
Wire Wire Line
	9200 3550 9350 3550
Connection ~ 9200 3550
Wire Wire Line
	9550 3550 9650 3550
Wire Wire Line
	9650 3550 9650 3650
$Comp
L Connector_Generic:Conn_02x08_Odd_Even J11
U 1 1 6292DDBA
P 3150 6200
F 0 "J11" H 3200 6717 50  0000 C CNN
F 1 "Conn_02x08_Odd_Even" H 3200 6626 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x08_P2.54mm_Vertical" H 3150 6200 50  0001 C CNN
F 3 "~" H 3150 6200 50  0001 C CNN
	1    3150 6200
	1    0    0    -1  
$EndComp
Wire Wire Line
	2950 5900 2850 5900
Wire Wire Line
	2950 6000 2850 6000
Wire Wire Line
	2950 6100 2850 6100
Wire Wire Line
	2950 6200 2850 6200
Wire Wire Line
	2950 6300 2850 6300
Wire Wire Line
	2950 6400 2850 6400
Wire Wire Line
	2950 6500 2850 6500
Wire Wire Line
	2950 6600 2850 6600
Text Label 3550 5900 0    50   ~ 0
~BIOSEL0
Text Label 3550 6000 0    50   ~ 0
~BIOSEL1
Text Label 3550 6100 0    50   ~ 0
~BIOSEL2
Text Label 3550 6200 0    50   ~ 0
~BIOSEL3
Wire Wire Line
	3550 5900 3450 5900
Wire Wire Line
	3550 6000 3450 6000
Wire Wire Line
	3550 6100 3450 6100
Wire Wire Line
	3550 6200 3450 6200
$Comp
L Connector:Screw_Terminal_01x04 J12
U 1 1 62E1C067
P 7700 3650
F 0 "J12" H 7618 3967 50  0000 C CNN
F 1 "Screw_Terminal_01x04" H 7618 3876 50  0000 C CNN
F 2 "TerminalBlock_Phoenix:TerminalBlock_Phoenix_PT-1,5-4-3.5-H_1x04_P3.50mm_Horizontal" H 7618 3875 50  0001 C CNN
F 3 "~" H 7700 3650 50  0001 C CNN
F 4 "1984633" H 7700 3650 50  0001 C CNN "MPN"
F 5 "Phoenix Contact" H 7700 3650 50  0001 C CNN "Manufacturer"
	1    7700 3650
	-1   0    0    -1  
$EndComp
Wire Wire Line
	8000 3850 8000 4750
Wire Wire Line
	8000 4750 8650 4750
Wire Wire Line
	7900 3850 8000 3850
Wire Wire Line
	7900 3550 9200 3550
Wire Wire Line
	7900 3750 8100 3750
Wire Wire Line
	8100 3750 8100 4350
Wire Wire Line
	8100 4350 8650 4350
Wire Wire Line
	7900 3650 8200 3650
Wire Wire Line
	8200 3650 8200 3950
Wire Wire Line
	8200 3950 8650 3950
Wire Wire Line
	9200 3850 9200 3950
Wire Wire Line
	9200 3950 9650 3950
Wire Wire Line
	9650 3950 9650 3850
$Comp
L power:GND #PWR0101
U 1 1 6333CD3E
P 9650 4050
F 0 "#PWR0101" H 9650 3800 50  0001 C CNN
F 1 "GND" H 9655 3877 50  0000 C CNN
F 2 "" H 9650 4050 50  0001 C CNN
F 3 "" H 9650 4050 50  0001 C CNN
	1    9650 4050
	1    0    0    -1  
$EndComp
Wire Wire Line
	9650 3950 9650 4050
Connection ~ 9650 3950
Text Label 3550 6300 0    50   ~ 0
~BIOSEL0
Text Label 3550 6400 0    50   ~ 0
~BIOSEL1
Text Label 3550 6500 0    50   ~ 0
~BIOSEL2
Text Label 3550 6600 0    50   ~ 0
~BIOSEL3
Wire Wire Line
	3550 6300 3450 6300
Wire Wire Line
	3550 6400 3450 6400
Wire Wire Line
	3550 6500 3450 6500
Wire Wire Line
	3550 6600 3450 6600
Wire Wire Line
	8650 4750 8800 4750
Wire Wire Line
	9000 4750 9100 4750
Wire Wire Line
	8650 4350 9100 4350
Text Label 8550 1550 2    50   ~ 0
A14
Connection ~ 8550 2050
Wire Wire Line
	8550 1950 8550 2050
$EndSCHEMATC
