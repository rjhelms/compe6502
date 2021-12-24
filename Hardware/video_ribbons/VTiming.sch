EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 5
Title "Vertical Timing"
Date "2021-07-29"
Rev "1"
Comp "rjh"
Comment1 "CC-BY-SA 4.0"
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L 74xx:74LS161 U?
U 1 1 60F79D8B
P 2800 2000
AR Path="/60F79D8B" Ref="U?"  Part="1" 
AR Path="/60E7C453/60F79D8B" Ref="U?"  Part="1" 
AR Path="/60F6B7E4/60F79D8B" Ref="U?"  Part="1" 
AR Path="/60F76465/60F79D8B" Ref="U17"  Part="1" 
F 0 "U17" H 2550 2650 50  0000 C CNN
F 1 "74HC161" H 3050 2650 50  0000 C CNN
F 2 "Package_SO:SOIC-16_3.9x9.9mm_P1.27mm" H 2800 2000 50  0001 C CNN
F 3 "" H 2800 2000 50  0001 C CNN
	1    2800 2000
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS161 U?
U 1 1 60F79D91
P 2800 4050
AR Path="/60F79D91" Ref="U?"  Part="1" 
AR Path="/60E7C453/60F79D91" Ref="U?"  Part="1" 
AR Path="/60F6B7E4/60F79D91" Ref="U?"  Part="1" 
AR Path="/60F76465/60F79D91" Ref="U18"  Part="1" 
F 0 "U18" H 2550 4700 50  0000 C CNN
F 1 "74HC161" H 3050 4700 50  0000 C CNN
F 2 "Package_SO:SOIC-16_3.9x9.9mm_P1.27mm" H 2800 4050 50  0001 C CNN
F 3 "" H 2800 4050 50  0001 C CNN
	1    2800 4050
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS161 U?
U 1 1 60F79D97
P 2800 6100
AR Path="/60F79D97" Ref="U?"  Part="1" 
AR Path="/60E7C453/60F79D97" Ref="U?"  Part="1" 
AR Path="/60F6B7E4/60F79D97" Ref="U?"  Part="1" 
AR Path="/60F76465/60F79D97" Ref="U19"  Part="1" 
F 0 "U19" H 2550 6750 50  0000 C CNN
F 1 "74HC161" H 3050 6750 50  0000 C CNN
F 2 "Package_SO:SOIC-16_3.9x9.9mm_P1.27mm" H 2800 6100 50  0001 C CNN
F 3 "" H 2800 6100 50  0001 C CNN
	1    2800 6100
	1    0    0    -1  
$EndComp
Wire Wire Line
	2300 2300 1500 2300
Wire Wire Line
	1500 2300 1500 4350
Wire Wire Line
	1500 4350 2300 4350
Wire Wire Line
	1500 4350 1500 6400
Wire Wire Line
	1500 6400 2300 6400
Connection ~ 1500 4350
Text HLabel 1300 2300 0    50   Input ~ 0
VCLOCK
Wire Wire Line
	1300 2300 1500 2300
Connection ~ 1500 2300
Wire Wire Line
	2300 1500 1750 1500
Wire Wire Line
	1750 1500 1750 1600
Wire Wire Line
	1750 5900 2300 5900
Wire Wire Line
	1750 1600 2300 1600
Connection ~ 1750 1600
Wire Wire Line
	1750 1600 1750 1700
Wire Wire Line
	1750 1700 2300 1700
Connection ~ 1750 1700
Wire Wire Line
	1750 1700 1750 1800
Wire Wire Line
	1750 1800 2300 1800
Connection ~ 1750 1800
Wire Wire Line
	1750 1800 1750 3550
Wire Wire Line
	1750 3550 2300 3550
Connection ~ 1750 3550
Wire Wire Line
	1750 3550 1750 3650
Wire Wire Line
	1750 3650 2300 3650
Connection ~ 1750 3650
Wire Wire Line
	1750 3650 1750 3750
Wire Wire Line
	1750 3750 2300 3750
Connection ~ 1750 3750
Wire Wire Line
	1750 3750 1750 3850
Wire Wire Line
	1750 3850 2300 3850
