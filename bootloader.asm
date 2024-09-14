; bootloader.asm
[BITS 16]         ; Indicate that we're in 16-bit real mode
[ORG 0x7C00]      ; The bootloader is loaded at address 0x7C00

; Bootloader code starts here
MOV AH, 0x0E      ; BIOS teletype function to print characters
MOV AL, 'H'       ; Character to print
INT 0x10          ; Call BIOS interrupt to print the character

MOV AL, 'e'
INT 0x10

MOV AL, 'l'
INT 0x10

MOV AL, 'l'
INT 0x10

MOV AL, 'o'
INT 0x10

MOV AL, ','
INT 0x10

MOV AL, ' '
INT 0x10

MOV AL, 'W'
INT 0x10

MOV AL, 'o'
INT 0x10

MOV AL, 'r'
INT 0x10

MOV AL, 'l'
INT 0x10

MOV AL, 'd'
INT 0x10

MOV AL, '!'
INT 0x10

; Infinite loop to halt execution
JMP $

; The bootloader must be exactly 512 bytes in size
TIMES 510 - ($ - $$) DB 0
DW 0xAA55          ; Boot signature
