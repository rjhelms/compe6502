EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A 11000 8500
encoding utf-8
Sheet 1 4
Title "VIA I/O Card"
Date "2021-12-19"
Rev "1"
Comp "rjh"
Comment1 "CC-BY-SA 4.0"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Connector_Generic:Conn_02x25_Odd_Even J1
U 1 1 619D47E7
P 1900 3250
F 0 "J1" H 1950 4667 50  0000 C CNN
F 1 "Conn_02x25_Odd_Even" H 1950 4576 50  0000 C CNN
F 2 "Connectors_Custom:EDAC_345-050-520-202_CardEdge" H 1900 3250 50  0001 C CNN
F 3 "~" H 1900 3250 50  0001 C CNN
F 4 "345-050-520-202" H 1900 3250 50  0001 C CNN "MPN"
F 5 "EDAC" H 1900 3250 50  0001 C CNN "Manufacturer"
	1    1900 3250
	-1   0    0    -1  
$EndComp
Wire Wire Line
	1550 2050 1600 2050
Wire Wire Line
	1550 2150 1600 2150
Wire Wire Line
	1550 2250 1600 2250
Wire Wire Line
	1550 2350 1600 2350
Wire Wire Line
	1550 2450 1600 2450
Wire Wire Line
	1550 2550 1600 2550
Wire Wire Line
	1550 2650 1600 2650
Wire Wire Line
	1550 2750 1600 2750
Wire Wire Line
	1550 2850 1600 2850
Wire Wire Line
	1550 2950 1600 2950
Wire Wire Line
	1550 3050 1600 3050
Wire Wire Line
	1550 3150 1600 3150
Wire Wire Line
	1550 3250 1600 3250
Wire Wire Line
	1550 3350 1600 3350
Wire Wire Line
	1550 3450 1600 3450
Wire Wire Line
	1550 3550 1600 3550
Wire Wire Line
	1550 3650 1600 3650
Wire Wire Line
	1550 3750 1600 3750
Wire Wire Line
	1550 3850 1600 3850
Wire Wire Line
	1550 3950 1600 3950
Wire Wire Line
	1550 4050 1600 4050
Wire Wire Line
	1550 4150 1600 4150
Wire Wire Line
	1550 4250 1600 4250
Wire Wire Line
	1550 4350 1600 4350
Wire Wire Line
	1550 4450 1600 4450
Wire Wire Line
	2100 2050 2150 2050
Wire Wire Line
	2100 2150 2150 2150
Wire Wire Line
	2100 2250 2150 2250
Wire Wire Line
	2100 2350 2150 2350
Wire Wire Line
	2100 2450 2150 2450
Wire Wire Line
	2100 2550 2150 2550
Wire Wire Line
	2100 2650 2150 2650
Wire Wire Line
	2100 2750 2150 2750
Wire Wire Line
	2100 2850 2150 2850
Wire Wire Line
	2100 2950 2150 2950
Wire Wire Line
	2100 3050 2150 3050
Wire Wire Line
	2100 3150 2150 3150
Wire Wire Line
	2100 3250 2150 3250
Wire Wire Line
	2100 3350 2150 3350
Wire Wire Line
	2100 3450 2150 3450
Wire Wire Line
	2100 3550 2150 3550
Wire Wire Line
	2100 3650 2150 3650
Wire Wire Line
	2100 3750 2150 3750
Wire Wire Line
	2100 3850 2150 3850
Wire Wire Line
	2100 3950 2150 3950
Wire Wire Line
	2100 4050 2150 4050
Wire Wire Line
	2100 4150 2150 4150
Wire Wire Line
	2100 4250 2150 4250
Wire Wire Line
	2100 4350 2150 4350
Wire Wire Line
	2100 4450 2150 4450
