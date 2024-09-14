; bootloader.asm
[BITS 16]          ; 16-bit real mode
[ORG 0x7C00]       ; Bootloader is loaded at address 0x7C00

; Print "Press ESC to see if it works..."
MOV AH, 0x0E       ; BIOS teletype function to print characters
MOV AL, 'P'
INT 0x10
MOV AL, 'r'
INT 0x10
MOV AL, 'e'
INT 0x10
MOV AL, 's'
INT 0x10
MOV AL, 's'
INT 0x10
MOV AL, ' '
INT 0x10
MOV AL, 'E'
INT 0x10
MOV AL, 'S'
INT 0x10
MOV AL, 'C'
INT 0x10
MOV AL, ' '
INT 0x10
MOV AL, 't'
INT 0x10
MOV AL, 'o'
INT 0x10
MOV AL, ' '
INT 0x10
MOV AL, 's'
INT 0x10
MOV AL, 'e'
INT 0x10
MOV AL, 'e'
INT 0x10
MOV AL, ' '
INT 0x10
MOV AL, 'i'
INT 0x10
MOV AL, 'f'
INT 0x10
MOV AL, ' '
INT 0x10
MOV AL, 'i'
INT 0x10
MOV AL, 't'
INT 0x10
MOV AL, ' '
INT 0x10
MOV AL, 'w'
INT 0x10
MOV AL, 'o'
INT 0x10
MOV AL, 'r'
INT 0x10
MOV AL, 'k'
INT 0x10
MOV AL, 's'
INT 0x10
MOV AL, '.'
INT 0x10

; Infinite loop to check for ESC key press
CHECK_ESC:
    MOV AH, 0x00       ; BIOS keyboard interrupt
    INT 0x16           ; Read keyboard input
    CMP AL, 0x01       ; Compare input with ESC (0x01)
    JZ ESC_PRESSED     ; Jump if ESC is pressed

    JMP CHECK_ESC      ; Otherwise, keep checking

ESC_PRESSED:
    ; Print "No"
    MOV AH, 0x0E       ; BIOS teletype function to print characters
    MOV AL, 'N'
    INT 0x10
    MOV AL, 'o'
    INT 0x10

    ; Infinite loop to halt execution
    JMP $

; Fill remaining bytes and add boot signature
TIMES 510 - ($ - $$) DB 0
DW 0xAA55           ; Boot signature
