// XMega65 Kernal Development Template
// Each function of the kernal is a no-args function
// The functions are placed in the SYSCALLS table surrounded by JMP and NOP
  .file [name="checkpoint3.4.bin", type="bin", segments="XMega65Bin"]
.segmentdef XMega65Bin [segments="Syscall, Code, Data, Stack, Zeropage"]
.segmentdef Syscall [start=$8000, max=$81ff]
.segmentdef Code [start=$8200, min=$8200, max=$bdff]
.segmentdef Data [startAfter="Code", min=$8200, max=$bdff]
.segmentdef Stack [min=$be00, max=$beff, fill]
.segmentdef Zeropage [min=$bf00, max=$bfff, fill]
  .label VIC_MEMORY = $d018
  .label SCREEN = $400
  .label COLS = $d800
  .const WHITE = 1
  .const JMP = $4c
  .const NOP = $ea
  .label current_screen_x = $c
  .label current_screen_line = $f
  .label current_screen_line_28 = $a
  .label current_screen_line_57 = $a
  .label current_screen_line_58 = $a
  .label current_screen_line_59 = $a
  .label current_screen_line_60 = $a
  .label current_screen_line_61 = $a
  .label current_screen_line_62 = $a
  .label current_screen_line_63 = $a
.segment Code
main: {
    .label sc = $f
    .label msg = $a
    lda #$14
    sta VIC_MEMORY
    ldx #' '
    lda #<SCREEN
    sta.z memset.str
    lda #>SCREEN
    sta.z memset.str+1
    lda #<$28*$19
    sta.z memset.num
    lda #>$28*$19
    sta.z memset.num+1
    jsr memset
    ldx #WHITE
    lda #<COLS
    sta.z memset.str
    lda #>COLS
    sta.z memset.str+1
    lda #<$28*$19
    sta.z memset.num
    lda #>$28*$19
    sta.z memset.num+1
    jsr memset
    lda #<SCREEN+$28
    sta.z sc
    lda #>SCREEN+$28
    sta.z sc+1
    lda #<MESSAGE
    sta.z msg
    lda #>MESSAGE
    sta.z msg+1
  __b1:
    ldy #0
    lda (msg),y
    cmp #0
    bne __b2
    rts
  __b2:
    ldy #0
    lda (msg),y
    sta (sc),y
    inc.z sc
    bne !+
    inc.z sc+1
  !:
    inc.z msg
    bne !+
    inc.z msg+1
  !:
    jmp __b1
}
// Copies the character c (an unsigned char) to the first num characters of the object pointed to by the argument str.
// memset(void* zeropage(4) str, byte register(X) c, word zeropage(2) num)
memset: {
    .label end = 2
    .label dst = 4
    .label num = 2
    .label str = 4
    lda.z num
    bne !+
    lda.z num+1
    beq __breturn
  !:
    lda.z end
    clc
    adc.z str
    sta.z end
    lda.z end+1
    adc.z str+1
    sta.z end+1
  __b2:
    lda.z dst+1
    cmp.z end+1
    bne __b3
    lda.z dst
    cmp.z end
    bne __b3
  __breturn:
    rts
  __b3:
    txa
    ldy #0
    sta (dst),y
    inc.z dst
    bne !+
    inc.z dst+1
  !:
    jmp __b2
}
cpukil: {
    jsr exit_hypervisor
    rts
}
exit_hypervisor: {
    lda #1
    sta $d67f
    rts
}
reserved: {
    jsr exit_hypervisor
    rts
}
vf011wr: {
    jsr exit_hypervisor
    rts
}
vf011rd: {
    jsr exit_hypervisor
    rts
}
alttabkey: {
    jsr exit_hypervisor
    rts
}
restorkey: {
    jsr exit_hypervisor
    rts
}
pagfault: {
    jsr exit_hypervisor
    rts
}
syscall3F: {
    jsr exit_hypervisor
    rts
}
syscall3E: {
    jsr exit_hypervisor
    rts
}
syscall3D: {
    jsr exit_hypervisor
    rts
}
syscall3C: {
    jsr exit_hypervisor
    rts
}
syscall3B: {
    jsr exit_hypervisor
    rts
}
syscall3A: {
    jsr exit_hypervisor
    rts
}
syscall39: {
    jsr exit_hypervisor
    rts
}
syscall38: {
    jsr exit_hypervisor
    rts
}
syscall37: {
    jsr exit_hypervisor
    rts
}
syscall36: {
    jsr exit_hypervisor
    rts
}
syscall35: {
    jsr exit_hypervisor
    rts
}
syscall34: {
    jsr exit_hypervisor
    rts
}
syscall33: {
    jsr exit_hypervisor
    rts
}
syscall32: {
    jsr exit_hypervisor
    rts
}
syscall31: {
    jsr exit_hypervisor
    rts
}
syscall30: {
    jsr exit_hypervisor
    rts
}
syscall2F: {
    jsr exit_hypervisor
    rts
}
syscall2E: {
    jsr exit_hypervisor
    rts
}
syscall2D: {
    jsr exit_hypervisor
    rts
}
syscall2C: {
    jsr exit_hypervisor
    rts
}
syscall2B: {
    jsr exit_hypervisor
    rts
}
syscall2A: {
    jsr exit_hypervisor
    rts
}
syscall29: {
    jsr exit_hypervisor
    rts
}
syscall28: {
    jsr exit_hypervisor
    rts
}
syscall27: {
    jsr exit_hypervisor
    rts
}
syscall26: {
    jsr exit_hypervisor
    rts
}
syscall25: {
    jsr exit_hypervisor
    rts
}
syscall24: {
    jsr exit_hypervisor
    rts
}
syscall23: {
    jsr exit_hypervisor
    rts
}
syscall22: {
    jsr exit_hypervisor
    rts
}
syscall21: {
    jsr exit_hypervisor
    rts
}
syscall20: {
    jsr exit_hypervisor
    rts
}
syscall1F: {
    jsr exit_hypervisor
    rts
}
syscall1E: {
    jsr exit_hypervisor
    rts
}
syscall1D: {
    jsr exit_hypervisor
    rts
}
syscall1C: {
    jsr exit_hypervisor
    rts
}
syscall1B: {
    jsr exit_hypervisor
    rts
}
syscall1A: {
    jsr exit_hypervisor
    rts
}
syscall19: {
    jsr exit_hypervisor
    rts
}
syscall18: {
    jsr exit_hypervisor
    rts
}
syscall17: {
    jsr exit_hypervisor
    rts
}
syscall16: {
    jsr exit_hypervisor
    rts
}
syscall15: {
    jsr exit_hypervisor
    rts
}
syscall14: {
    jsr exit_hypervisor
    rts
}
syscall13: {
    jsr exit_hypervisor
    rts
}
securexit: {
    jsr exit_hypervisor
    rts
}
securentr: {
    jsr exit_hypervisor
    rts
}
syscall10: {
    jsr exit_hypervisor
    rts
}
syscall0F: {
    jsr exit_hypervisor
    rts
}
syscall0E: {
    jsr exit_hypervisor
    rts
}
syscall0D: {
    jsr exit_hypervisor
    rts
}
syscall0C: {
    jsr exit_hypervisor
    rts
}
syscall0B: {
    jsr exit_hypervisor
    rts
}
syscall0A: {
    jsr exit_hypervisor
    rts
}
syscall09: {
    jsr exit_hypervisor
    rts
}
syscall08: {
    jsr exit_hypervisor
    rts
}
syscall07: {
    jsr exit_hypervisor
    rts
}
syscall06: {
    jsr exit_hypervisor
    rts
}
syscall05: {
    jsr exit_hypervisor
    rts
}
syscall04: {
    jsr exit_hypervisor
    rts
}
syscall03: {
    jsr exit_hypervisor
    rts
}
syscall02: {
    jsr exit_hypervisor
    rts
}
syscall01: {
    jsr exit_hypervisor
    rts
}
syscall00: {
    jsr exit_hypervisor
    rts
}
reset: {
    lda #$14
    sta VIC_MEMORY
    ldx #' '
    lda #<SCREEN
    sta.z memset.str
    lda #>SCREEN
    sta.z memset.str+1
    lda #<$28*$19
    sta.z memset.num
    lda #>$28*$19
    sta.z memset.num+1
    jsr memset
    ldx #WHITE
    lda #<COLS
    sta.z memset.str
    lda #>COLS
    sta.z memset.str+1
    lda #<$28*$19
    sta.z memset.num
    lda #>$28*$19
    sta.z memset.num+1
    jsr memset
    lda #0
    sta.z current_screen_x
    lda #<$400
    sta.z current_screen_line_28
    lda #>$400
    sta.z current_screen_line_28+1
    lda #<message
    sta.z print_to_screen.message
    lda #>message
    sta.z print_to_screen.message+1
    jsr print_to_screen
    lda #<$400
    sta.z current_screen_line
    lda #>$400
    sta.z current_screen_line+1
    jsr print_newline
    lda.z current_screen_line
    sta.z current_screen_line_63
    lda.z current_screen_line+1
    sta.z current_screen_line_63+1
    lda #0
    sta.z current_screen_x
    lda #<message1
    sta.z print_to_screen.message
    lda #>message1
    sta.z print_to_screen.message+1
    jsr print_to_screen
    jsr detect_devices
    jsr exit_hypervisor
    rts
  .segment Data
    message: .text "nguy1153 operating system starting..."
    .byte 0
    message1: .text "testing hardware"
    .byte 0
}
.segment Code
detect_devices: {
    .label mem = 6
    .label is_found_vicii = 8
    .label is_found_mos6526 = 6
    .label mem_10 = 8
    .label mem_21 = 8
    lda #<$d000
    sta.z mem
    lda #>$d000
    sta.z mem+1
  __b1:
    lda.z mem+1
    cmp #>$dff0
    bcc __b2
    bne !+
    lda.z mem
    cmp #<$dff0
    bcc __b2
  !:
    jsr print_newline
    lda.z current_screen_line
    sta.z current_screen_line_57
    lda.z current_screen_line+1
    sta.z current_screen_line_57+1
    lda #0
    sta.z current_screen_x
    lda #<message
    sta.z print_to_screen.message
    lda #>message
    sta.z print_to_screen.message+1
    jsr print_to_screen
    rts
  __b2:
    lda.z mem+1
    cmp #>$d800
    bne !+
    lda.z mem
    cmp #<$d800
  !:
    bcc __b7
    beq __b7
    lda.z mem+1
    cmp #>$dbff
    bcc !+
    bne __b7
    lda.z mem
    cmp #<$dbff
    bcs __b7
  !:
  __b4:
    inc.z mem
    bne !+
    inc.z mem+1
  !:
    jmp __b1
  __b7:
    jsr detect_vicii
    lda.z is_found_vicii
    bne !+
    lda.z is_found_vicii+1
    bne !__b22+
    jmp __b22
  !__b22:
  !:
    jsr print_newline
    lda.z current_screen_line
    sta.z current_screen_line_58
    lda.z current_screen_line+1
    sta.z current_screen_line_58+1
    lda #0
    sta.z current_screen_x
    lda #<message1
    sta.z print_to_screen.message
    lda #>message1
    sta.z print_to_screen.message+1
    jsr print_to_screen
    lda.z mem
    sta.z print_hex.value
    lda.z mem+1
    sta.z print_hex.value+1
    jsr print_hex
    lda.z current_screen_line
    sta.z current_screen_line_59
    lda.z current_screen_line+1
    sta.z current_screen_line_59+1
    lda #<message2
    sta.z print_to_screen.message
    lda #>message2
    sta.z print_to_screen.message+1
    jsr print_to_screen
    lda.z is_found_vicii
    sta.z print_hex.value
    lda.z is_found_vicii+1
    sta.z print_hex.value+1
    jsr print_hex
  __b5:
    jsr detect_mos6526
    lda.z is_found_mos6526
    bne !+
    lda.z is_found_mos6526+1
    beq __b21
  !:
    jsr print_newline
    lda.z current_screen_line
    sta.z current_screen_line_60
    lda.z current_screen_line+1
    sta.z current_screen_line_60+1
    lda #0
    sta.z current_screen_x
    lda #<message3
    sta.z print_to_screen.message
    lda #>message3
    sta.z print_to_screen.message+1
    jsr print_to_screen
    lda.z mem_10
    sta.z print_hex.value
    lda.z mem_10+1
    sta.z print_hex.value+1
    jsr print_hex
    lda.z current_screen_line
    sta.z current_screen_line_61
    lda.z current_screen_line+1
    sta.z current_screen_line_61+1
    lda #<message2
    sta.z print_to_screen.message
    lda #>message2
    sta.z print_to_screen.message+1
    jsr print_to_screen
    lda.z is_found_mos6526
    sta.z print_hex.value
    lda.z is_found_mos6526+1
    sta.z print_hex.value+1
    jsr print_hex
    jmp __b4
  __b21:
    lda.z mem_10
    sta.z mem
    lda.z mem_10+1
    sta.z mem+1
    jmp __b4
  __b22:
    lda.z mem
    sta.z mem_21
    lda.z mem+1
    sta.z mem_21+1
    jmp __b5
  .segment Data
    message: .text "finished probing devices"
    .byte 0
    message1: .text "vic-ii detected at $"
    .byte 0
    message2: .text "--$"
    .byte 0
    message3: .text "mos6526 detected at $"
    .byte 0
}
.segment Code
// print_hex(word zeropage($d) value)
print_hex: {
    .label __3 = $19
    .label __6 = $1b
    .label value = $d
    ldx #0
  __b1:
    cpx #4
    bcc __b2
    lda #0
    sta hex+4
    lda.z current_screen_line
    sta.z current_screen_line_62
    lda.z current_screen_line+1
    sta.z current_screen_line_62+1
    lda #<hex
    sta.z print_to_screen.message
    lda #>hex
    sta.z print_to_screen.message+1
    jsr print_to_screen
    rts
  __b2:
    lda.z value+1
    cmp #>$a000
    bcc __b4
    bne !+
    lda.z value
    cmp #<$a000
    bcc __b4
  !:
    ldy #$c
    lda.z value
    sta.z __3
    lda.z value+1
    sta.z __3+1
    cpy #0
    beq !e+
  !:
    lsr.z __3+1
    ror.z __3
    dey
    bne !-
  !e:
    lda.z __3
    sec
    sbc #9
    sta hex,x
  __b5:
    asl.z value
    rol.z value+1
    asl.z value
    rol.z value+1
    asl.z value
    rol.z value+1
    asl.z value
    rol.z value+1
    inx
    jmp __b1
  __b4:
    ldy #$c
    lda.z value
    sta.z __6
    lda.z value+1
    sta.z __6+1
    cpy #0
    beq !e+
  !:
    lsr.z __6+1
    ror.z __6
    dey
    bne !-
  !e:
    lda.z __6
    clc
    adc #'0'
    sta hex,x
    jmp __b5
  .segment Data
    hex: .fill 5, 0
}
.segment Code
// print_to_screen(byte* zeropage($d) message)
print_to_screen: {
    .label message = $d
  __b1:
    ldy #0
    lda (message),y
    cmp #0
    bne __b2
    rts
  __b2:
    ldy #0
    lda (message),y
    ldy.z current_screen_x
    sta (current_screen_line_28),y
    inc.z message
    bne !+
    inc.z message+1
  !:
    inc.z current_screen_x
    jmp __b1
}
print_newline: {
    lda #$28
    clc
    adc.z current_screen_line
    sta.z current_screen_line
    bcc !+
    inc.z current_screen_line+1
  !:
    rts
}
// detect_mos6526(word zeropage(8) address)
detect_mos6526: {
    .label address = 8
    .label return = 6
    .label p = $15
    .label s1 = $1d
    .label i = $11
    lda #<0
    sta.z p
    sta.z p+1
    ldy #9
    lda (address),y
    sta.z s1
    ldy #$b
    lda (address),y
    cmp #1+1
    bcc b1
    cmp #$23
    bcc b2
  b1:
    lda #<0
    sta.z return
    sta.z return+1
    rts
  b2:
    lda #1
    sta.z i
    lda #0
    sta.z i+1
    sta.z i+2
    sta.z i+3
  __b2:
    lda.z i+3
    cmp #>$1e8480>>$10
    bcc __b4
    bne !+
    lda.z i+2
    cmp #<$1e8480>>$10
    bcc __b4
    bne !+
    lda.z i+1
    cmp #>$1e8480
    bcc __b4
    bne !+
    lda.z i
    cmp #<$1e8480
    bcc __b4
  !:
    ldy #9
    lda (address),y
    cmp.z s1
    bne __b1
    jmp b1
  __b1:
    lda #$ff
    clc
    adc.z address
    sta.z return
    lda #0
    adc.z address+1
    sta.z return+1
    rts
  __b4:
    inc.z i
    bne !+
    inc.z i+1
    bne !+
    inc.z i+2
    bne !+
    inc.z i+3
  !:
    jmp __b2
}
// detect_vicii(word zeropage(6) address)
detect_vicii: {
    .const mem_size = $7f
    .label address = 6
    .label return = 8
    .label pointer = $17
    .label v1 = $1d
    .label i = $19
    lda #<0
    sta.z pointer
    sta.z pointer+1
    ldy #$12
    lda (address),y
    sta.z v1
    lda #<1
    sta.z i
    lda #>1
    sta.z i+1
  //Read start address +12
  //Wait at least 64 microseconds.
  __b2:
    lda.z i+1
    cmp #>$3e8
    bcc __b4
    bne !+
    lda.z i
    cmp #<$3e8
    bcc __b4
  !:
    ldy #$12
    lda (address),y
    //Read again
    cmp.z v1
    bne __b1
    lda #<0
    sta.z return
    sta.z return+1
    rts
  __b1:
    lda #<mem_size
    clc
    adc.z address
    sta.z return
    lda #>mem_size
    adc.z address+1
    sta.z return+1
    rts
  __b4:
    inc.z i
    bne !+
    inc.z i+1
  !:
    jmp __b2
}
.segment Data
  MESSAGE: .text "checkpoint3.4 by nguy1153"
  .byte 0
