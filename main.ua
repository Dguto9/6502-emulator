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
  FromByte ← ▽1_1_1_1_0_0_1_1⋯
└─╴

┌─╴CPU
  ~ {
    A ← 0
    PC ← 0
    S ← ⋕₁₆"01FF"
    X ← 0
    Y ← 0
    Flags ← Flags
    M ← ⬚0°⊸△+⊙⊸⧻
  }
  Z ← °⊸Flags‥Z=0
  N ← °⊸Flags‥N=1⊣⋯₈
  C ← °⊸Flags‥C↥⊃(>255|<0)
  V ←
└─╴

Addr  ← ⌅(+⊙×₂₅₆|⊃◿₂₅₆(⌊÷₂₅₆))
TC    ← ⍜+₁₂₈◿₂₅₆
Get   ← ⊡⊙CPU.M
Stack ← ⌅(⍜CPU.S-₁⌝⊸Get⊙⊸CPU.S|⊸Get⊸CPU.S⍜CPU.S+₁)
I!    ← ^⍜CPU.PC+₁
IM!   ← ^⊙⍜CPU.PC+₁⊡⊸⊃(CPU.PC|CPU.M)
IM₂!  ← ^⊙⍜CPU.PC+₂Addr∩⌟⊡⊸⊃(⟜+₁CPU.PC|CPU.M)
AB!   ← ^⊸Get
AB₂!  ← ^Addr⊸∩⌟Get⟜+₁
IDX‼  ← ^1+⊙⊸^0

LDA ← °⊸CPU.A⟜CPU.N⟜CPU.Z
LDX ← °⊸CPU.X⟜CPU.N⟜CPU.Z
LDY ← °⊸CPU.Y⟜CPU.N⟜CPU.Z
STA ← ⌝⊸Get⊙⊸CPU.A
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

ASLA ← °⊸CPU.A⟜(⟜CPU.N⟜CPU.Z⍜⋯₈(⬚0↻₋₁⟜(°⊸CPU.Flags‥C⊣))⊸CPU.A)
LSRA ← °⊸CPU.A⟜(⟜CPU.N⟜CPU.Z⍜⋯₈(⬚0↻₁⟜(°⊸CPU.Flags‥C⊢))⊸CPU.A)
ROLA ← °⊸CPU.A⟜(⟜CPU.N⟜CPU.Z⍜⋯₈(
  ⬚∘↻₋₁⊃⋅CPU.Flags‥C⟜(°⊸CPU.Flags‥C⊣)
  )⊸CPU.A)
RORA ← °⊸CPU.A⟜(⟜CPU.N⟜CPU.Z⍜⋯₈(
  ⬚∘↻₁⊃⋅CPU.Flags‥C⟜(°⊸CPU.Flags‥C⊢)
  )⊸CPU.A)

CMP ← °⊸⊃(CPU.Flags‥N|CPU.Flags‥Z|CPU.Flags‥C)⊃(⊣⋯◿₂₅₆-|=|≥)⊙⊸CPU.A
CPX ← °⊸⊃(CPU.Flags‥N|CPU.Flags‥Z|CPU.Flags‥C)⊃(⊣⋯◿₂₅₆-|=|≥)⊙⊸CPU.X
CPY ← °⊸⊃(CPU.Flags‥N|CPU.Flags‥Z|CPU.Flags‥C)⊃(⊣⋯◿₂₅₆-|=|≥)⊙⊸CPU.Y

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
JSR ← °⊸CPU.PC⊙(Stack⊙Stack°Addr⊸CPU.PC)
RTS ← °⊸CPU.PC Addr⊙°Stack°Stack

NOP ← ∘

ILL  ← &p "Illegal op code"
TODO ← &p "Called TODO function"

