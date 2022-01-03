EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 5
Title "Horizontal Timing"
Date "2021-12-24"
Rev "2"
Comp "rjh"
Comment1 "CC-BY-SA 4.0"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L 74xx:74LS161 U?
U 1 1 60E7D804
P 2700 2250
AR Path="/60E7D804" Ref="U?"  Part="1" 
AR Path="/60E7C453/60E7D804" Ref="U9"  Part="1" 
AR Path="/60F6B7E4/60E7D804" Ref="U?"  Part="1" 
F 0 "U9" H 2450 2900 50  0000 C CNN
F 1 "74HC161" H 2950 2900 50  0000 C CNN
F 2 "Package_SO:SOIC-16_3.9x9.9mm_P1.27mm" H 2700 2250 50  0001 C CNN
F 3 "" H 2700 2250 50  0001 C CNN
	1    2700 2250
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS161 U?
U 1 1 60E7D80A
P 2700 4300
AR Path="/60E7D80A" Ref="U?"  Part="1" 
AR Path="/60E7C453/60E7D80A" Ref="U10"  Part="1" 
AR Path="/60F6B7E4/60E7D80A" Ref="U?"  Part="1" 
F 0 "U10" H 2450 4950 50  0000 C CNN
F 1 "74HC161" H 2950 4950 50  0000 C CNN
F 2 "Package_SO:SOIC-16_3.9x9.9mm_P1.27mm" H 2700 4300 50  0001 C CNN
F 3 "" H 2700 4300 50  0001 C CNN
	1    2700 4300
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS161 U?
U 1 1 60E7D810
P 2700 6350
AR Path="/60E7D810" Ref="U?"  Part="1" 
AR Path="/60E7C453/60E7D810" Ref="U11"  Part="1" 
AR Path="/60F6B7E4/60E7D810" Ref="U?"  Part="1" 
F 0 "U11" H 2450 7000 50  0000 C CNN
F 1 "74HC161" H 2950 7000 50  0000 C CNN
F 2 "Package_SO:SOIC-16_3.9x9.9mm_P1.27mm" H 2700 6350 50  0001 C CNN
F 3 "" H 2700 6350 50  0001 C CNN
	1    2700 6350
	1    0    0    -1  
$EndComp
Wire Wire Line
	2200 2550 1400 2550
Wire Wire Line
	1400 2550 1400 4600
Wire Wire Line
	1400 4600 2200 4600
Wire Wire Line
	1400 4600 1400 6650
Wire Wire Line
	1400 6650 2200 6650
Connection ~ 1400 4600
Text HLabel 1200 2550 0    50   Input ~ 0
CLOCK
Wire Wire Line
	1200 2550 1400 2550
Connection ~ 1400 2550
Wire Wire Line
	2200 1750 1650 1750
Wire Wire Line
	1650 1750 1650 1850
Wire Wire Line
	1650 6150 2200 6150
Wire Wire Line
	1650 1850 2200 1850
Connection ~ 1650 1850
Wire Wire Line
	1650 1850 1650 1950
Wire Wire Line
	1650 1950 2200 1950
Connection ~ 1650 1950
Wire Wire Line
	1650 1950 1650 2050
Wire Wire Line
	1650 2050 2200 2050
Connection ~ 1650 2050
Wire Wire Line
	1650 2050 1650 3800
Wire Wire Line
	1650 3800 2200 3800
Connection ~ 1650 3800
Wire Wire Line
	1650 3800 1650 3900
Wire Wire Line
	1650 3900 2200 3900
Connection ~ 1650 3900
Wire Wire Line
	1650 3900 1650 4000
Wire Wire Line
	1650 4000 2200 4000
Connection ~ 1650 4000
Wire Wire Line
	1650 4000 1650 4100
Wire Wire Line
	1650 4100 2200 4100
Connection ~ 1650 4100
Wire Wire Line
	1650 4100 1650 5850
Wire Wire Line
	1650 5850 2200 5850
Connection ~ 1650 5850
Wire Wire Line
	1650 5850 1650 5950
Wire Wire Line
	1650 5950 2200 5950
Connection ~ 1650 5950
Wire Wire Line
	1650 5950 1650 6050
Wire Wire Line
	1650 6050 2200 6050
Connection ~ 1650 6050
Wire Wire Line
	1650 6050 1650 6150
