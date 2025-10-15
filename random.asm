define sysRandom $fe

random_0_255:
    LDA sysRandom
    RTS

random_color:
    LDA sysRandom
    AND #15
    ADC #1
    RTS

random_display_coord_X:
    LDA sysRandom
    AND #32
    TAX
    RTS