Connection ~ 1750 3850
Wire Wire Line
	1750 3850 1750 5600
Wire Wire Line
	1750 5600 2300 5600
Connection ~ 1750 5600
Wire Wire Line
	1750 5600 1750 5700
Wire Wire Line
	1750 5700 2300 5700
Connection ~ 1750 5700
Wire Wire Line
	1750 5700 1750 5800
Wire Wire Line
	1750 5800 2300 5800
Connection ~ 1750 5800
Wire Wire Line
	1750 5800 1750 5900
$Comp
L power:GND #PWR?
U 1 1 60F79DC7
P 1750 6000
AR Path="/60E7C453/60F79DC7" Ref="#PWR?"  Part="1" 
AR Path="/60F6B7E4/60F79DC7" Ref="#PWR?"  Part="1" 
AR Path="/60F76465/60F79DC7" Ref="#PWR038"  Part="1" 
F 0 "#PWR038" H 1750 5750 50  0001 C CNN
F 1 "GND" H 1755 5827 50  0000 C CNN
F 2 "" H 1750 6000 50  0001 C CNN
F 3 "" H 1750 6000 50  0001 C CNN
	1    1750 6000
	1    0    0    -1  
$EndComp
Wire Wire Line
	1750 5900 1750 6000
Connection ~ 1750 5900
Wire Wire Line
	3300 2000 3400 2000
Wire Wire Line
	3400 2000 3400 3000
Wire Wire Line
	3400 3000 1900 3000
Wire Wire Line
	1900 3000 1900 4250
Wire Wire Line
	1900 4250 2300 4250
Wire Wire Line
	3300 4050 3400 4050
Wire Wire Line
	3400 4050 3400 5050
Wire Wire Line
	3400 5050 1900 5050
Wire Wire Line
	1900 5050 1900 6300
Wire Wire Line
	1900 6300 2300 6300
Wire Wire Line
	2300 2200 2200 2200
Wire Wire Line
	2200 2200 2200 2100
Wire Wire Line
	2200 2000 2300 2000
Wire Wire Line
	2300 2100 2200 2100
Connection ~ 2200 2100
Wire Wire Line
	2200 2100 2200 2000
Wire Wire Line
	2300 4150 2200 4150
Wire Wire Line
	2200 4150 2200 4050
Wire Wire Line
	2200 4050 2300 4050
Wire Wire Line
	2300 6200 2200 6200
Wire Wire Line
	2200 6200 2200 6100
Wire Wire Line
	2200 6100 2300 6100
$Comp
L power:+5V #PWR?
U 1 1 60F79DE5
P 2200 2000
AR Path="/60E7C453/60F79DE5" Ref="#PWR?"  Part="1" 
AR Path="/60F6B7E4/60F79DE5" Ref="#PWR?"  Part="1" 
AR Path="/60F76465/60F79DE5" Ref="#PWR039"  Part="1" 
F 0 "#PWR039" H 2200 1850 50  0001 C CNN
F 1 "+5V" H 2142 2037 50  0000 R CNN
F 2 "" H 2200 2000 50  0001 C CNN
F 3 "" H 2200 2000 50  0001 C CNN
	1    2200 2000
	1    0    0    -1  
$EndComp
Connection ~ 2200 2000
$Comp
L power:+5V #PWR?
U 1 1 60F79DEC
P 2200 4050
AR Path="/60E7C453/60F79DEC" Ref="#PWR?"  Part="1" 
AR Path="/60F6B7E4/60F79DEC" Ref="#PWR?"  Part="1" 
AR Path="/60F76465/60F79DEC" Ref="#PWR040"  Part="1" 
F 0 "#PWR040" H 2200 3900 50  0001 C CNN
F 1 "+5V" H 2142 4087 50  0000 R CNN
F 2 "" H 2200 4050 50  0001 C CNN
F 3 "" H 2200 4050 50  0001 C CNN
	1    2200 4050
	1    0    0    -1  
