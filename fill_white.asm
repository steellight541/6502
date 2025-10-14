fill:
    JSR init_fill
    JSR loop_fill


init_fill:
    LDX #$00
    LDA #1 ; white
    RTS

loop_fill:
    STA $0200,X
    STA $0300,X
    STA $0400,X
    STA $0500,X
    
    INX
    BNE loop_fill
    RTS