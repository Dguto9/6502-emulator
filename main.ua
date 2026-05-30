# Experimental!
┌─╴Flags
  ~ [
    N ← 0
    V ← 0
    D ← 0
    I ← 0
    Z ← 0
    C ← 0
  ]
  ToByte   ← °⋯[⊃(C|Z|I|D|1|1|V|N)]
  FromByte ← ▽1_1_0_0_1_1_1_1⇌⋯₈
└─╴

┌─╴CPU
  ~ {
    A ← 0
    PC ← 0
    S ← ⋕₁₆"00FF"
    X ← 0
    Y ← 0
    Flags ← Flags
    M ← ⬚0°⊸△+⊙⊸⧻
  }
  Z ← °⊸Flags‥Z=0
  N ← °⊸Flags‥N=1⊣⋯₈
  C ← °⊸Flags‥C↥⊃(>255|<0)
  V ← °⊸Flags‥V×≠⊙⟜=∩₃(⊣⋯₈)
└─╴

Addr ← ⌅(+⊙×₂₅₆|⊃◿₂₅₆(⌊÷₂₅₆))
TC   ← ⍜+₁₂₈◿₂₅₆
# Value ? Address CPU
Get   ← ⊡⊙CPU.M
Stack ← ⌅(⍜CPU.S(◿₂₅₆-₁)˜⌝⊸Get⊙(+₂₅₆⊸CPU.S)|⊸Get+₂₅₆⊸CPU.S⍜CPU.S(◿₂₅₆+₁))
I!    ← ^⍜CPU.PC+₁
IM!   ← ^⊙⍜CPU.PC+₁⊡⊸⊃(CPU.PC|CPU.M)
IM₂!  ← ^⊙⍜CPU.PC+₂Addr∩⌟⊡⊸⊃(⟜+₁CPU.PC|CPU.M)
AB!   ← ^⊸Get⟜(⍥(⌝⊸Get49152 0)=₄₉₁₆₈)
AB₂!  ← ^Addr⊸∩⌟Get⟜+₁
IDX‼  ← ^1◿₂₅₆+⊙⊸^0
IDX₂‼ ← ^1◿₆₅₅₃₆+⊙⊸^0

LDA ← °⊸CPU.A⟜CPU.N⟜CPU.Z
LDX ← °⊸CPU.X⟜CPU.N⟜CPU.Z
LDY ← °⊸CPU.Y⟜CPU.N⟜CPU.Z
STA ← ⨬(⋅∘|⌝⊸Get⊙⊸CPU.A)⊸<₄₉₁₅₂
STX ← ⌝⊸Get⊙⊸CPU.X
STY ← ⌝⊸Get⊙⊸CPU.Y

TAX ← °⊸CPU.X⟜CPU.N⟜CPU.Z⊸CPU.A
TAY ← °⊸CPU.Y⟜CPU.N⟜CPU.Z⊸CPU.A
TXA ← °⊸CPU.A⟜CPU.N⟜CPU.Z⊸CPU.X
TYA ← °⊸CPU.A⟜CPU.N⟜CPU.Z⊸CPU.Y
TSX ← °⊸CPU.X⟜CPU.N⟜CPU.Z⊸CPU.S
TXS ← °⊸CPU.S⊸CPU.X

PHA ← Stack⊸CPU.A
PHP ← Stack⊸CPU.Flags‥ToByte
PLA ← °⊸CPU.A⟜CPU.N⟜CPU.Z°Stack
PLP ← °⊸CPU.Flags Flags.FromByte⟜CPU.N⟜CPU.Z°Stack

DEC ← ⌝⊸Get⟜(⟜CPU.N⟜CPU.Z◿₂₅₆-₁⊸Get)
DEX ← ⍜⊸CPU.X(⟜CPU.N⟜CPU.Z◿₂₅₆-₁)
DEY ← ⍜⊸CPU.Y(⟜CPU.N⟜CPU.Z◿₂₅₆-₁)
INC ← ⌝⊸Get⟜(⟜CPU.N⟜CPU.Z◿₂₅₆+₁⊸Get)
INX ← ⍜⊸CPU.X(⟜CPU.N⟜CPU.Z◿₂₅₆+₁)
INY ← ⍜⊸CPU.Y(⟜CPU.N⟜CPU.Z◿₂₅₆+₁)