$Comp
L power:GND #PWR024
U 1 1 60E7F4A4
P 1650 6250
AR Path="/60E7C453/60E7F4A4" Ref="#PWR024"  Part="1" 
AR Path="/60F6B7E4/60E7F4A4" Ref="#PWR?"  Part="1" 
F 0 "#PWR024" H 1650 6000 50  0001 C CNN
F 1 "GND" H 1655 6077 50  0000 C CNN
F 2 "" H 1650 6250 50  0001 C CNN
F 3 "" H 1650 6250 50  0001 C CNN
	1    1650 6250
	1    0    0    -1  
$EndComp
Wire Wire Line
	1650 6150 1650 6250
Connection ~ 1650 6150
Wire Wire Line
	3200 2250 3300 2250
Wire Wire Line
	3300 2250 3300 3250
Wire Wire Line
	3300 3250 1800 3250
Wire Wire Line
	1800 3250 1800 4500
Wire Wire Line
	1800 4500 2200 4500
Wire Wire Line
	3200 4300 3300 4300
Wire Wire Line
	3300 4300 3300 5300
Wire Wire Line
	3300 5300 1800 5300
Wire Wire Line
	1800 5300 1800 6550
Wire Wire Line
	1800 6550 2200 6550
Wire Wire Line
	2200 2450 2100 2450
Wire Wire Line
	2100 2450 2100 2350
Wire Wire Line
	2100 2250 2200 2250
Wire Wire Line
	2200 2350 2100 2350
Connection ~ 2100 2350
Wire Wire Line
	2100 2350 2100 2250
Wire Wire Line
	2200 4400 2100 4400
Wire Wire Line
	2100 4400 2100 4300
Wire Wire Line
	2100 4300 2200 4300
Wire Wire Line
	2200 6450 2100 6450
Wire Wire Line
	2100 6450 2100 6350
Wire Wire Line
	2100 6350 2200 6350
$Comp
L power:+5V #PWR025
U 1 1 60E85835
P 2100 2250
AR Path="/60E7C453/60E85835" Ref="#PWR025"  Part="1" 
AR Path="/60F6B7E4/60E85835" Ref="#PWR?"  Part="1" 
F 0 "#PWR025" H 2100 2100 50  0001 C CNN
F 1 "+5V" H 2042 2287 50  0000 R CNN
F 2 "" H 2100 2250 50  0001 C CNN
F 3 "" H 2100 2250 50  0001 C CNN
	1    2100 2250
	1    0    0    -1  
$EndComp
Connection ~ 2100 2250
$Comp
L power:+5V #PWR026
U 1 1 60E88813
P 2100 4300
AR Path="/60E7C453/60E88813" Ref="#PWR026"  Part="1" 
AR Path="/60F6B7E4/60E88813" Ref="#PWR?"  Part="1" 
F 0 "#PWR026" H 2100 4150 50  0001 C CNN
F 1 "+5V" H 2042 4337 50  0000 R CNN
F 2 "" H 2100 4300 50  0001 C CNN
F 3 "" H 2100 4300 50  0001 C CNN
	1    2100 4300
	1    0    0    -1  
$EndComp
Connection ~ 2100 4300
$Comp
L power:+5V #PWR027
U 1 1 60E88C8B
P 2100 6350
AR Path="/60E7C453/60E88C8B" Ref="#PWR027"  Part="1" 
AR Path="/60F6B7E4/60E88C8B" Ref="#PWR?"  Part="1" 
F 0 "#PWR027" H 2100 6200 50  0001 C CNN
F 1 "+5V" H 2042 6387 50  0000 R CNN
F 2 "" H 2100 6350 50  0001 C CNN
F 3 "" H 2100 6350 50  0001 C CNN
	1    2100 6350
	1    0    0    -1  
$EndComp
Connection ~ 2100 6350
$Comp
L power:+5V #PWR028
U 1 1 60E8B3FD
P 2700 1400
AR Path="/60E7C453/60E8B3FD" Ref="#PWR028"  Part="1" 
AR Path="/60F6B7E4/60E8B3FD" Ref="#PWR?"  Part="1" 
F 0 "#PWR028" H 2700 1250 50  0001 C CNN
F 1 "+5V" H 2642 1437 50  0000 R CNN
F 2 "" H 2700 1400 50  0001 C CNN
F 3 "" H 2700 1400 50  0001 C CNN
	1    2700 1400
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR030
U 1 1 60E8B83F
P 2700 3450
AR Path="/60E7C453/60E8B83F" Ref="#PWR030"  Part="1" 
AR Path="/60F6B7E4/60E8B83F" Ref="#PWR?"  Part="1" 
F 0 "#PWR030" H 2700 3300 50  0001 C CNN
F 1 "+5V" H 2642 3487 50  0000 R CNN
F 2 "" H 2700 3450 50  0001 C CNN
F 3 "" H 2700 3450 50  0001 C CNN
	1    2700 3450
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR032
U 1 1 60E8BE23
P 2700 5500
AR Path="/60E7C453/60E8BE23" Ref="#PWR032"  Part="1" 
AR Path="/60F6B7E4/60E8BE23" Ref="#PWR?"  Part="1" 
F 0 "#PWR032" H 2700 5350 50  0001 C CNN
F 1 "+5V" H 2642 5537 50  0000 R CNN
F 2 "" H 2700 5500 50  0001 C CNN
F 3 "" H 2700 5500 50  0001 C CNN
	1    2700 5500
	1    0    0    -1  