Text Label 4150 2100 2    50   ~ 0
~RES
Text Label 4150 2300 2    50   ~ 0
D0
Text Label 4150 2400 2    50   ~ 0
D1
Text Label 4150 2500 2    50   ~ 0
D2
Text Label 4150 2600 2    50   ~ 0
D3
Text Label 4150 2700 2    50   ~ 0
D4
Text Label 4150 2800 2    50   ~ 0
D5
Text Label 4150 2900 2    50   ~ 0
D6
Text Label 4150 3000 2    50   ~ 0
D7
Text Label 4150 3200 2    50   ~ 0
A0
Text Label 4150 3300 2    50   ~ 0
A1
Text Label 4150 3400 2    50   ~ 0
A2
Text Label 4150 3500 2    50   ~ 0
A3
Text Label 4150 3800 2    50   ~ 0
~RW
Text Label 4150 4100 2    50   ~ 0
~IOSEL
Text Label 4150 4000 2    50   ~ 0
+5V
Text Label 4150 4300 2    50   ~ 0
PH2
Wire Wire Line
	4150 2100 4200 2100
Wire Wire Line
	4150 2300 4200 2300
Wire Wire Line
	4150 2400 4200 2400
Wire Wire Line
	4150 2500 4200 2500
Wire Wire Line
	4150 2600 4200 2600
Wire Wire Line
	4150 2700 4200 2700
Wire Wire Line
	4150 2800 4200 2800
Wire Wire Line
	4150 2900 4200 2900
Wire Wire Line
	4150 3000 4200 3000
Wire Wire Line
	4150 3200 4200 3200
Wire Wire Line
	4150 3300 4200 3300
Wire Wire Line
	4150 3400 4200 3400
Wire Wire Line
	4150 3500 4200 3500
Wire Wire Line
	4150 3800 4200 3800
Wire Wire Line
	4150 4000 4200 4000
Wire Wire Line
	4150 4100 4200 4100
Wire Wire Line
	4150 4300 4200 4300
$Comp
L power:GND #PWR04
U 1 1 61A10F10
P 4600 4650
F 0 "#PWR04" H 4600 4400 50  0001 C CNN
F 1 "GND" H 4605 4477 50  0000 C CNN
F 2 "" H 4600 4650 50  0001 C CNN
F 3 "" H 4600 4650 50  0001 C CNN
	1    4600 4650
	1    0    0    -1  
$EndComp
Wire Wire Line
	4600 4600 4600 4650
$Comp
L power:+5V #PWR03
U 1 1 61A13533
P 4600 1750
F 0 "#PWR03" H 4600 1600 50  0001 C CNN
F 1 "+5V" H 4615 1923 50  0000 C CNN
F 2 "" H 4600 1750 50  0001 C CNN
F 3 "" H 4600 1750 50  0001 C CNN
	1    4600 1750
	1    0    0    -1  
$EndComp
Wire Wire Line
	4600 1750 4600 1800
NoConn ~ 5000 4200
NoConn ~ 5000 4300
Text Label 5050 2100 0    50   ~ 0
KBD0
Text Label 5050 2200 0    50   ~ 0
KBD1
Text Label 5050 2300 0    50   ~ 0
KBD2
Text Label 5050 2400 0    50   ~ 0
KBD3
Text Label 5050 2500 0    50   ~ 0
KBD4
Text Label 5050 2600 0    50   ~ 0
KBD5
Text Label 5050 2700 0    50   ~ 0
KBD6
Text Label 5050 2800 0    50   ~ 0
KBD7
Text Label 6050 4500 2    50   ~ 0
CAS_RX
Text Label 6050 4400 2    50   ~ 0
CAS_TX
Text Label 4150 3700 2    50   ~ 0
~VIAIRQ
$Comp
L Device:CP_Small C1
U 1 1 61A3EE29
P 950 7100
F 0 "C1" H 1038 7146 50  0000 L CNN
F 1 "10u" H 1038 7055 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 950 7100 50  0001 C CNN
F 3 "~" H 950 7100 50  0001 C CNN
F 4 "GRM21BR61E106KA73L" H 950 7100 50  0001 C CNN "MPN"
F 5 "Murata" H 950 7100 50  0001 C CNN "Manufacturer"
	1    950  7100
	1    0    0    -1  
$EndComp
$Comp
L Device:C_Small C2
U 1 1 61A3F42D
P 1350 7100
F 0 "C2" H 1442 7146 50  0000 L CNN
F 1 "100n" H 1442 7055 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 1350 7100 50  0001 C CNN
F 3 "~" H 1350 7100 50  0001 C CNN
F 4 "08055C104JAT2A" H 1350 7100 50  0001 C CNN "MPN"
F 5 "AVX" H 1350 7100 50  0001 C CNN "Manufacturer"
	1    1350 7100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR02
