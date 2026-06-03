# Experimental!
~ "main.ua" ~ Addr CPU Get Run
I ~ "gh: Marcos-cat/Iris"

DispScreen ← I.Texture.Draw⊙(600_600 0_0)°⊸I.Texture.Image layout20+×₃₂⊸=@\0+@\0◿₁₂₈⊏⊏/⊂+⌟⇡3×₃⇡8↯∞_40▽<₁₂₀⊸◿₁₂₈°⊏↙⟜↘1024CPU.M
DispVis    ← I.Draw.Texture⊙(600_600 600_0) °⊸I.Texture.Image↯256_256_3⌝⊸⊡⊙Green⊙(⌝⊸⊡⊙Red)⊃(+₂₅₆CPU.S|CPU.PC|÷256⍉˙⊟₃CPU.M)
Keyboard   ← (⍡(8⍩°263|13⍩°257|43⍩°96|34⍩°39|58⍩°59|∘)I.Rayua.GetKeyPressed)

Emulate ← ⍥(⍣(⊸send0⌝⊸Get49152tryrecv0|∘)Run)∞

I.Open 1200_600 "Emulator"
I.Texture.LoadImage˜↯0 ˙⊟480
I.Texture.LoadImage˜↯0 256_256_3

⊂⊚⋕₁₆"D000"↘8192&frab"APPLE2.ROM"

CPU 0
°⊸CPU.PC Addr⊸∩⌟(Get⋕₁₆) "FFFC" "FFFD"
⌝⊸Get 64680 96

spawn(Emulate)

I.Loop!(
  ◡(DispScreen⟜DispVis recv)⟜send⊙1
  ⨬(◌∘|⊸˜send+₁₂₈◿₁₂₈)⊸≠₀Keyboard
)