AND ← ⍜⊙⊸CPU.A(⟜CPU.N⟜CPU.Z⍜∩⋯₈↧)
EOR ← ⍜⊙⊸CPU.A(⟜CPU.N⟜CPU.Z⍜∩⋯₈(⌵-))
ORA ← ⍜⊙⊸CPU.A(⟜CPU.N⟜CPU.Z⍜∩⋯₈↥)

ASL ← ⌝⊸Get⟜(⟜CPU.N⟜CPU.Z⍜⋯₈(⬚0↻₋₁⟜(°⊸CPU.Flags‥C⊣))⊸Get)
LSR ← ⌝⊸Get⟜(⟜CPU.N⟜CPU.Z⍜⋯₈(⬚0↻₁⟜(°⊸CPU.Flags‥C⊢))⊸Get)
ROL ← ⌝⊸Get⟜(⟜CPU.N⟜CPU.Z⍜⋯₈(
    ⬚∘↻₋₁⊃⋅CPU.Flags‥C⟜(°⊸CPU.Flags‥C⊣)
  )⊸Get)
ROR ← ⌝⊸Get⟜(⟜CPU.N⟜CPU.Z⍜⋯₈(
    ⬚∘↻₁⊃⋅CPU.Flags‥C⟜(°⊸CPU.Flags‥C⊢)
  )⊸Get)

ASLA ← °⊸CPU.A⟜CPU.N⟜CPU.Z⍜⋯₈(⬚0↻₋₁⟜(°⊸CPU.Flags‥C⊣))⊸CPU.A
LSRA ← °⊸CPU.A⟜CPU.N⟜CPU.Z⍜⋯₈(⬚0↻₁⟜(°⊸CPU.Flags‥C⊢))⊸CPU.A
ROLA ← °⊸CPU.A⟜CPU.N⟜CPU.Z⍜⋯₈(
  ⬚∘↻₋₁⊃⋅CPU.Flags‥C⟜(°⊸CPU.Flags‥C⊣)
)⊸CPU.A
RORA ← °⊸CPU.A⟜CPU.N⟜CPU.Z⍜⋯₈(
  ⬚∘↻₁⊃⋅CPU.Flags‥C⟜(°⊸CPU.Flags‥C⊢)
)⊸CPU.A

CMP ← °⊸⊃(CPU.Flags‥N|CPU.Flags‥Z|CPU.Flags‥C)⊃(⊣⋯₈◿₂₅₆-|=|≥)⊙⊸CPU.A
CPX ← °⊸⊃(CPU.Flags‥N|CPU.Flags‥Z|CPU.Flags‥C)⊃(⊣⋯₈◿₂₅₆-|=|≥)⊙⊸CPU.X
CPY ← °⊸⊃(CPU.Flags‥N|CPU.Flags‥Z|CPU.Flags‥C)⊃(⊣⋯₈◿₂₅₆-|=|≥)⊙⊸CPU.Y

ADC ← °⊸CPU.A˜˜⌞⟜CPU.V⊙⊙(⟜CPU.N⟜CPU.Z◿₂₅₆⟜CPU.C)⟜₂(++)⊸⊙(⊃CPU.A CPU.Flags‥C)
SBC ← ADC⍜⋯₈¬

CLC ← °⊸CPU.Flags‥C 0
CLD ← °⊸CPU.Flags‥D 0
CLI ← °⊸CPU.Flags‥I 0
CLV ← °⊸CPU.Flags‥V 0
SEC ← °⊸CPU.Flags‥C 1
SED ← °⊸CPU.Flags‥D 1
SEI ← °⊸CPU.Flags‥I 1

BCC ← ˜(⍥⍜CPU.PC+¬⊸CPU.Flags‥C)TC
BCS ← ˜(⍥⍜CPU.PC+⊸CPU.Flags‥C)TC
BNE ← ˜(⍥⍜CPU.PC+¬⊸CPU.Flags‥Z)TC
BEQ ← ˜(⍥⍜CPU.PC+⊸CPU.Flags‥Z)TC
BPL ← ˜(⍥⍜CPU.PC+¬⊸CPU.Flags‥N)TC
BMI ← ˜(⍥⍜CPU.PC+⊸CPU.Flags‥N)TC
BVC ← ˜(⍥⍜CPU.PC+¬⊸CPU.Flags‥V)TC
BVS ← ˜(⍥⍜CPU.PC+⊸CPU.Flags‥V)TC

