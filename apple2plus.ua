# Experimental!
~ "main.ua" ~ Addr CPU Get Run
I ~ "gh: Marcos-cat/Iris"

Disp     ← I.Texture.Draw⊙(480_480 0_0)°⊸I.Texture.Image layout10+×₃₂⊸=@\0+@\0◿₁₂₈⊏⊏/⊂+⌟⇡3×₃⇡8↯∞_40▽<₁₂₀⊸◿₁₂₈°⊏↙⟜↘1024CPU.M
Keyboard ← (⍡(8⍩°263|13⍩°257|43⍩°96|34⍩°39|58⍩°59|∘)I.Rayua.GetKeyPressed)

I.Open 480_480 "Emulator"
I.Texture.LoadImage˜↯0 ˙⊟240

⊂⊚⋕₁₆"D000"↘8192&frab"APPLE2.ROM"

CPU 0
°⊸CPU.PC Addr⊸∩⌟(Get⋕₁₆) "FFFC" "FFFD"
⌝⊸Get 64680 96

I.Loop!(
  ⍥Run500
  ⍥(Run)×₁₀₀₀₀I.Mouse.Pressed I.Mouse.Right
  ⨬(◌∘|⌝⊸Get49152+₁₂₈◿₁₂₈)⊸≠₀Keyboard
  ◡Disp
)