.segment Syscall
  SYSCALL: .byte JMP
  .word syscall00
  .byte NOP, JMP
  .word syscall01
  .byte NOP, JMP
  .word syscall02
  .byte NOP, JMP
  .word syscall03
  .byte NOP, JMP
  .word syscall04
  .byte NOP, JMP
  .word syscall05
  .byte NOP, JMP
  .word syscall06
  .byte NOP, JMP
  .word syscall07
  .byte NOP, JMP
  .word syscall08
  .byte NOP, JMP
  .word syscall09
  .byte NOP, JMP
  .word syscall0A
  .byte NOP, JMP
  .word syscall0B
  .byte NOP, JMP
  .word syscall0C
  .byte NOP, JMP
  .word syscall0D
  .byte NOP, JMP
  .word syscall0E
  .byte NOP, JMP
  .word syscall0F
  .byte NOP, JMP
  .word syscall10
  .byte NOP, JMP
  .word securentr
  .byte NOP, JMP
  .word securexit
  .byte NOP, JMP
  .word syscall13
  .byte NOP, JMP
  .word syscall14
  .byte NOP, JMP
  .word syscall15
  .byte NOP, JMP
  .word syscall16
  .byte NOP, JMP
  .word syscall17
  .byte NOP, JMP
  .word syscall18
  .byte NOP, JMP
  .word syscall19
  .byte NOP, JMP
  .word syscall1A
  .byte NOP, JMP
  .word syscall1B
  .byte NOP, JMP
  .word syscall1C
  .byte NOP, JMP
  .word syscall1D
  .byte NOP, JMP
  .word syscall1E
  .byte NOP, JMP
  .word syscall1F
  .byte NOP, JMP
  .word syscall20
  .byte NOP, JMP
  .word syscall21
  .byte NOP, JMP
  .word syscall22
  .byte NOP, JMP
  .word syscall23
  .byte NOP, JMP
  .word syscall24
  .byte NOP, JMP
  .word syscall25
  .byte NOP, JMP
  .word syscall26
  .byte NOP, JMP
  .word syscall27
  .byte NOP, JMP
  .word syscall28
  .byte NOP, JMP
  .word syscall29
  .byte NOP, JMP
  .word syscall2A
  .byte NOP, JMP
  .word syscall2B
  .byte NOP, JMP
  .word syscall2C
  .byte NOP, JMP
  .word syscall2D
  .byte NOP, JMP
  .word syscall2E
  .byte NOP, JMP
  .word syscall2F
  .byte NOP, JMP
  .word syscall30
  .byte NOP, JMP
  .word syscall31
  .byte NOP, JMP
  .word syscall32
  .byte NOP, JMP
  .word syscall33
  .byte NOP, JMP
  .word syscall34
  .byte NOP, JMP
  .word syscall35
  .byte NOP, JMP
  .word syscall36
  .byte NOP, JMP
  .word syscall37
  .byte NOP, JMP
  .word syscall38
  .byte NOP, JMP
  .word syscall39
  .byte NOP, JMP
  .word syscall3A
  .byte NOP, JMP
  .word syscall3B
  .byte NOP, JMP
  .word syscall3C
  .byte NOP, JMP
  .word syscall3D
  .byte NOP, JMP
  .word syscall3E
  .byte NOP, JMP
  .word syscall3F
  .byte NOP
  .align $100
  TRAPS: .byte JMP
  .word reset
  .byte NOP, JMP
  .word pagfault
  .byte NOP, JMP
  .word restorkey
  .byte NOP, JMP
  .word alttabkey
  .byte NOP, JMP
  .word vf011rd
  .byte NOP, JMP
  .word vf011wr
  .byte NOP, JMP
  .word reserved
  .byte NOP, JMP
  .word reserved
  .byte NOP, JMP
  .word reserved
  .byte NOP, JMP
  .word reserved
  .byte NOP, JMP
  .word reserved
  .byte NOP, JMP
  .word reserved
  .byte NOP, JMP
  .word reserved
  .byte NOP, JMP
  .word reserved
  .byte NOP, JMP
  .word reserved
  .byte NOP, JMP
  .word reserved
  .byte NOP, JMP
  .word reserved
  .byte NOP, JMP
  .word reserved
  .byte NOP, JMP
  .word reserved
  .byte NOP, JMP
  .word reserved
  .byte NOP, JMP
  .word reserved
  .byte NOP, JMP
  .word reserved
  .byte NOP, JMP
  .word reserved
  .byte NOP, JMP
  .word reserved
  .byte NOP, JMP
  .word reserved
  .byte NOP, JMP
  .word reserved
  .byte NOP, JMP
  .word reserved
  .byte NOP, JMP
  .word reserved
  .byte NOP, JMP
  .word reserved
  .byte NOP, JMP
  .word reserved
  .byte NOP, JMP
  .word reserved
  .byte NOP, JMP
  .word reserved
  .byte NOP, JMP
  .word reserved
  .byte NOP, JMP
  .word reserved
  .byte NOP, JMP
  .word reserved
  .byte NOP, JMP
  .word reserved
  .byte NOP, JMP
  .word reserved
  .byte NOP, JMP
  .word reserved
  .byte NOP, JMP
  .word reserved
  .byte NOP, JMP
  .word reserved
  .byte NOP, JMP
  .word reserved
  .byte NOP, JMP
  .word reserved
  .byte NOP, JMP
  .word reserved
  .byte NOP, JMP
  .word reserved
  .byte NOP, JMP
  .word reserved
  .byte NOP, JMP
  .word reserved
  .byte NOP, JMP
  .word reserved
  .byte NOP, JMP
  .word reserved
  .byte NOP, JMP
  .word reserved
  .byte NOP, JMP
  .word reserved
  .byte NOP, JMP
  .word reserved
  .byte NOP, JMP
  .word reserved
  .byte NOP, JMP
  .word reserved
  .byte NOP, JMP
  .word reserved
  .byte NOP, JMP
  .word reserved
  .byte NOP, JMP
  .word cpukil
  .byte NOP