JMP ← °⊸CPU.PC
JSR ← °⊸CPU.PC⊙(Stack⊙Stack°Addr-₁⊸CPU.PC)
RTS ← °⊸CPU.PC +₁Addr⊙°Stack°Stack

BRK ← °⊸CPU.PC Addr⊸∩⌟Get⊸-₁65535°⊸CPU.Flags‥I 1 Stack⊸CPU.Flags‥ToByte Stack⊙Stack°Addr+₁⊸CPU.PC
RTI ← °⊸CPU.PC Addr⊙°Stack°Stack°⊸CPU.Flags Flags.FromByte°Stack

BIT ← °⊸⊃(CPU.Flags‥N|CPU.Flags‥V)⊣₂⋯₈⟜(°⊸CPU.Flags‥Z=₀⍜∩⋯₈↧)⊙⊸CPU.A

NOP ← ∘

ILL  ← &p "Illegal op code"
TODO ← &p "Called TODO function"

Run ← (⨬(
    ⨬(I!BRK|I!IM!IDX‼CPU.X AB₂!AB!ORA|I!ILL|I!ILL|I!ILL|I!IM!AB!ORA|I!IM!ASL|I!ILL|I!PHP|I!IM!ORA|I!ASLA|I!ILL|I!ILL|I!IM₂!AB!ORA|I!IM₂!ASL|I!ILL)
  | ⨬(I!IM!BPL|I!IM!AB₂!IDX₂‼CPU.Y AB!ORA|I!ILL|I!ILL|I!ILL|I!IM!IDX‼CPU.X AB!ORA|I!IM!IDX‼CPU.X ASL|I!ILL|I!CLC|I!IM₂!IDX₂‼CPU.Y AB!ORA|I!ILL|I!ILL|I!ILL|I!IM₂!IDX₂‼CPU.X AB!ORA|I!IM₂!IDX₂‼CPU.X ASL|I!ILL)
  | ⨬(I!IM₂!JSR|I!IM!IDX‼CPU.X AB₂!AB!AND|I!ILL|I!ILL|I!IM!AB!BIT|I!IM!AB!AND|I!IM!ROL|I!ILL|I!PLP|I!IM!AND|I!ROLA|I!ILL|I!IM₂!AB!BIT|I!IM₂!AB!AND|I!IM₂!ROL|I!ILL)
  | ⨬(I!IM!BMI|I!IM!AB₂!IDX₂‼CPU.Y AB!AND|I!ILL|I!ILL|I!ILL|I!IM!IDX‼CPU.X AB!AND|I!IM!IDX‼CPU.X ROL|I!ILL|I!SEC|I!IM₂!IDX₂‼CPU.Y AB!AND|I!ILL|I!ILL|I!ILL|I!IM₂!IDX₂‼CPU.X AB!AND|I!IM₂!IDX₂‼CPU.X ROL|I!ILL)
  | ⨬(I!RTI|I!IM!IDX‼CPU.X AB₂!AB!EOR|I!ILL|I!ILL|I!ILL|I!IM!AB!EOR|I!IM!LSR|I!ILL|I!PHA|I!IM!EOR|I!LSRA|I!ILL|I!IM₂!JMP|I!IM₂!AB!EOR|I!IM₂!LSR|I!ILL)
  | ⨬(I!IM!BVC|I!IM!AB₂!IDX₂‼CPU.Y AB!EOR|I!ILL|I!ILL|I!ILL|I!IM!IDX‼CPU.X AB!EOR|I!IM!IDX‼CPU.X LSR|I!ILL|I!CLI|I!IM₂!IDX₂‼CPU.Y AB!EOR|I!ILL|I!ILL|I!ILL|I!IM₂!IDX₂‼CPU.X AB!EOR|I!IM₂!IDX₂‼CPU.X LSR|I!ILL)
  | ⨬(I!RTS|I!IM!IDX‼CPU.X AB₂!AB!ADC|I!ILL|I!ILL|I!ILL|I!IM!AB!ADC|I!IM!ROR|I!ILL|I!PLA|I!IM!ADC|I!RORA|I!ILL|I!IM₂!AB₂!JMP|I!IM₂!AB!ADC|I!IM₂!ROR|I!ILL)
  | ⨬(I!IM!BVS|I!IM!AB₂!IDX₂‼CPU.Y AB!ADC|I!ILL|I!ILL|I!ILL|I!IM!IDX‼CPU.X AB!ADC|I!IM!IDX‼CPU.X ROR|I!ILL|I!SEI|I!IM₂!IDX₂‼CPU.Y AB!ADC|I!ILL|I!ILL|I!ILL|I!IM₂!IDX₂‼CPU.X AB!ADC|I!IM₂!IDX₂‼CPU.X ROR|I!ILL)
  | ⨬(I!ILL|I!IM!IDX‼CPU.X AB₂!STA|I!ILL|I!ILL|I!IM!STY|I!IM!STA|I!IM!STX|I!ILL|I!DEY|I!ILL|I!TXA|I!ILL|I!IM₂!STY|I!IM₂!STA|I!IM₂!STX|I!ILL)
  | ⨬(I!IM!BCC|I!IM!AB₂!IDX₂‼CPU.Y STA|I!ILL|I!ILL|I!IM!IDX‼CPU.X STY|I!IM!IDX‼CPU.X STA|I!IM!IDX‼CPU.Y STX|I!ILL|I!TYA|I!IM₂!IDX₂‼CPU.Y STA|I!TXS|I!ILL|I!ILL|I!IM₂!IDX₂‼CPU.X STA|I!ILL|I!ILL)
  | ⨬(I!IM!LDY|I!IM!IDX‼CPU.X AB₂!AB!LDA|I!IM!LDX|I!ILL|I!IM!AB!LDY|I!IM!AB!LDA|I!IM!AB!LDX|I!ILL|I!TAY|I!IM!LDA|I!TAX|I!ILL|I!IM₂!AB!LDY|I!IM₂!AB!LDA|I!IM₂!AB!LDX|I!ILL)
  | ⨬(I!IM!BCS|I!IM!AB₂!IDX₂‼CPU.Y AB!LDA|I!ILL|I!ILL|I!IM!IDX‼CPU.X AB!LDY|I!IM!IDX‼CPU.X AB!LDA|I!IM!IDX‼CPU.Y AB!LDX|I!ILL|I!CLV|I!IM₂!IDX₂‼CPU.Y AB!LDA|I!TSX|I!ILL|I!IM₂!IDX₂‼CPU.X AB!LDY|I!IM₂!IDX₂‼CPU.X AB!LDA|I!IM₂!IDX₂‼CPU.Y AB!LDX|I!ILL)
  | ⨬(I!IM!CPY|I!IM!IDX‼CPU.X AB₂!AB!CMP|I!ILL|I!ILL|I!IM!AB!CPY|I!IM!AB!CMP|I!IM!DEC|I!ILL|I!INY|I!IM!CMP|I!DEX|I!ILL|I!IM₂!AB!CPY|I!IM₂!AB!CMP|I!IM₂!DEC|I!ILL)
  | ⨬(I!IM!BNE|I!IM!AB₂!IDX₂‼CPU.Y AB!CMP|I!ILL|I!ILL|I!ILL|I!IM!IDX‼CPU.X AB!CMP|I!IM!IDX‼CPU.X DEC|I!ILL|I!CLD|I!IM₂!IDX₂‼CPU.Y AB!CMP|I!ILL|I!ILL|I!ILL|I!IM₂!IDX₂‼CPU.X AB!CMP|I!IM₂!IDX₂‼CPU.X DEC|I!ILL)
  | ⨬(I!IM!CPX|I!IM!IDX‼CPU.X AB₂!AB!SBC|I!ILL|I!ILL|I!IM!AB!CPX|I!IM!AB!SBC|I!IM!INC|I!ILL|I!INX|I!IM!SBC|I!NOP|I!ILL|I!IM₂!AB!CPX|I!IM₂!AB!SBC|I!IM₂!INC|I!ILL)
  | ⨬(I!IM!BEQ|I!IM!AB₂!IDX₂‼CPU.Y AB!SBC|I!ILL|I!ILL|I!ILL|I!IM!IDX‼CPU.X AB!SBC|I!IM!IDX‼CPU.X INC|I!ILL|I!SED|I!IM₂!IDX₂‼CPU.Y AB!SBC|I!ILL|I!ILL|I!ILL|I!IM₂!IDX₂‼CPU.X AB!SBC|I!IM₂!IDX₂‼CPU.X INC|I!ILL)
  ) ⊃(⌊÷₁₆)◿₁₆⊸Get⊸CPU.PC)