Run ← ⍡(
  ⍡(I!TODO⍩°0|I!IM!IDX‼CPU.X AB₂!AB!ORA⍩°1|I!ILL⍩°2|I!ILL⍩°3|I!ILL⍩°4|I!IM!AB!ORA⍩°5|I!IM!ASL⍩°6|I!ILL⍩°7|I!PHP⍩°8|I!IM!ORA⍩°9|I!TODO⍩°10|I!ILL⍩°11|I!ILL⍩°12|I!IM₂!AB!ORA⍩°13|I!IM₂!ASL⍩°14|I!ILL⍩°15)⍩°0
| ⍡(I!IM!BPL⍩°0|I!IM!AB₂!IDX‼CPU.Y AB!ORA⍩°1|I!ILL⍩°2|I!ILL⍩°3|I!ILL⍩°4|I!IM!IDX‼CPU.X AB!ORA⍩°5|I!IM!IDX‼CPU.X ASL⍩°6|I!ILL⍩°7|I!CLC⍩°8|I!IM₂!IDX‼CPU.Y AB!ORA⍩°9|I!ILL⍩°10|I!ILL⍩°11|I!ILL⍩°12|I!IM₂!IDX‼CPU.X AB!ORA⍩°13|I!IM₂!IDX‼CPU.X ASL⍩°14|I!ILL⍩°15)⍩°1
| ⍡(I!IM₂!JSR⍩°0|I!IM!IDX‼CPU.X AB₂!AB!AND⍩°1|I!ILL⍩°2|I!ILL⍩°3|I!TODO⍩°4|I!IM!AB!AND⍩°5|I!IM!ROL⍩°6|I!ILL⍩°7|I!PLP⍩°8|I!IM!AND⍩°9|I!TODO⍩°10|I!ILL⍩°11|I!TODO⍩°12|I!IM₂!AB!AND⍩°13|I!IM₂!ROL⍩°14|I!ILL⍩°15)⍩°2
| ⍡(I!IM!BMI⍩°0|I!IM!AB₂!IDX‼CPU.Y AB!AND⍩°1|I!ILL⍩°2|I!ILL⍩°3|I!ILL⍩°4|I!IM!IDX‼CPU.X AB!AND⍩°5|I!IM!IDX‼CPU.X ROL⍩°6|I!ILL⍩°7|I!SEC⍩°8|I!IM₂!IDX‼CPU.Y AB!AND⍩°9|I!ILL⍩°10|I!ILL⍩°11|I!ILL⍩°12|I!IM₂!IDX‼CPU.X AB!AND⍩°13|I!IM₂!IDX‼CPU.X ROL⍩°14|I!ILL⍩°15)⍩°3
| ⍡(I!TODO⍩°0|I!IM!IDX‼CPU.X AB₂!AB!EOR⍩°1|I!ILL⍩°2|I!ILL⍩°3|I!ILL⍩°4|I!IM!AB!EOR⍩°5|I!IM!LSR⍩°6|I!ILL⍩°7|I!PHA⍩°8|I!IM!EOR⍩°9|I!TODO⍩°10|I!ILL⍩°11|I!IM₂!JMP⍩°12|I!IM₂!AB!EOR⍩°13|I!IM₂!LSR⍩°14|I!ILL⍩°15)⍩°4
| ⍡(I!IM!BVC⍩°0|I!IM!AB₂!IDX‼CPU.Y AB!EOR⍩°1|I!ILL⍩°2|I!ILL⍩°3|I!ILL⍩°4|I!IM!IDX‼CPU.X AB!EOR⍩°5|I!IM!IDX‼CPU.X LSR⍩°6|I!ILL⍩°7|I!CLI⍩°8|I!IM₂!IDX‼CPU.Y AB!EOR⍩°9|I!ILL⍩°10|I!ILL⍩°11|I!ILL⍩°12|I!IM₂!IDX‼CPU.X AB!EOR⍩°13|I!IM₂!IDX‼CPU.X LSR⍩°14|I!ILL⍩°15)⍩°5
| ⍡(I!RTS⍩°0|I!TODO⍩°1|I!ILL⍩°2|I!ILL⍩°3|I!ILL⍩°4|I!TODO⍩°5|I!IM!ROR⍩°6|I!ILL⍩°7|I!PLA⍩°8|I!TODO⍩°9|I!TODO⍩°10|I!ILL⍩°11|I!IM₂!AB₂!JMP⍩°12|I!TODO⍩°13|I!IM₂!ROR⍩°14|I!ILL⍩°15)⍩°6
| ⍡(I!IM!BVS⍩°0|I!TODO⍩°1|I!ILL⍩°2|I!ILL⍩°3|I!ILL⍩°4|I!TODO⍩°5|I!IM!IDX‼CPU.X ROR⍩°6|I!ILL⍩°7|I!SEI⍩°8|I!TODO⍩°9|I!ILL⍩°10|I!ILL⍩°11|I!ILL⍩°12|I!TODO⍩°13|I!IM₂!IDX‼CPU.X ROR⍩°14|I!ILL⍩°15)⍩°7
| ⍡(I!ILL⍩°0|I!IM!IDX‼CPU.X AB₂!STA⍩°1|I!ILL⍩°2|I!ILL⍩°3|I!IM!STY⍩°4|I!IM!STA⍩°5|I!IM!STX⍩°6|I!ILL⍩°7|I!DEY⍩°8|I!ILL⍩°9|I!TXA⍩°10|I!ILL⍩°11|I!IM₂!STY⍩°12|I!IM₂!STA⍩°13|I!IM₂!STX⍩°14|I!ILL⍩°15)⍩°8
| ⍡(I!IM!BCC⍩°0|I!IM!AB₂!IDX‼CPU.Y STA⍩°1|I!ILL⍩°2|I!ILL⍩°3|I!IM!IDX‼CPU.X STY⍩°4|I!IM!IDX‼CPU.X STA⍩°5|I!IM!IDX‼CPU.Y STX⍩°6|I!ILL⍩°7|I!TYA⍩°8|I!IM₂!IDX‼CPU.Y STA⍩°9|I!TXS⍩°10|I!ILL⍩°11|I!ILL⍩°12|I!IM₂!IDX‼CPU.X STA⍩°13|I!ILL⍩°14|I!ILL⍩°15)⍩°9
| ⍡(I!IM!LDY⍩°0|I!IM!IDX‼CPU.X AB₂!AB!LDA⍩°1|I!IM!LDX⍩°2|I!ILL⍩°3|I!IM!AB!LDY⍩°4|I!IM!AB!LDA⍩°5|I!IM!AB!LDX⍩°6|I!ILL⍩°7|I!TAY⍩°8|I!IM!LDA⍩°9|I!TAX⍩°10|I!ILL⍩°11|I!IM₂!AB!LDY⍩°12|I!IM₂!AB!LDA⍩°13|I!IM₂!AB!LDX⍩°14|I!ILL⍩°15)⍩°10
| ⍡(I!IM!BCS⍩°0|I!IM!AB₂!IDX‼CPU.Y AB!LDA⍩°1|I!ILL⍩°2|I!ILL⍩°3|I!IM!IDX‼CPU.X AB!LDY⍩°4|I!IM!IDX‼CPU.X AB!LDA⍩°5|I!IM!IDX‼CPU.Y AB!LDX⍩°6|I!ILL⍩°7|I!CLV⍩°8|I!IM₂!IDX‼CPU.Y AB!LDA⍩°9|I!TSX⍩°10|I!ILL⍩°11|I!IM₂!IDX‼CPU.X AB!LDY⍩°12|I!IM₂!IDX‼CPU.X AB!LDA⍩°13|I!IM₂!IDX‼CPU.Y AB!LDX⍩°14|I!ILL⍩°15)⍩°11
| ⍡(I!IM!CPY⍩°0|I!IM!IDX‼CPU.X AB₂!AB!CMP⍩°1|I!ILL⍩°2|I!ILL⍩°3|I!IM!AB!CPY⍩°4|I!TODO⍩°5|I!IM!DEC⍩°6|I!ILL⍩°7|I!INY⍩°8|I!TODO⍩°9|I!DEX⍩°10|I!ILL⍩°11|I!IM₂!AB!CPX⍩°12|I!TODO⍩°13|I!IM₂!DEC⍩°14|I!ILL⍩°15)⍩°12
| ⍡(I!IM!BNE⍩°0|I!IM!AB₂!IDX‼CPU.Y AB!CMP⍩°1|I!ILL⍩°2|I!ILL⍩°3|I!ILL⍩°4|I!TODO⍩°5|I!IM!IDX‼CPU.X DEC⍩°6|I!ILL⍩°7|I!CLD⍩°8|I!TODO⍩°9|I!ILL⍩°10|I!ILL⍩°11|I!ILL⍩°12|I!TODO⍩°13|I!IM₂!IDX‼CPU.X DEC⍩°14|I!ILL⍩°15)⍩°13
| ⍡(I!IM!CPX⍩°0|I!TODO⍩°1|I!ILL⍩°2|I!ILL⍩°3|I!IM!AB!CPX⍩°4|I!TODO⍩°5|I!IM!INC⍩°6|I!ILL⍩°7|I!INX⍩°8|I!TODO⍩°9|I!NOP⍩°10|I!ILL⍩°11|I!IM₂!AB!CPY⍩°12|I!TODO⍩°13|I!IM₂!INC⍩°14|I!ILL⍩°15)⍩°14
| ⍡(I!IM!BEQ⍩°0|I!TODO⍩°1|I!ILL⍩°2|I!ILL⍩°3|I!ILL⍩°4|I!TODO⍩°5|I!IM!IDX‼CPU.X INC⍩°6|I!ILL⍩°7|I!SED⍩°8|I!TODO⍩°9|I!ILL⍩°10|I!ILL⍩°11|I!ILL⍩°12|I!TODO⍩°13|I!IM₂!IDX‼CPU.X INC⍩°14|I!ILL⍩°15)⍩°15
)

# CPU 512 [0 254 0 5 0 0 1 0 127 0 11 255 11 0 1 0 0]
# # ⍜CPU.M(⌝⊸⊡257 55)
# ⍜CPU.M(⌝⊸⊡255 23)
# °⊸CPU.X 1
# I!ZAB‼⊸CPU.X LDA
# I!IM₂!STA
# I!IM!DEC
# I!IM!AND
# I!IM!ASL
# I!IM!ROL
# I!IM!BCS