$EndComp
Wire Wire Line
	2700 1400 2700 1450
Wire Wire Line
	2700 3450 2700 3500
Wire Wire Line
	2700 5500 2700 5550
$Comp
L power:GND #PWR029
U 1 1 60E90F3C
P 2700 3100
AR Path="/60E7C453/60E90F3C" Ref="#PWR029"  Part="1" 
AR Path="/60F6B7E4/60E90F3C" Ref="#PWR?"  Part="1" 
F 0 "#PWR029" H 2700 2850 50  0001 C CNN
F 1 "GND" H 2622 3063 50  0000 R CNN
F 2 "" H 2700 3100 50  0001 C CNN
F 3 "" H 2700 3100 50  0001 C CNN
	1    2700 3100
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR031
U 1 1 60E92C09
P 2700 5150
AR Path="/60E7C453/60E92C09" Ref="#PWR031"  Part="1" 
AR Path="/60F6B7E4/60E92C09" Ref="#PWR?"  Part="1" 
F 0 "#PWR031" H 2700 4900 50  0001 C CNN
F 1 "GND" H 2622 5113 50  0000 R CNN
F 2 "" H 2700 5150 50  0001 C CNN
F 3 "" H 2700 5150 50  0001 C CNN
	1    2700 5150
	1    0    0    -1  
$EndComp
Wire Wire Line
	2700 5100 2700 5150
Wire Wire Line
	2700 3050 2700 3100
$Comp
L power:GND #PWR033
U 1 1 60E95726
P 2700 7200
AR Path="/60E7C453/60E95726" Ref="#PWR033"  Part="1" 
AR Path="/60F6B7E4/60E95726" Ref="#PWR?"  Part="1" 
F 0 "#PWR033" H 2700 6950 50  0001 C CNN
F 1 "GND" H 2622 7163 50  0000 R CNN
F 2 "" H 2700 7200 50  0001 C CNN
F 3 "" H 2700 7200 50  0001 C CNN
	1    2700 7200
	1    0    0    -1  
$EndComp
Wire Wire Line
	2700 7150 2700 7200
Text Label 2200 2750 2    50   ~ 0
~HRESET
Text Label 2200 4800 2    50   ~ 0
~HRESET
Text Label 2200 6850 2    50   ~ 0
~HRESET
NoConn ~ 3200 6050
NoConn ~ 3200 6150
Wire Wire Line
	3200 3800 3900 3800
$Comp
L 74xx:74LS30 U12
U 2 1 6108B33E
P 7300 1500
AR Path="/60E7C453/6108B33E" Ref="U12"  Part="2" 
AR Path="/60F6B7E4/6108B33E" Ref="U?"  Part="2" 
F 0 "U12" H 7530 1546 50  0000 L CNN
F 1 "74HC30" H 7530 1455 50  0000 L CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 7300 1500 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74ls02" H 7300 1500 50  0001 C CNN
	2    7300 1500
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS08 U13
U 5 1 6108B344
P 8100 1500
AR Path="/60E7C453/6108B344" Ref="U13"  Part="5" 
AR Path="/60F6B7E4/6108B344" Ref="U?"  Part="5" 
F 0 "U13" H 8330 1546 50  0000 L CNN
F 1 "74HC08" H 8330 1455 50  0000 L CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 8100 1500 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74hc00" H 8100 1500 50  0001 C CNN
	5    8100 1500
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR035
U 1 1 610C561E
P 7300 900
AR Path="/60E7C453/610C561E" Ref="#PWR035"  Part="1" 
AR Path="/60F6B7E4/610C561E" Ref="#PWR?"  Part="1" 
F 0 "#PWR035" H 7300 750 50  0001 C CNN
F 1 "+5V" H 7242 937 50  0000 R CNN
F 2 "" H 7300 900 50  0001 C CNN
F 3 "" H 7300 900 50  0001 C CNN
	1    7300 900 
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR036
U 1 1 610C5EEF
P 7300 2100
AR Path="/60E7C453/610C5EEF" Ref="#PWR036"  Part="1" 
AR Path="/60F6B7E4/610C5EEF" Ref="#PWR?"  Part="1" 
F 0 "#PWR036" H 7300 1850 50  0001 C CNN
F 1 "GND" H 7222 2063 50  0000 R CNN
F 2 "" H 7300 2100 50  0001 C CNN
F 3 "" H 7300 2100 50  0001 C CNN
	1    7300 2100
	1    0    0    -1  