$EndComp
Connection ~ 2200 4050
$Comp
L power:+5V #PWR?
U 1 1 60F79DF3
P 2200 6100
AR Path="/60E7C453/60F79DF3" Ref="#PWR?"  Part="1" 
AR Path="/60F6B7E4/60F79DF3" Ref="#PWR?"  Part="1" 
AR Path="/60F76465/60F79DF3" Ref="#PWR041"  Part="1" 
F 0 "#PWR041" H 2200 5950 50  0001 C CNN
F 1 "+5V" H 2142 6137 50  0000 R CNN
F 2 "" H 2200 6100 50  0001 C CNN
F 3 "" H 2200 6100 50  0001 C CNN
	1    2200 6100
	1    0    0    -1  
$EndComp
Connection ~ 2200 6100
$Comp
L power:+5V #PWR?
U 1 1 60F79DFA
P 2800 1150
AR Path="/60E7C453/60F79DFA" Ref="#PWR?"  Part="1" 
AR Path="/60F6B7E4/60F79DFA" Ref="#PWR?"  Part="1" 
AR Path="/60F76465/60F79DFA" Ref="#PWR042"  Part="1" 
F 0 "#PWR042" H 2800 1000 50  0001 C CNN
F 1 "+5V" H 2742 1187 50  0000 R CNN
F 2 "" H 2800 1150 50  0001 C CNN
F 3 "" H 2800 1150 50  0001 C CNN
	1    2800 1150
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 60F79E00
P 2800 3200
AR Path="/60E7C453/60F79E00" Ref="#PWR?"  Part="1" 
AR Path="/60F6B7E4/60F79E00" Ref="#PWR?"  Part="1" 
AR Path="/60F76465/60F79E00" Ref="#PWR044"  Part="1" 
F 0 "#PWR044" H 2800 3050 50  0001 C CNN
F 1 "+5V" H 2742 3237 50  0000 R CNN
F 2 "" H 2800 3200 50  0001 C CNN
F 3 "" H 2800 3200 50  0001 C CNN
	1    2800 3200
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 60F79E06
P 2800 5250
AR Path="/60E7C453/60F79E06" Ref="#PWR?"  Part="1" 
AR Path="/60F6B7E4/60F79E06" Ref="#PWR?"  Part="1" 
AR Path="/60F76465/60F79E06" Ref="#PWR046"  Part="1" 
F 0 "#PWR046" H 2800 5100 50  0001 C CNN
F 1 "+5V" H 2742 5287 50  0000 R CNN
F 2 "" H 2800 5250 50  0001 C CNN
F 3 "" H 2800 5250 50  0001 C CNN
	1    2800 5250
	1    0    0    -1  
$EndComp
Wire Wire Line
	2800 1150 2800 1200
Wire Wire Line
	2800 3200 2800 3250
Wire Wire Line
	2800 5250 2800 5300
$Comp
L power:GND #PWR?
U 1 1 60F79E0F
P 2800 2850
AR Path="/60E7C453/60F79E0F" Ref="#PWR?"  Part="1" 
AR Path="/60F6B7E4/60F79E0F" Ref="#PWR?"  Part="1" 
AR Path="/60F76465/60F79E0F" Ref="#PWR043"  Part="1" 
F 0 "#PWR043" H 2800 2600 50  0001 C CNN
F 1 "GND" H 2722 2813 50  0000 R CNN
F 2 "" H 2800 2850 50  0001 C CNN
F 3 "" H 2800 2850 50  0001 C CNN
	1    2800 2850
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 60F79E15
P 2800 4900
AR Path="/60E7C453/60F79E15" Ref="#PWR?"  Part="1" 
AR Path="/60F6B7E4/60F79E15" Ref="#PWR?"  Part="1" 
AR Path="/60F76465/60F79E15" Ref="#PWR045"  Part="1" 
F 0 "#PWR045" H 2800 4650 50  0001 C CNN
F 1 "GND" H 2722 4863 50  0000 R CNN
F 2 "" H 2800 4900 50  0001 C CNN
F 3 "" H 2800 4900 50  0001 C CNN
	1    2800 4900
	1    0    0    -1  
$EndComp
Wire Wire Line
	2800 4850 2800 4900
Wire Wire Line
	2800 2800 2800 2850
