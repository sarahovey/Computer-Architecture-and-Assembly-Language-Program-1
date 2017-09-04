TITLE Program 1     (template.asm)

; Author: Sara Hovey 

; OSU email: hoveys@oregonstate.edu
;         Date: 4/16/17
; Description: This program asks the user for two numbers and returns
; their sum, difference, quotient, and remainder

INCLUDE Irvine32.inc

; (insert constant definitions here)

.data
;Values from the user
firstNum DWORD ?
secNum   DWORD ?

;Calculated values
sum      DWORD ?
diff     DWORD ?
product  DWORD ?
quotient DWORD ?
remain   DWORD ?

;Text output
intro_1  BYTE  "Name: Sara, CS 271 Program 1", 0 ; Introduction
ask_1    BYTE  "Please enter two numbers, enter the first one now ", 0 
ask_2	 BYTE  "Enter the second number " , 0
showSum  BYTE  "The sum is " , 0 
showDiff BYTE  "The difference is " , 0
showProd BYTE  "The product is " , 0
showQuo  BYTE  "The quotient is " , 0
showRem  BYTE  "The remainder is" , 0
bye      BYTE  "Goodbye!", 0


.code
main PROC
; Introduction
	mov		edx, OFFSET intro_1
	call	WriteString
	call	CrLf

; Ask for first number
	mov		edx, OFFSET ask_1
	call	Writestring
	call	ReadInt
	mov		firstNum, eax

; Ask for second number
	mov		edx, OFFSET ask_2
	call	Writestring
	call	ReadInt
	mov		secNum, eax

;Calculate Sum
	mov		eax, firstNum
	add 	eax, secNum	
	mov		sum, eax

;Show Sum
	mov		edx, OFFSET showSum
	call	WriteString
	mov		eax, sum
	call	WriteInt
	call	CrLf

;Calculate Difference
	mov		eax, firstNum
	sub		eax, secNum
	mov		diff, eax
;Show Difference
	mov		edx, OFFSET showDiff
	call	WriteString
	mov		eax, diff
	call	WriteInt
	call	CrLf


;Calculate Product
	mov eax, firstNum
	mov ebx, secNum
	mul ebx
	mov product, eax
;Show Product
	mov		edx, OFFSET showProd
	call	WriteString
	mov		eax, product
	call	WriteInt
	call	CrLf

;Calculate Quotient (int)
	mov		eax, firstNum
	mov		ebx, secNum
	div		ebx
	mov		quotient, eax
; Show Quotient
	mov		edx, OFFSET showQuo
	call	WriteString
	mov		eax, quotient
	call	WriteInt
	call	CrLf

;Calculate Remainder
	mov		eax, firstNum
	mov		ebx, secNum
	div		ebx
	mov		remain, edx
;Show Remainder
	mov		edx, OFFSET showRem
	call	WriteString
	mov		eax, remain
	call	WriteInt
	call	CrLf

;Goodbye
	mov		edx, OFFSET bye
	call	WriteString
	call	CrLf

	exit	; exit to operating system
main ENDP

; (insert additional procedures here)

END main