$EndComp
Wire Wire Line
	7300 900  7300 950 
Wire Wire Line
	7300 950  8100 950 
Connection ~ 7300 950 
Wire Wire Line
	7300 950  7300 1000
Wire Wire Line
	8100 1000 8100 950 
Wire Wire Line
	7300 2000 7300 2050
Wire Wire Line
	7300 2050 8100 2050
Connection ~ 7300 2050
Wire Wire Line
	7300 2050 7300 2100
Wire Wire Line
	8100 2000 8100 2050
NoConn ~ 3200 6350
Text HLabel 3500 1650 1    50   Output ~ 0
7M
Wire Wire Line
	3500 1650 3500 1750
Text Label 1900 3250 0    50   ~ 0
HCARRY1
Text Label 1900 5300 0    50   ~ 0
HCARRY2
Text HLabel 5400 2150 2    50   Output ~ 0
~HRESET
Wire Wire Line
	5400 2150 5300 2150
$Comp
L 74xx:74LS30 U12
U 1 1 60E96DFF
P 5000 2150
AR Path="/60E7C453/60E96DFF" Ref="U12"  Part="1" 
AR Path="/60F6B7E4/60E96DFF" Ref="U?"  Part="1" 
F 0 "U12" H 5000 2675 50  0000 C CNN
F 1 "74HC30" H 5000 2584 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 5000 2150 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74ls02" H 5000 2150 50  0001 C CNN
	1    5000 2150
	1    0    0    -1  
$EndComp
Wire Wire Line
	4700 2550 4600 2550
Wire Wire Line
	4600 2550 4600 2450
Wire Wire Line
	4700 2450 4600 2450
Connection ~ 4600 2450
$Comp
L power:+5V #PWR034
U 1 1 60EC0641
P 4600 1650
AR Path="/60E7C453/60EC0641" Ref="#PWR034"  Part="1" 
AR Path="/60F6B7E4/60EC0641" Ref="#PWR?"  Part="1" 
F 0 "#PWR034" H 4600 1500 50  0001 C CNN
F 1 "+5V" H 4542 1687 50  0000 R CNN
F 2 "" H 4600 1650 50  0001 C CNN
F 3 "" H 4600 1650 50  0001 C CNN
	1    4600 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	4600 1650 4600 2450
Wire Wire Line
	4700 2150 4200 2150
Wire Wire Line
	4700 2250 4300 2250
Wire Wire Line
	4700 2350 4400 2350
Text Label 3250 1850 0    50   ~ 0
PX0
Text Label 3250 1950 0    50   ~ 0
PX1
Text Label 3250 2050 0    50   ~ 0
PX2
Text Label 3250 3800 0    50   ~ 0
PX3
Text Label 3250 3900 0    50   ~ 0
PX4
Text Label 3250 4000 0    50   ~ 0
PX5
Text Label 3250 4100 0    50   ~ 0
PX6
Text Label 3250 5850 0    50   ~ 0
PX7
Text Label 3250 5950 0    50   ~ 0
PX8
Wire Wire Line
	4000 3900 3200 3900
Wire Wire Line
	4100 4000 3200 4000
Wire Wire Line
	3200 4100 4200 4100
Connection ~ 4200 4100
Wire Wire Line
	4300 2250 4300 5850
Wire Wire Line
	3200 5850 4300 5850
Connection ~ 4300 5850
Wire Wire Line
	3200 5950 4400 5950
Text HLabel 3600 1650 1    50   Output ~ 0
3.5M
Text HLabel 3700 1650 1    50   Output ~ 0
1.8M
Text HLabel 3800 1650 1    50   Output ~ 0
0.9M
Wire Wire Line
	3600 1650 3600 1850
Wire Wire Line
	3700 1650 3700 1950
Wire Wire Line
	3800 1650 3800 2050
Wire Wire Line
	3200 1850 3600 1850
Wire Wire Line
	3200 1950 3700 1950
Wire Wire Line
	3200 2050 3800 2050
Wire Wire Line
	3200 1750 3500 1750
Connection ~ 3600 1850
Connection ~ 3700 1950
Connection ~ 3800 2050
Wire Wire Line
	3600 1850 4700 1850