U 1 1 61A3F9C1
P 950 7300
F 0 "#PWR02" H 950 7050 50  0001 C CNN
F 1 "GND" H 955 7127 50  0000 C CNN
F 2 "" H 950 7300 50  0001 C CNN
F 3 "" H 950 7300 50  0001 C CNN
	1    950  7300
	1    0    0    -1  
$EndComp
Wire Wire Line
	950  7200 950  7250
Wire Wire Line
	1350 7200 1350 7250
Wire Wire Line
	1350 7250 950  7250
Connection ~ 950  7250
Wire Wire Line
	950  7250 950  7300
Wire Wire Line
	1350 7000 1350 6950
Wire Wire Line
	1350 6950 950  6950
Wire Wire Line
	950  6950 950  7000
$Comp
L power:+5V #PWR01
U 1 1 61A475D9
P 950 6900
F 0 "#PWR01" H 950 6750 50  0001 C CNN
F 1 "+5V" H 965 7073 50  0000 C CNN
F 2 "" H 950 6900 50  0001 C CNN
F 3 "" H 950 6900 50  0001 C CNN
	1    950  6900
	1    0    0    -1  
$EndComp
Wire Wire Line
	950  6900 950  6950
Connection ~ 950  6950
Wire Wire Line
	5200 4400 6100 4400
Text Label 6050 4600 2    50   ~ 0
PH2
Wire Wire Line
	6050 4600 6100 4600
$Comp
L conn-custom:Conn_Coaxial_Sleeve_Pin2Tip J2
U 1 1 61A5F5E7
P 7750 4400
F 0 "J2" H 7850 4375 50  0000 L CNN
F 1 "RCA" H 7850 4284 50  0000 L CNN
F 2 "Connectors_Custom:Jack_RCA_Switchcraft_PJRAN1X1UxxX" H 7750 4400 50  0001 C CNN
F 3 " ~" H 7750 4400 50  0001 C CNN
F 4 "PJRAN1X1U02AUX" H 7750 4400 50  0001 C CNN "MPN"
F 5 "Switchcraft" H 7750 4400 50  0001 C CNN "Manufacturer"
	1    7750 4400
	1    0    0    -1  
$EndComp
$Comp
L conn-custom:Conn_Coaxial_Sleeve_Pin2Tip J3
U 1 1 61A60295
P 7750 5000
F 0 "J3" H 7850 4975 50  0000 L CNN
F 1 "RCA" H 7850 4884 50  0000 L CNN
F 2 "Connectors_Custom:Jack_RCA_Switchcraft_PJRAN1X1UxxX" H 7750 5000 50  0001 C CNN
F 3 " ~" H 7750 5000 50  0001 C CNN
F 4 "PJRAN1X1U02AUX" H 7750 5000 50  0001 C CNN "MPN"
F 5 "Switchcraft" H 7750 5000 50  0001 C CNN "Manufacturer"
	1    7750 5000
	1    0    0    -1  
$EndComp
Wire Wire Line
	7050 4400 7500 4400
Wire Wire Line
	7500 5000 7400 5000
Wire Wire Line
	7400 5000 7400 4500
Wire Wire Line
	7400 4500 7050 4500
NoConn ~ 7500 4500
NoConn ~ 7500 5100
$Comp
L power:GND #PWR05
U 1 1 61A7887D
P 7750 4650
F 0 "#PWR05" H 7750 4400 50  0001 C CNN
F 1 "GND" H 7755 4477 50  0000 C CNN
F 2 "" H 7750 4650 50  0001 C CNN
F 3 "" H 7750 4650 50  0001 C CNN
	1    7750 4650
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR06
U 1 1 61A78B96
P 7750 5250
F 0 "#PWR06" H 7750 5000 50  0001 C CNN
F 1 "GND" H 7755 5077 50  0000 C CNN
F 2 "" H 7750 5250 50  0001 C CNN
F 3 "" H 7750 5250 50  0001 C CNN
	1    7750 5250
	1    0    0    -1  
$EndComp
Wire Wire Line
	7750 4600 7750 4650
Wire Wire Line
	7750 5200 7750 5250
Entry Wire Line
	5300 2100 5400 2200
