define start_addr    $00

; colors starting at 0x10
define left_color    $10
define right_color   $11
define block_size    $12
define curr_color    $13

LDA #$00
STA start_addr

; white
LDA #$01
STA left_color

; red
LDA #$02
STA right_color

LDA #$10
STA block_size

LDX #$00
LDA left_color
STA curr_color

loop_left:
    LDA curr_color
    STA $200,X
    INX
    CPX block_size
    BNE loop_left

LDA right_color
STA curr_color

loop_right:
    LDA curr_color
    STA $200,X
    INX
    CPX #$20
    BNE loop_right

BRK