Text Label 2300 2500 2    50   ~ 0
~VRESET
Text Label 2300 4550 2    50   ~ 0
~VRESET
Text Label 2300 6600 2    50   ~ 0
~VRESET
NoConn ~ 3300 5700
NoConn ~ 3300 5800
NoConn ~ 3300 5900
Text Label 3350 5600 0    50   ~ 0
PY8
Text Label 3350 3850 0    50   ~ 0
PY7
Text Label 3350 3750 0    50   ~ 0
PY6
Text Label 3350 3650 0    50   ~ 0
PY5
Text Label 3350 3550 0    50   ~ 0
PY4
Text Label 3350 1800 0    50   ~ 0
PY3
Text Label 3350 1700 0    50   ~ 0
PY2
Text Label 3350 1600 0    50   ~ 0
PY1
Text Label 3350 1500 0    50   ~ 0
PY0
NoConn ~ 3300 6100
Text Label 2000 3000 0    50   ~ 0
VCARRY1
Text Label 2000 5050 0    50   ~ 0
VCARRY2
Wire Wire Line
	3300 1600 3700 1600
Wire Wire Line
	3300 1800 3900 1800
Wire Wire Line
	3300 1700 3800 1700
Wire Wire Line
	3300 3550 4000 3550
Wire Wire Line
	3300 3750 4200 3750
Wire Wire Line
	3300 1500 3600 1500
Connection ~ 4200 3750
Wire Wire Line
	3300 5600 4400 5600
Connection ~ 4300 3850
$Comp
L 74xx:74LS08 U22
U 5 1 60FEFA97
P 9700 1450
F 0 "U22" H 9930 1496 50  0000 L CNN
F 1 "74HC08" H 9930 1405 50  0000 L CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 9700 1450 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 9700 1450 50  0001 C CNN
	5    9700 1450
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC00 U21
U 3 1 60FFDBCA
P 5950 1700
F 0 "U21" H 5950 2025 50  0000 C CNN
F 1 "74HC00" H 5950 1934 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 5950 1700 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74hc00" H 5950 1700 50  0001 C CNN
	3    5950 1700
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC00 U21
U 5 1 61000292
P 8900 1450
F 0 "U21" H 9130 1496 50  0000 L CNN
F 1 "74HC00" H 9130 1405 50  0000 L CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 8900 1450 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74hc00" H 8900 1450 50  0001 C CNN
	5    8900 1450
	1    0    0    -1  
$EndComp
Connection ~ 4100 4650
Connection ~ 3600 5850
Connection ~ 3900 4250
Connection ~ 3800 4050
Wire Wire Line
	4300 2850 4300 3850
Wire Wire Line
	4200 2650 4200 3750
Wire Wire Line
	4100 3650 4100 4650
Wire Wire Line
	3300 3850 4300 3850
Wire Wire Line
	3900 1800 3900 4250
Wire Wire Line
	3300 3650 4100 3650
Wire Wire Line
	3600 1500 3600 5850
Connection ~ 4600 4650
Wire Wire Line
	4600 4650 4100 4650
Wire Wire Line
	6300 6050 6350 6050
Text Label 6350 6050 0    50   ~ 0
~0x003
Wire Wire Line
	5600 5950 5700 5950
Connection ~ 5600 5950
Wire Wire Line
	5600 6150 5700 6150
Wire Wire Line
	5600 5950 5600 6150
Wire Wire Line
	5300 5950 5600 5950
Text Label 5350 4750 0    50   ~ 0
~0x020
Wire Wire Line
	4600 4850 4700 4850
Wire Wire Line
	4600 4650 4600 4850
Wire Wire Line
	4700 4650 4600 4650
Text Label 5350 4150 0    50   ~ 0
0x00C
Wire Wire Line
	4700 4250 3900 4250
Wire Wire Line
	4700 4050 3800 4050
Text Label 5900 3550 0    50   ~ 0
VRESET
Wire Wire Line
	5700 3550 6200 3550
Wire Wire Line
	5000 3450 5100 3450
Connection ~ 5000 3450
Wire Wire Line
	5000 3650 5100 3650
Wire Wire Line
	5000 3450 5000 3650
Wire Wire Line
	4900 3450 5000 3450
Text Label 4900 3450 2    50   ~ 0
~VRESET
Wire Wire Line
	5300 2750 6250 2750