Entry Wire Line
	5300 2200 5400 2300
Entry Wire Line
	5300 2300 5400 2400
Entry Wire Line
	5300 2400 5400 2500
Entry Wire Line
	5300 2500 5400 2600
Entry Wire Line
	5300 2600 5400 2700
Entry Wire Line
	5300 2700 5400 2800
Entry Wire Line
	5300 2800 5400 2900
Wire Wire Line
	5000 2100 5300 2100
Wire Wire Line
	5000 2200 5300 2200
Wire Wire Line
	5000 2500 5300 2500
Wire Wire Line
	5000 2600 5300 2600
Wire Wire Line
	5000 2700 5300 2700
Wire Wire Line
	5000 2800 5300 2800
$Sheet
S 6100 4300 950  400 
U 61A54C0B
F0 "CassetteModem" 50
F1 "CassetteModem.sch" 50
F2 "CAS_RX" O L 6100 4500 50 
F3 "CAS_TX" I L 6100 4400 50 
F4 "CAS_OUT" O R 7050 4500 50 
F5 "CAS_IN" I R 7050 4400 50 
F6 "PH2" I L 6100 4600 50 
$EndSheet
Text Label 2150 2050 0    50   ~ 0
A0
Text Label 2150 2150 0    50   ~ 0
A1
Text Label 2150 2250 0    50   ~ 0
A2
Text Label 2150 2350 0    50   ~ 0
A3
Text Label 2150 2450 0    50   ~ 0
A4
Text Label 2150 2550 0    50   ~ 0
A5
Text Label 2150 2650 0    50   ~ 0
A6
Text Label 2150 2750 0    50   ~ 0
A7
Text Label 2150 2850 0    50   ~ 0
A8
Text Label 2150 2950 0    50   ~ 0
A9
Text Label 2150 3050 0    50   ~ 0
A10
Text Label 2150 3150 0    50   ~ 0
A11
Text Label 2150 3250 0    50   ~ 0
A12
Text Label 2150 3350 0    50   ~ 0
A13
Text Label 2150 3450 0    50   ~ 0
A14
Text Label 2150 3550 0    50   ~ 0
A15
Text Label 2150 3650 0    50   ~ 0
GND
Text Label 2150 3750 0    50   ~ 0
D0
Text Label 2150 3850 0    50   ~ 0
D1
Text Label 2150 3950 0    50   ~ 0
D2
Text Label 2150 4050 0    50   ~ 0
D3
Text Label 2150 4150 0    50   ~ 0
D4
Text Label 2150 4250 0    50   ~ 0
D5
Text Label 2150 4350 0    50   ~ 0
D6
Text Label 2150 4450 0    50   ~ 0
D7
Text Label 1550 2050 2    50   ~ 0
-12V
Text Label 1550 2150 2    50   ~ 0
+12V
Text Label 1550 2250 2    50   ~ 0
+5V
Text Label 1550 2350 2    50   ~ 0
GND
Text Label 1550 2450 2    50   ~ 0
PH2
Text Label 1550 2550 2    50   ~ 0
~RES
Text Label 1550 2750 2    50   ~ 0
RDY
Text Label 1550 2850 2    50   ~ 0
~RW
Text Label 1550 3050 2    50   ~ 0
~IRQ
Text Label 1550 3350 2    50   ~ 0
~NMI
Text Label 1550 3450 2    50   ~ 0
14M
Text Label 1550 3650 2    50   ~ 0
SYNC
Text Label 1550 3750 2    50   ~ 0
BE
Text Label 1550 3250 2    50   ~ 0
GND
Text Label 1550 3150 2    50   ~ 0
DMA
Text Label 1550 3550 2    50   ~ 0
GND
Text Label 1550 3850 2    50   ~ 0
GND
Text Label 1550 4050 2    50   ~ 0
USR0
Text Label 1550 4150 2    50   ~ 0
USR1
Text Label 1550 4350 2    50   ~ 0
USR2
Text Label 1550 4450 2    50   ~ 0
USR3
Text Label 1550 4250 2    50   ~ 0
GND
$Comp
L Device:D_Small D1
U 1 1 61E68CE1
P 3700 3700
F 0 "D1" H 3700 3493 50  0000 C CNN
F 1 "BAT54T1G" H 3700 3584 50  0000 C CNN
F 2 "Diode_SMD:D_SOD-123" V 3700 3700 50  0001 C CNN
F 3 "~" V 3700 3700 50  0001 C CNN
F 4 "BAT54T1G" H 3700 3700 50  0001 C CNN "MPN"
F 5 "onsemi" H 3700 3700 50  0001 C CNN "Manufacturer"
	1    3700 3700
	-1   0    0    1   
