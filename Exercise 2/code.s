.global _start
_start:
MAIN: SUB R0, R15, R15 ; R0 = 0
	ADD R1, R0, #255 ; R1 = 255
	ADD R2, R1, R1 ; R2 = 255 + 255 = 510
	STR R2, [R0, #196] ; MEM[196] = 510 = 1FE
	EOR R3, R1, #77 ; R3 = 255 xor 77 = 178
	AND R4, R3, #0x1F ; R4 = 178 AND 1F = 18
	ADD R5, R3, R4 ; R5 = 178 + 18 = 196
	LDRB R6, [R5] ; R6 = FE
	LDRB R7, [R5, #1] ;R7 = 01
	SUBS R0, R6, R7
	BLT MAIN
	BGT HERE
	STR R1, [R4, #110]
	B MAIN
HERE: STR R6, [R4, #110]