Wire Wire Line
	3700 1950 4700 1950
Wire Wire Line
	3800 2050 4700 2050
$Comp
L 74xx:74LS02 U16
U 5 1 61181E2C
P 10500 1500
AR Path="/60E7C453/61181E2C" Ref="U16"  Part="5" 
AR Path="/60F6B7E4/61181E2C" Ref="U?"  Part="5" 
AR Path="/61181E2C" Ref="U?"  Part="5" 
F 0 "U16" H 10730 1546 50  0000 L CNN
F 1 "74HC02" H 10730 1455 50  0000 L CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 10500 1500 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74ls02" H 10500 1500 50  0001 C CNN
	5    10500 1500
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC00 U?
U 5 1 611A51E6
P 9700 1500
AR Path="/611A51E6" Ref="U?"  Part="5" 
AR Path="/60E7C453/611A51E6" Ref="U15"  Part="5" 
F 0 "U15" H 9930 1546 50  0000 L CNN
F 1 "74HC00" H 9930 1455 50  0000 L CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 9700 1500 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74hc00" H 9700 1500 50  0001 C CNN
	5    9700 1500
	1    0    0    -1  
$EndComp
Wire Wire Line
	8100 950  8900 950 
Wire Wire Line
	9700 950  9700 1000
Connection ~ 8100 950 
Wire Wire Line
	9700 950  10500 950 
Wire Wire Line
	10500 950  10500 1000
Connection ~ 9700 950 
Wire Wire Line
	8100 2050 8900 2050
Wire Wire Line
	9700 2050 9700 2000
Connection ~ 8100 2050
Wire Wire Line
	9700 2050 10500 2050
Wire Wire Line
	10500 2050 10500 2000
Connection ~ 9700 2050
Wire Wire Line
	4300 5850 4300 6600
Wire Wire Line
	4000 6600 4000 3900
Text HLabel 3900 6600 3    50   Output ~ 0
H0
Text HLabel 4000 6600 3    50   Output ~ 0
H1
Text HLabel 4100 6600 3    50   Output ~ 0
H2
Text HLabel 4200 6600 3    50   Output ~ 0
H3
Text HLabel 4300 6600 3    50   Output ~ 0
H4
Wire Wire Line
	4200 4100 4200 6600
Wire Wire Line
	3900 3800 3900 6600
Connection ~ 3900 3800
Wire Wire Line
	3900 3100 3900 3800
Text Label 7500 5200 0    50   ~ 0
HBLANK_START
Text Label 5300 5100 0    50   ~ 0
0x104
Wire Wire Line
	6200 5850 6150 5850
Text Label 7500 5950 0    50   ~ 0
HBLANK_END
Wire Wire Line
	3800 5000 4700 5000
Wire Wire Line
	4700 5200 4400 5200
Connection ~ 8750 5850
Wire Wire Line
	8750 5850 8800 5850
Connection ~ 8750 5300
Wire Wire Line
	8750 5300 8800 5300
Text HLabel 8800 5300 2    50   Output ~ 0
~HBLANK
Wire Wire Line
	8750 5500 7950 5650
Wire Wire Line
	8750 5300 8750 5500
Wire Wire Line
	8650 5300 8750 5300
Wire Wire Line
	8750 5650 7950 5500
Wire Wire Line
	8750 5850 8750 5650
Wire Wire Line
	8650 5850 8750 5850
Wire Wire Line
	7950 5750 7950 5650
Wire Wire Line
	8050 5750 7950 5750
Wire Wire Line
	7950 5400 7950 5500
Wire Wire Line
	8050 5400 7950 5400
$Comp
L 74xx:74LS02 U16
U 2 1 60FA62E7
P 8350 5850
AR Path="/60E7C453/60FA62E7" Ref="U16"  Part="2" 
AR Path="/60F6B7E4/60FA62E7" Ref="U?"  Part="3" 
AR Path="/60FA62E7" Ref="U?"  Part="4" 
F 0 "U16" H 8350 5625 50  0000 C CNN
F 1 "74HC02" H 8350 5534 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 8350 5850 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74ls02" H 8350 5850 50  0001 C CNN
	2    8350 5850
	1    0    0    -1  
$EndComp
Text HLabel 8800 5850 2    50   Output ~ 0
HBLANK
Text HLabel 8800 5300 2    50   Output ~ 0
~HBLANK
$Comp
L 74xx:74LS02 U16
U 1 1 60F5D3B4
P 8350 5300
AR Path="/60E7C453/60F5D3B4" Ref="U16"  Part="1" 
AR Path="/60F6B7E4/60F5D3B4" Ref="U?"  Part="4" 
F 0 "U16" H 8350 5625 50  0000 C CNN
F 1 "74HC02" H 8350 5534 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 8350 5300 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74ls02" H 8350 5300 50  0001 C CNN
	1    8350 5300
	1    0    0    -1  