Wire Wire Line
	6900 3050 6150 3250
Wire Wire Line
	6150 3050 6900 3250
Wire Wire Line
	6900 3250 6900 3450
Wire Wire Line
	6900 2850 6950 2850
Connection ~ 6900 2850
Wire Wire Line
	6900 2850 6900 3050
Wire Wire Line
	6850 2850 6900 2850
Text HLabel 6950 2850 2    50   Output ~ 0
~VBLANK
Wire Wire Line
	6150 3250 6150 3350
Wire Wire Line
	6150 3350 6200 3350
Wire Wire Line
	6150 2950 6250 2950
Wire Wire Line
	6150 3050 6150 2950
Wire Wire Line
	6800 3450 6900 3450
$Comp
L 74xx:74LS02 U?
U 1 1 61038796
P 6550 2850
AR Path="/60E7C453/61038796" Ref="U?"  Part="1" 
AR Path="/60F6B7E4/61038796" Ref="U?"  Part="1" 
AR Path="/60F76465/61038796" Ref="U23"  Part="1" 
F 0 "U23" H 6550 3175 50  0000 C CNN
F 1 "74HC02" H 6550 3084 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 6550 2850 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74ls02" H 6550 2850 50  0001 C CNN
	1    6550 2850
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS02 U?
U 2 1 61038790
P 6500 3450
AR Path="/60E7C453/61038790" Ref="U?"  Part="2" 
AR Path="/60F6B7E4/61038790" Ref="U?"  Part="2" 
AR Path="/60F76465/61038790" Ref="U23"  Part="2" 
F 0 "U23" H 6500 3225 50  0000 C CNN
F 1 "74HC02" H 6500 3134 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 6500 3450 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74ls02" H 6500 3450 50  0001 C CNN
	2    6500 3450
	1    0    0    -1  
$EndComp
Text Label 6000 2750 0    50   ~ 0
0x0C0
Wire Wire Line
	4700 2850 4300 2850
Wire Wire Line
	4700 2650 4200 2650
$Comp
L 74xx:74HC00 U21
U 4 1 60FFEF91
P 6000 6050
F 0 "U21" H 6000 6375 50  0000 C CNN
F 1 "74HC00" H 6000 6284 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 6000 6050 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74hc00" H 6000 6050 50  0001 C CNN
	4    6000 6050
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC00 U21
U 2 1 60FFCC44
P 5000 4750
F 0 "U21" H 5000 5075 50  0000 C CNN
F 1 "74HC00" H 5000 4984 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 5000 4750 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74hc00" H 5000 4750 50  0001 C CNN
	2    5000 4750
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74HC00 U21
U 1 1 60FFB5A9
P 5400 3550
F 0 "U21" H 5400 3875 50  0000 C CNN
F 1 "74HC00" H 5400 3784 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 5400 3550 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74hc00" H 5400 3550 50  0001 C CNN
	1    5400 3550
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS08 U20
U 3 1 60FED7F2
P 5000 4150
F 0 "U20" H 5000 3833 50  0000 C CNN
F 1 "74HC08" H 5000 3924 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 5000 4150 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 5000 4150 50  0001 C CNN
	3    5000 4150
	1    0    0    1   
$EndComp
$Comp
L 74xx:74LS08 U20
U 1 1 60FEB692
P 5000 2750
F 0 "U20" H 5000 3075 50  0000 C CNN
F 1 "74HC08" H 5000 2984 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 5000 2750 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 5000 2750 50  0001 C CNN
	1    5000 2750
	1    0    0    -1  
$EndComp
Text Label 5350 5950 0    50   ~ 0
0x003
Wire Wire Line
	3700 6050 4700 6050
Wire Wire Line
	3600 5850 4700 5850
Text HLabel 6350 1700 2    50   Output ~ 0
~VRESET
Wire Wire Line
	6250 1700 6350 1700
Text Label 5350 1600 0    50   ~ 0
0x006
Wire Wire Line
	5300 1600 5650 1600
Wire Wire Line
	4700 1700 3800 1700
Wire Wire Line
	4700 1500 3700 1500
