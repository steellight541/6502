define value    $0
define left     $1
define right    $2

LDA #137
STA value

LDA value
AND #$0F
STA right

LDA value
AND #$F0
STA left