$EndComp
Wire Wire Line
	3800 3700 4200 3700
Text Label 3500 3700 2    50   ~ 0
~IRQ
Wire Wire Line
	3600 3700 3500 3700
Text Label 1550 2650 2    50   ~ 0
GND
Text Label 1550 2950 2    50   ~ 0
GND
Text Label 1550 3950 2    50   ~ 0
~IOSEL
Text Label 5050 3300 0    50   ~ 0
SD_MISO
Text Label 5050 3400 0    50   ~ 0
SD_MOSI
Text Label 5050 3500 0    50   ~ 0
SD_SCK
Text Label 5050 3600 0    50   ~ 0
SD_CS
$Comp
L WDC_65Cx:W65C22SxxPL U1
U 1 1 61A381C7
P 4600 3200
F 0 "U1" H 4300 4550 50  0000 C CNN
F 1 "W65C22SxxPL" H 4900 4550 50  0000 C CNN
F 2 "Package_LCC:PLCC-44_THT-Socket" H 4600 3200 50  0001 C CNN
F 3 "https://www.westerndesigncenter.com/wdc/documentation/w65c22.pdf" H 4600 3200 50  0001 C CNN
F 4 "W65C22S6TPLG-14" H 4600 3200 50  0001 C CNN "MPN"
F 5 "Western Design Center" H 4600 3200 50  0001 C CNN "Manufacturer"
	1    4600 3200
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_02x03_Odd_Even J?
U 1 1 61C4F9F9
P 6500 3300
AR Path="/61AADDA6/61C4F9F9" Ref="J?"  Part="1" 
AR Path="/61C4F9F9" Ref="J6"  Part="1" 
F 0 "J6" H 6550 3617 50  0000 C CNN
F 1 "Conn_02x03_Odd_Even" H 6550 3526 50  0000 C CNN
F 2 "Connector_IDC:IDC-Header_2x03_P2.54mm_Vertical" H 6500 3300 50  0001 C CNN
F 3 "~" H 6500 3300 50  0001 C CNN
F 4 "54020-44030LF" H 6500 3300 50  0001 C CNN "MPN"
F 5 "Amphenol FCI" H 6500 3300 50  0001 C CNN "Manufacturer"
	1    6500 3300
	1    0    0    -1  
$EndComp
Text Label 6850 3400 0    50   ~ 0
GND
Text Label 6850 3200 0    50   ~ 0
+5V
Wire Wire Line
	6800 3200 6850 3200
Wire Wire Line
	6800 3400 6850 3400
Text Label 6850 3300 0    50   ~ 0
SD_MOSI
$Comp
L Connector:TestPoint TP4
U 1 1 61C60FD7
P 1350 6850
F 0 "TP4" H 1408 6922 50  0000 L CNN
F 1 "TestPoint" V 1395 7038 50  0001 L CNN
F 2 "TestPoint:TestPoint_Keystone_5015_Micro-Minature" H 1550 6850 50  0001 C CNN
F 3 "~" H 1550 6850 50  0001 C CNN
F 4 "S1751-46R" H 1350 6850 50  0001 C CNN "MPN"
F 5 "Harwin" H 1350 6850 50  0001 C CNN "Manufacturer"
	1    1350 6850
	1    0    0    -1  
$EndComp
$Comp
L Connector:TestPoint TP9
U 1 1 61C61774
P 1350 7350
F 0 "TP9" H 1292 7422 50  0000 R CNN
F 1 "TestPoint" V 1395 7538 50  0001 L CNN
F 2 "TestPoint:TestPoint_Keystone_5015_Micro-Minature" H 1550 7350 50  0001 C CNN
F 3 "~" H 1550 7350 50  0001 C CNN
F 4 "S1751-46R" H 1350 7350 50  0001 C CNN "MPN"
F 5 "Harwin" H 1350 7350 50  0001 C CNN "Manufacturer"
	1    1350 7350
	-1   0    0    1   