$EndComp
Connection ~ 4100 4000
Connection ~ 4100 4600
Wire Wire Line
	4200 3400 4200 4100
Wire Wire Line
	4200 3400 4200 2150
Wire Wire Line
	4400 2350 4400 3600
Wire Wire Line
	4100 4000 4100 4600
Wire Wire Line
	4100 4600 4100 6600
Connection ~ 4400 3600
Connection ~ 4200 3400
Wire Wire Line
	6300 4500 6300 4250
Wire Wire Line
	5900 4500 6300 4500
Wire Wire Line
	6400 3900 6100 3900
Wire Wire Line
	6400 3550 6400 3900
Wire Wire Line
	6500 3550 6400 3550
Wire Wire Line
	6400 3350 6500 3350
Wire Wire Line
	6400 3200 6400 3350
Wire Wire Line
	6100 3200 6400 3200
$Comp
L 74xx:74LS02 U2
U 3 1 60F5BB93
P 8350 3550
AR Path="/60E7C453/60F5BB93" Ref="U2"  Part="3" 
AR Path="/60F6B7E4/60F5BB93" Ref="U?"  Part="2" 
F 0 "U2" H 8350 3875 50  0000 C CNN
F 1 "74HC02" H 8350 3784 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 8350 3550 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74ls02" H 8350 3550 50  0001 C CNN
	3    8350 3550
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS08 U13
U 3 1 60F67137
P 6800 3450
AR Path="/60E7C453/60F67137" Ref="U13"  Part="3" 
AR Path="/60F6B7E4/60F67137" Ref="U?"  Part="4" 
F 0 "U13" H 6800 3775 50  0000 C CNN
F 1 "74HC08" H 6800 3684 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 6800 3450 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 6800 3450 50  0001 C CNN
	3    6800 3450
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS02 U2
U 4 1 60F7C317
P 8350 4150
AR Path="/60E7C453/60F7C317" Ref="U2"  Part="4" 
AR Path="/60F6B7E4/60F7C317" Ref="U?"  Part="1" 
F 0 "U2" H 8350 3925 50  0000 C CNN
F 1 "74HC02" H 8350 3834 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 8350 4150 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74ls02" H 8350 4150 50  0001 C CNN
	4    8350 4150
	1    0    0    -1  
$EndComp
Wire Wire Line
	7100 3450 8050 3450
Wire Wire Line
	8650 4150 8750 4150
Wire Wire Line
	7950 3750 7950 3650
Wire Wire Line
	7950 3650 8050 3650
Wire Wire Line
	7950 4050 8050 4050
Wire Wire Line
	7950 3950 7950 4050
Text HLabel 8800 3550 2    50   Output ~ 0
~HSYNC
Text Label 5950 4500 0    50   ~ 0
0x168
Wire Wire Line
	8650 3550 8750 3550
Wire Wire Line
	8750 3550 8750 3750
Connection ~ 8750 3550
Wire Wire Line
	8750 3550 8800 3550
Wire Wire Line
	8750 3950 8750 4150
Wire Wire Line
	7950 3750 8750 3950
Wire Wire Line
	8750 3750 7950 3950
Wire Wire Line
	5400 4000 5500 4000
Connection ~ 5400 4000
Wire Wire Line
	5400 3800 5400 4000
Wire Wire Line
	5500 3800 5400 3800
Wire Wire Line
	4100 4000 5400 4000
Wire Wire Line
	5300 4600 4100 4600
Text Label 6150 3200 0    50   ~ 0
0x148
Wire Wire Line
	3900 3100 5500 3100
Text Label 5200 4400 2    50   ~ 0
0x148
Text Label 5400 3500 0    50   ~ 0
0x140
$Comp
L 74xx:74LS08 U13
U 4 1 60F6CD14
P 5600 4500
AR Path="/60E7C453/60F6CD14" Ref="U13"  Part="4" 
AR Path="/60F6B7E4/60F6CD14" Ref="U?"  Part="3" 
F 0 "U13" H 5600 4825 50  0000 C CNN
F 1 "74HC08" H 5600 4734 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 5600 4500 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74hc00" H 5600 4500 50  0001 C CNN
	4    5600 4500
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS08 U13
U 2 1 60F64BCA
P 5000 3500
AR Path="/60E7C453/60F64BCA" Ref="U13"  Part="2" 
AR Path="/60F6B7E4/60F64BCA" Ref="U?"  Part="2" 
F 0 "U13" H 5000 3825 50  0000 C CNN
F 1 "74HC08" H 5000 3734 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 5000 3500 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74hc00" H 5000 3500 50  0001 C CNN
	2    5000 3500
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS08 U13
U 1 1 60F62F92
P 5800 3200
AR Path="/60E7C453/60F62F92" Ref="U13"  Part="1" 
AR Path="/60F6B7E4/60F62F92" Ref="U?"  Part="1" 
F 0 "U13" H 5800 3525 50  0000 C CNN
F 1 "74HC08" H 5800 3434 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 5800 3200 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74hc00" H 5800 3200 50  0001 C CNN
	1    5800 3200
	1    0    0    -1  
