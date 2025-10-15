# important builtin adresses
## colors

| decimal |hexadecimal| color     |
|---------|-----------|-----------|
|0        |0          |black      |
|1        |1          |white      |
|2        |2          |red        |
|3        |3          |cyan       |
|4        |4          |purple     |
|5        |5          |green      |
|6        |6          |blue       |
|7        |7          |yellow     |
|8        |8          |orange     |
|9        |9          |brown      |
|10       |A          |Light red  |
|11       |B          |dark grey  |
|12       |C          |grey       |
|13       |D          |Light green|
|14       |E          |Light blue |
|15       |F          |Light grey |

## pixel display
de pixel display is een waarde van 32x32 dat is 0x400 in hex
sinds that het scherm start op addres 0x200 that betekent dat hij stop aan 0x600 dus om de volle sherm the doen moet je van 0x200 tot en met 0x5FF shrijven

## handige routines
display fillen met een gewenste kleur
```x86asm
fill:
    JSR init_fill
    JSR loop_fill
    RTS


init_fill:
    LDX #$00
    LDA #1   ; gewenste kleur
    RTS

loop_fill:
    STA $0200,X
    STA $0300,X
    STA $0400,X
    STA $0500,X
    
    INX
    BNE loop_fill
    RTS
```
