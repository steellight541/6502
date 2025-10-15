# hoe programmeer je easy6502
easy6502 is een 6502 emulator die je toelaat om 6502 assembly code te schrijven en uit te voeren.
je kan de emulator vinden op https://skilldrick.github.io/easy6502/


er zijn een paar dingen die je moet weten om te beginnen met programmeren in easy6502.
## instructies
de 6502 heeft een set van instructies die je kunt gebruiken om je programma te schrijven.
je kunt ze vinden op https://www.chibiakumas.com/6502/CheatSheet.pdf

er zijn ook een paar handige preset waarden die je kunt gebruiken zoals kleuren en geheugenadressen.
zoals [kleuren](./readme.md#colors), [random getal genereren](./readme.md#random-getal-genereren) en [keyboard input](./readme.md#keyboard-input).


## geheugenadressen
in high level talen zoals python kan je variabelen aanmaken en die gebruiken.
in easy6502 kan je dit ook maar met een twist.
je moet namelijk zelf geheugenadressen toewijzen aan je variabelen.

je kunt dit doen met de `define <var> <address>` directive zoals `define max_waarde $0`. LET OP bij het "bepalen" zorg je ervoor dat je een adress kiest dat niet in gebruik is door de emulator of door je eigen code. als je het is opgemerkt bij de define wijs je een adress toe aan een variable maar de waarde is nog niet gedefinieerd je kunt dit op voorhand doen of later in je code.

hier is een voorbeeld:
```x86asm
; deze variable is om gewoon een meer leesbare naam te geven aan een geheugenadres
define sysRandom $FE

; deze variable is om een waarde later op te slaan
define myVar $10

LDA #1
define white $1 ; definieer de waarde white als 1
STA white ; sla de waarde 1 op in het geheugenadres $1

; wat later in de code
LDA #5
STA myVar ; sla de waarde 5 op in het geheugenadres $10
```


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
## random getal genereren
je kunt een random getal genereren door de waarde op adres $FE te lezen
```x86asm
LDA $FE
```
## keyboard input
je kunt de keyboard input lezen door de waarde op adres $FF te lezen
```x86asm
LDA $FF
```