$EndComp
Wire Wire Line
	4700 3600 4400 3600
Wire Wire Line
	4700 3400 4200 3400
Wire Wire Line
	5300 3500 5400 3500
Wire Wire Line
	5400 3500 5400 3300
Wire Wire Line
	5400 3300 5500 3300
Text Label 7150 3450 0    50   ~ 0
HSYNC_START
Wire Wire Line
	5200 4400 5300 4400
Text Label 7150 4250 0    50   ~ 0
HSYNC_END
Wire Wire Line
	4400 3600 4400 5200
Wire Wire Line
	3800 2050 3800 5000
Wire Wire Line
	4700 5650 4600 5650
Wire Wire Line
	4600 5650 4600 5850
Wire Wire Line
	4600 5850 4700 5850
Wire Wire Line
	4600 5650 4400 5650
Connection ~ 4600 5650
Connection ~ 4400 5650
Wire Wire Line
	4400 5650 4400 5950
Wire Wire Line
	5300 5750 5400 5750
Wire Wire Line
	5400 5750 5400 5950
Wire Wire Line
	5400 5950 5500 5950
Wire Wire Line
	6100 6050 6150 6050
Wire Wire Line
	3800 6150 5500 6150
Wire Wire Line
	6150 5850 6150 6050
Connection ~ 6150 6050
Wire Wire Line
	6150 6050 6200 6050
Wire Wire Line
	6300 4250 8050 4250
Text Notes 6400 4500 0    50   ~ 0
this has a dodgy pulse\n- but I think it's OK
$Comp
L 74xx:74LS08 U14
U 5 1 616E5A49
P 8900 1500
AR Path="/60E7C453/616E5A49" Ref="U14"  Part="5" 
AR Path="/60F6B7E4/616E5A49" Ref="U?"  Part="5" 
F 0 "U14" H 9130 1546 50  0000 L CNN
F 1 "74HC08" H 9130 1455 50  0000 L CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 8900 1500 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 8900 1500 50  0001 C CNN
	5    8900 1500
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS08 U14
U 1 1 616EAAD7
P 5000 5100
AR Path="/60E7C453/616EAAD7" Ref="U14"  Part="1" 
AR Path="/60F6B7E4/616EAAD7" Ref="U?"  Part="5" 
F 0 "U14" H 5000 5425 50  0000 C CNN
F 1 "74HC08" H 5000 5334 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 5000 5100 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 5000 5100 50  0001 C CNN
	1    5000 5100
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS08 U14
U 2 1 616ED986
P 5850 5200
AR Path="/60E7C453/616ED986" Ref="U14"  Part="2" 
AR Path="/60F6B7E4/616ED986" Ref="U?"  Part="5" 
F 0 "U14" H 5850 5525 50  0000 C CNN
F 1 "74HC08" H 5850 5434 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 5850 5200 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 5850 5200 50  0001 C CNN
	2    5850 5200
	1    0    0    -1  
$EndComp
Wire Wire Line
	6150 5200 8050 5200
Connection ~ 3800 5000
Connection ~ 4400 5200
Wire Wire Line
	3800 5000 3800 6150
Wire Wire Line
	4400 5200 4400 5650
Wire Wire Line
	5300 5100 5550 5100
Text Label 3250 1750 0    50   ~ 0
7M
Text Label 5550 5300 2    50   ~ 0
7M
$Comp
L 74xx:74LS08 U14
U 4 1 616FFC10
P 10450 5800
AR Path="/60E7C453/616FFC10" Ref="U14"  Part="4" 
AR Path="/60F6B7E4/616FFC10" Ref="U?"  Part="5" 
F 0 "U14" H 10450 6125 50  0000 C CNN
F 1 "74HC08" H 10450 6034 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 10450 5800 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 10450 5800 50  0001 C CNN
	4    10450 5800
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS08 U14
U 3 1 617052AD
P 7200 5950
AR Path="/60E7C453/617052AD" Ref="U14"  Part="3" 
AR Path="/60F6B7E4/617052AD" Ref="U?"  Part="5" 
F 0 "U14" H 7200 6275 50  0000 C CNN
F 1 "74HC08" H 7200 6184 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 7200 5950 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 7200 5950 50  0001 C CNN
	3    7200 5950
	1    0    0    -1  