$Comp
L 74xx:74LS08 U20
U 4 1 61125AF8
P 5000 5950
F 0 "U20" H 5000 6275 50  0000 C CNN
F 1 "74HC08" H 5000 6184 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 5000 5950 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 5000 5950 50  0001 C CNN
	4    5000 5950
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS08 U20
U 5 1 61127127
P 8100 1450
F 0 "U20" H 8330 1496 50  0000 L CNN
F 1 "74HC08" H 8330 1405 50  0000 L CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 8100 1450 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 8100 1450 50  0001 C CNN
	5    8100 1450
	1    0    0    -1  
$EndComp
Text Label 5350 2750 0    50   ~ 0
VBLANK_START
$Comp
L power:GND #PWR?
U 1 1 611FC0ED
P 2800 6950
AR Path="/60E7C453/611FC0ED" Ref="#PWR?"  Part="1" 
AR Path="/60F6B7E4/611FC0ED" Ref="#PWR?"  Part="1" 
AR Path="/60F76465/611FC0ED" Ref="#PWR047"  Part="1" 
F 0 "#PWR047" H 2800 6700 50  0001 C CNN
F 1 "GND" H 2722 6913 50  0000 R CNN
F 2 "" H 2800 6950 50  0001 C CNN
F 3 "" H 2800 6950 50  0001 C CNN
	1    2800 6950
	1    0    0    -1  
$EndComp
Wire Wire Line
	2800 6900 2800 6950
Wire Wire Line
	8100 950  8100 900 
Wire Wire Line
	8100 900  8900 900 
Wire Wire Line
	9700 900  9700 950 
Wire Wire Line
	8900 950  8900 900 
Connection ~ 8900 900 
Wire Wire Line
	8900 900  9700 900 
Wire Wire Line
	8100 1950 8100 2000
Wire Wire Line
	8100 2000 8900 2000
Wire Wire Line
	9700 2000 9700 1950
Wire Wire Line
	8900 1950 8900 2000
Connection ~ 8900 2000
Wire Wire Line
	8900 2000 9700 2000
Text HLabel 3600 6150 3    50   Output ~ 0
V0
Text HLabel 3700 6150 3    50   Output ~ 0
V1
Text HLabel 3800 6150 3    50   Output ~ 0
V2
Text HLabel 3900 6150 3    50   Output ~ 0
V3
Text HLabel 4000 6150 3    50   Output ~ 0
V4
Text HLabel 4100 6150 3    50   Output ~ 0
V5
Text HLabel 4200 6150 3    50   Output ~ 0
V6
Text HLabel 4300 6150 3    50   Output ~ 0
V7
Wire Wire Line
	3600 5850 3600 6150
Wire Wire Line
	3700 6050 3700 6150
Connection ~ 3700 6050
Wire Wire Line
	3800 4050 3800 6150
Wire Wire Line
	4000 3550 4000 4950
Wire Wire Line
	4100 4650 4100 6150
Wire Wire Line
	4200 3750 4200 6150
Wire Wire Line
	4300 3850 4300 6150
$Comp
L power:+5V #PWR?
U 1 1 61321094
P 8100 850
AR Path="/60E7C453/61321094" Ref="#PWR?"  Part="1" 
AR Path="/60F6B7E4/61321094" Ref="#PWR?"  Part="1" 
AR Path="/60F76465/61321094" Ref="#PWR048"  Part="1" 
F 0 "#PWR048" H 8100 700 50  0001 C CNN
F 1 "+5V" H 8042 887 50  0000 R CNN
F 2 "" H 8100 850 50  0001 C CNN
F 3 "" H 8100 850 50  0001 C CNN
	1    8100 850 
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 61321918
P 8100 2050
AR Path="/60E7C453/61321918" Ref="#PWR?"  Part="1" 
AR Path="/60F6B7E4/61321918" Ref="#PWR?"  Part="1" 
AR Path="/60F76465/61321918" Ref="#PWR049"  Part="1" 
F 0 "#PWR049" H 8100 1800 50  0001 C CNN
F 1 "GND" H 8022 2013 50  0000 R CNN
F 2 "" H 8100 2050 50  0001 C CNN
F 3 "" H 8100 2050 50  0001 C CNN
	1    8100 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	8100 2000 8100 2050