$EndComp
Wire Wire Line
	1350 6950 1350 6850
Connection ~ 1350 6950
Wire Wire Line
	1350 7250 1350 7350
Connection ~ 1350 7250
Text Label 5050 3800 0    50   ~ 0
SPKR
Wire Wire Line
	5000 4000 5100 4000
Wire Wire Line
	5100 4000 5100 4500
Wire Wire Line
	5100 4500 6100 4500
Wire Wire Line
	5200 4400 5200 3900
Wire Wire Line
	5200 3900 5000 3900
Wire Wire Line
	5000 2400 5300 2400
Wire Wire Line
	5000 2300 5300 2300
Connection ~ 8150 2200
Wire Wire Line
	8150 2200 8250 2200
$Comp
L Connector:TestPoint TP8
U 1 1 61C5327D
P 8250 2200
F 0 "TP8" V 8250 2388 50  0000 L CNN
F 1 "TestPoint" V 8295 2388 50  0001 L CNN
F 2 "TestPoint:TestPoint_Keystone_5015_Micro-Minature" H 8450 2200 50  0001 C CNN
F 3 "~" H 8450 2200 50  0001 C CNN
F 4 "S1751-46R" H 8250 2200 50  0001 C CNN "MPN"
F 5 "Harwin" H 8250 2200 50  0001 C CNN "Manufacturer"
	1    8250 2200
	0    1    1    0   
$EndComp
Wire Wire Line
	7050 2200 8150 2200
Wire Wire Line
	8150 2500 8050 2500
Wire Wire Line
	8150 2200 8150 2500
Wire Wire Line
	8050 2700 8150 2700
Text Label 6000 2200 2    50   ~ 0
KBD[0..7]
NoConn ~ 7450 2700
NoConn ~ 7450 2500
Wire Wire Line
	7400 2600 7450 2600
Wire Wire Line
	8150 2600 8050 2600
Text Label 8150 2600 0    50   ~ 0
GND
Text Label 7400 2600 2    50   ~ 0
+5V
$Comp
L conn-custom:Mini-DIN-6_Shielded J4
U 1 1 61AD7C49
P 7750 2600
F 0 "J4" H 7750 2950 50  0000 C CNN
F 1 "Mini-DIN-6" H 7750 2850 50  0000 C CNN
F 2 "Connectors_Custom:CUI_MD-60S" H 7750 2600 50  0001 C CNN
F 3 "http://service.powerdynamics.com/ec/Catalog17/Section%2011.pdf" H 7750 2600 50  0001 C CNN
F 4 "MD-60S" H 7750 2600 50  0001 C CNN "MPN"
F 5 "CUI Devices" H 7750 2600 50  0001 C CNN "Manufacturer"
	1    7750 2600
	1    0    0    -1  
$EndComp
Text Label 6000 2600 2    50   ~ 0
~RES
Wire Wire Line
	5000 3000 5500 3000
Wire Wire Line
	5500 3000 5500 2300
Wire Wire Line
	5000 3100 5600 3100
Wire Wire Line
	5600 3100 5600 2400
Text Label 5050 3000 0    50   ~ 0
CA1
Text Label 5050 3100 0    50   ~ 0
CA2
Text Label 6250 3200 2    50   ~ 0
SD_MISO
Text Label 6250 3300 2    50   ~ 0
SD_SCK
Text Label 6250 3400 2    50   ~ 0
SD_CS
Wire Wire Line
	6850 3300 6800 3300
Wire Wire Line
	5000 3400 5050 3400
Wire Wire Line
	6250 3400 6300 3400
Wire Wire Line
	5000 3600 5050 3600
Wire Wire Line
	6250 3300 6300 3300
Wire Wire Line
	5050 3500 5000 3500
Wire Wire Line
	6250 3200 6300 3200
Wire Wire Line
	5050 3300 5000 3300
$Comp
L Connector_Generic:Conn_01x02 J8
U 1 1 61B74082
P 7750 3900
F 0 "J8" H 7830 3892 50  0000 L CNN
F 1 "Conn_01x02" H 7830 3801 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Horizontal" H 7750 3900 50  0001 C CNN
F 3 "~" H 7750 3900 50  0001 C CNN
	1    7750 3900
	1    0    0    1   