$EndComp
Wire Wire Line
	7500 5950 8050 5950
Wire Wire Line
	6900 5850 6850 5850
Wire Wire Line
	6850 5850 6850 5950
Wire Wire Line
	6850 6050 6900 6050
Wire Wire Line
	6800 5950 6850 5950
Connection ~ 6850 5950
Wire Wire Line
	6850 5950 6850 6050
Wire Wire Line
	8900 1000 8900 950 
Connection ~ 8900 950 
Wire Wire Line
	8900 950  9700 950 
Wire Wire Line
	8900 2000 8900 2050
Connection ~ 8900 2050
Wire Wire Line
	8900 2050 9700 2050
Wire Wire Line
	10150 5700 10100 5700
Wire Wire Line
	9800 5700 9800 5900
Wire Wire Line
	9800 5900 9900 5900
Connection ~ 9800 5900
Wire Wire Line
	9800 5900 9800 6000
NoConn ~ 10750 5800
$Comp
L power:GND #PWR037
U 1 1 61937888
P 9800 6000
AR Path="/60E7C453/61937888" Ref="#PWR037"  Part="1" 
AR Path="/60F6B7E4/61937888" Ref="#PWR?"  Part="1" 
F 0 "#PWR037" H 9800 5750 50  0001 C CNN
F 1 "GND" H 9805 5827 50  0000 C CNN
F 2 "" H 9800 6000 50  0001 C CNN
F 3 "" H 9800 6000 50  0001 C CNN
	1    9800 6000
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R15
U 1 1 6238E47E
P 10000 5700
F 0 "R15" V 9804 5700 50  0000 C CNN
F 1 "1K" V 9895 5700 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 10000 5700 50  0001 C CNN
F 3 "~" H 10000 5700 50  0001 C CNN
	1    10000 5700
	0    1    1    0   
$EndComp
Wire Wire Line
	9900 5700 9800 5700
$Comp
L Device:R_Small R16
U 1 1 623A65BE
P 10000 5900
F 0 "R16" V 10104 5900 50  0000 C CNN
F 1 "1K" V 10195 5900 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric" H 10000 5900 50  0001 C CNN
F 3 "~" H 10000 5900 50  0001 C CNN
	1    10000 5900
	0    1    1    0   
$EndComp
Wire Wire Line
	10100 5900 10150 5900
$Comp
L 74xx:74HC00 U?
U 1 1 610B7464
P 5800 3900
AR Path="/610B7464" Ref="U?"  Part="1" 
AR Path="/60E7C453/610B7464" Ref="U15"  Part="1" 
F 0 "U15" H 5800 4225 50  0000 C CNN
F 1 "74HC00" H 5800 4134 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 5800 3900 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74hc00" H 5800 3900 50  0001 C CNN
	1    5800 3900
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC00 U?
U 3 1 610D1BD1
P 6500 5950
AR Path="/610D1BD1" Ref="U?"  Part="3" 
AR Path="/60E7C453/610D1BD1" Ref="U3"  Part="3" 
F 0 "U3" H 6500 6275 50  0000 C CNN
F 1 "74HC00" H 6500 6184 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 6500 5950 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74hc00" H 6500 5950 50  0001 C CNN
	3    6500 5950
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC00 U?
U 4 1 610D1BD7
P 5800 6050
AR Path="/610D1BD7" Ref="U?"  Part="4" 
AR Path="/60E7C453/610D1BD7" Ref="U3"  Part="4" 
F 0 "U3" H 5800 6375 50  0000 C CNN
F 1 "74HC00" H 5800 6284 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 5800 6050 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74hc00" H 5800 6050 50  0001 C CNN
	4    5800 6050
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC00 U?
U 1 1 610D1BCB
P 5000 5750
AR Path="/610D1BCB" Ref="U?"  Part="2" 
AR Path="/60E7C453/610D1BCB" Ref="U3"  Part="1" 
F 0 "U3" H 5000 6075 50  0000 C CNN
F 1 "74HC00" H 5000 5984 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 5000 5750 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74hc00" H 5000 5750 50  0001 C CNN
	1    5000 5750
	1    0    0    -1  
$EndComp
$EndSCHEMATC