Connection ~ 8100 2000
Wire Wire Line
	8100 850  8100 900 
Connection ~ 8100 900 
$Comp
L 74xx:74LS08 U?
U 1 1 610E4FD8
P 5000 1600
AR Path="/60E7C453/610E4FD8" Ref="U?"  Part="1" 
AR Path="/60F6B7E4/610E4FD8" Ref="U?"  Part="1" 
AR Path="/60F76465/610E4FD8" Ref="U5"  Part="1" 
F 0 "U5" H 5000 1283 50  0000 C CNN
F 1 "74HC08" H 5000 1374 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 5000 1600 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 5000 1600 50  0001 C CNN
	1    5000 1600
	1    0    0    1   
$EndComp
$Comp
L 74xx:74LS08 U?
U 2 1 61EFDA42
P 5000 2150
AR Path="/60E7C453/61EFDA42" Ref="U?"  Part="2" 
AR Path="/61EFDA42" Ref="U?"  Part="2" 
AR Path="/60F76465/61EFDA42" Ref="U5"  Part="2" 
F 0 "U5" H 5000 2475 50  0000 C CNN
F 1 "74HC08" H 5000 2384 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 5000 2150 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 5000 2150 50  0001 C CNN
	2    5000 2150
	1    0    0    -1  
$EndComp
Connection ~ 3800 1700
Wire Wire Line
	3800 1700 3800 4050
Wire Wire Line
	3700 1600 3700 6050
Wire Wire Line
	3700 1600 3700 1500
Connection ~ 3700 1600
Wire Wire Line
	4400 2050 4700 2050
Wire Wire Line
	4400 2050 4400 2250
Wire Wire Line
	4700 2250 4400 2250
Connection ~ 4400 2250
Wire Wire Line
	4400 2250 4400 5600
Wire Wire Line
	5650 1800 5550 1800
Wire Wire Line
	5550 2150 5300 2150
Wire Wire Line
	5550 1800 5550 2150
Wire Wire Line
	9000 5350 9550 5350
Wire Wire Line
	9000 4550 9600 4550
Text Label 9050 5350 0    50   ~ 0
VSYNC_END
Text Label 9050 4550 0    50   ~ 0
VSYNC_START
Wire Wire Line
	8050 4450 8400 4450
Wire Wire Line
	8350 5450 8400 5450
Wire Wire Line
	8350 5250 8400 5250
Wire Wire Line
	8350 4650 8400 4650
Text Label 8350 5450 2    50   ~ 0
0x003
Text Label 8350 4650 2    50   ~ 0
~0x003
Text Label 8350 5250 2    50   ~ 0
0x0DC
$Comp
L 74xx:74LS02 U?
U 4 1 61164718
P 9850 5250
AR Path="/60E7C453/61164718" Ref="U?"  Part="2" 
AR Path="/60F6B7E4/61164718" Ref="U?"  Part="2" 
AR Path="/60F76465/61164718" Ref="U16"  Part="4" 
F 0 "U16" H 9850 5025 50  0000 C CNN
F 1 "74HC02" H 9850 4934 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 9850 5250 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74ls02" H 9850 5250 50  0001 C CNN
	4    9850 5250
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS02 U?
U 3 1 6116470E
P 9900 4650
AR Path="/60E7C453/6116470E" Ref="U?"  Part="1" 
AR Path="/60F6B7E4/6116470E" Ref="U?"  Part="1" 
AR Path="/60F76465/6116470E" Ref="U16"  Part="3" 
F 0 "U16" H 9900 4975 50  0000 C CNN
F 1 "74HC02" H 9900 4884 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 9900 4650 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74ls02" H 9900 4650 50  0001 C CNN
	3    9900 4650
	1    0    0    -1  
$EndComp
Wire Wire Line
	10150 5250 10300 5250
Wire Wire Line
	9500 4850 9500 4750
Wire Wire Line
	9500 4750 9600 4750
Wire Wire Line
	9500 5150 9550 5150
Wire Wire Line
	9500 5050 9500 5150
Text HLabel 10350 4650 2    50   Output ~ 0
~VSYNC
Wire Wire Line
	10200 4650 10300 4650