$EndComp
$Comp
L power:GND #PWR0101
U 1 1 61B74912
P 7450 4000
F 0 "#PWR0101" H 7450 3750 50  0001 C CNN
F 1 "GND" H 7455 3827 50  0000 C CNN
F 2 "" H 7450 4000 50  0001 C CNN
F 3 "" H 7450 4000 50  0001 C CNN
	1    7450 4000
	1    0    0    -1  
$EndComp
Wire Wire Line
	7550 3900 7450 3900
Wire Wire Line
	7450 3900 7450 4000
Wire Wire Line
	7550 3800 7050 3800
Wire Wire Line
	5000 3800 6100 3800
$Sheet
S 6100 3700 950  200 
U 61B7A5AA
F0 "Speaker Amp" 50
F1 "SpeakerAmp.sch" 50
F2 "SPKR_IN" I L 6100 3800 50 
F3 "SPKR_OUT" O R 7050 3800 50 
$EndSheet
Wire Wire Line
	5600 2400 6100 2400
Wire Wire Line
	5500 2300 6100 2300
Wire Wire Line
	6000 2600 6100 2600
Wire Bus Line
	5400 2200 6100 2200
$Sheet
S 6100 2100 950  600 
U 61AADDA6
F0 "KeyboardMCU" 50
F1 "KeyboardMCU.sch" 50
F2 "KBD[0..7]" O L 6100 2200 50 
F3 "~RES" I L 6100 2600 50 
F4 "CA1" B L 6100 2300 50 
F5 "CA2" B L 6100 2400 50 
F6 "KBDATA" B R 7050 2300 50 
F7 "KBCLOCK" B R 7050 2200 50 
F8 "REPT" I L 6100 2500 50 
$EndSheet
Text Label 5050 3700 0    50   ~ 0
KBD_REPT
Wire Wire Line
	5000 3700 5050 3700
Text Label 6050 2500 2    50   ~ 0
KBD_REPT
Wire Wire Line
	6050 2500 6100 2500
Wire Wire Line
	7150 2300 7050 2300
$Comp
L Connector:TestPoint TP7
U 1 1 61C53ACC
P 8250 2950
F 0 "TP7" V 8250 3138 50  0000 L CNN
F 1 "TestPoint" V 8295 3138 50  0001 L CNN
F 2 "TestPoint:TestPoint_Keystone_5015_Micro-Minature" H 8450 2950 50  0001 C CNN
F 3 "~" H 8450 2950 50  0001 C CNN
F 4 "S1751-46R" H 8250 2950 50  0001 C CNN "MPN"
F 5 "Harwin" H 8250 2950 50  0001 C CNN "Manufacturer"
	1    8250 2950
	0    1    1    0   
$EndComp
Wire Wire Line
	7150 2300 7150 2950
Wire Wire Line
	8150 2700 8150 2950
Wire Wire Line
	8150 2950 8250 2950
Connection ~ 8150 2950
Wire Wire Line
	8150 2950 7150 2950
$Comp
L Device:C_Small C23
U 1 1 61CB39C4
P 7750 3200
F 0 "C23" H 7842 3246 50  0000 L CNN
F 1 "100n" H 7842 3155 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 7750 3200 50  0001 C CNN
F 3 "~" H 7750 3200 50  0001 C CNN
F 4 "08055C104JAT2A" H 7750 3200 50  0001 C CNN "MPN"
F 5 "AVX" H 7750 3200 50  0001 C CNN "Manufacturer"
	1    7750 3200
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR012
U 1 1 61CB424E
P 7750 3400
F 0 "#PWR012" H 7750 3150 50  0001 C CNN
F 1 "GND" H 7755 3227 50  0000 C CNN
F 2 "" H 7750 3400 50  0001 C CNN
F 3 "" H 7750 3400 50  0001 C CNN
	1    7750 3400
	1    0    0    -1  
$EndComp
Wire Wire Line
	7750 3300 7750 3400
Text Label 7750 3050 0    50   ~ 0
KBD_S
Wire Wire Line
	7750 2900 7750 3100
Wire Bus Line
	5400 2200 5400 2900
$EndSCHEMATC