Wire Wire Line
	10300 4650 10300 4850
Connection ~ 10300 4650
Wire Wire Line
	10300 4650 10350 4650
Wire Wire Line
	10300 5050 10300 5250
Wire Wire Line
	9500 4850 10300 5050
Wire Wire Line
	10300 4850 9500 5050
Text Label 8350 4450 2    50   ~ 0
0x0DC
Wire Wire Line
	5300 4150 7350 4150
Wire Wire Line
	7350 4350 7350 4150
Wire Wire Line
	7450 4350 7350 4350
Wire Wire Line
	7350 4550 7450 4550
$Comp
L 74xx:74LS08 U22
U 3 1 611254DD
P 8700 5350
F 0 "U22" H 8700 5675 50  0000 C CNN
F 1 "74HC08" H 8700 5584 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 8700 5350 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 8700 5350 50  0001 C CNN
	3    8700 5350
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS08 U20
U 2 1 61123824
P 8700 4550
F 0 "U20" H 8700 4875 50  0000 C CNN
F 1 "74HC08" H 8700 4784 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 8700 4550 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 8700 4550 50  0001 C CNN
	2    8700 4550
	1    0    0    -1  
$EndComp
$Comp
L 74xx:74LS08 U22
U 1 1 6112239B
P 7750 4450
F 0 "U22" H 7750 4775 50  0000 C CNN
F 1 "74HC08" H 7750 4684 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 7750 4450 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 7750 4450 50  0001 C CNN
	1    7750 4450
	1    0    0    -1  
$EndComp
Wire Wire Line
	5300 4750 5700 4750
Wire Wire Line
	7350 4750 7350 4550
Wire Wire Line
	7250 4750 7350 4750
Wire Wire Line
	6300 4850 6650 4850
$Comp
L 74xx:74LS08 U22
U 2 1 60FEC569
P 6950 4750
F 0 "U22" H 6950 5075 50  0000 C CNN
F 1 "74HC08" H 6950 4984 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 6950 4750 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 6950 4750 50  0001 C CNN
	2    6950 4750
	1    0    0    -1  
$EndComp
Text Label 6600 4650 2    50   ~ 0
0x0C0
Wire Wire Line
	6600 4650 6650 4650
Text Label 6600 4850 2    50   ~ 0
0x010
$Comp
L 74xx:74LS08 U22
U 4 1 60FEE6EF
P 6000 4850
F 0 "U22" H 6000 5175 50  0000 C CNN
F 1 "74HC08" H 6000 5084 50  0000 C CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 6000 4850 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74LS08" H 6000 4850 50  0001 C CNN
	4    6000 4850
	1    0    0    -1  
$EndComp
Wire Wire Line
	3900 4250 3900 6150
Wire Wire Line
	5700 4950 4000 4950
Connection ~ 4000 4950
Wire Wire Line
	4000 4950 4000 6150
Text HLabel 6950 3450 2    50   Output ~ 0
VBLANK
$Comp
L 74xx:74LS02 U?
U 5 1 611B76CF
P 10500 1450
AR Path="/60E7C453/611B76CF" Ref="U?"  Part="1" 
AR Path="/60F6B7E4/611B76CF" Ref="U?"  Part="1" 
AR Path="/60F76465/611B76CF" Ref="U23"  Part="5" 
F 0 "U23" H 10730 1496 50  0000 L CNN
F 1 "74HC02" H 10730 1405 50  0000 L CNN
F 2 "Package_SO:SOIC-14_3.9x8.7mm_P1.27mm" H 10500 1450 50  0001 C CNN
F 3 "http://www.ti.com/lit/gpn/sn74ls02" H 10500 1450 50  0001 C CNN
	5    10500 1450
	1    0    0    -1  
$EndComp
Wire Wire Line
	9700 900  10500 900 
Wire Wire Line
	10500 900  10500 950 
Connection ~ 9700 900 
Wire Wire Line
	9700 2000 10500 2000
Wire Wire Line
	10500 2000 10500 1950
Connection ~ 9700 2000
Wire Wire Line
	6900 3450 6950 3450
Connection ~ 6900 3450
$EndSCHEMATC