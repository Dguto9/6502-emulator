# Experimental!
~ "main.ua" ~ Addr CPU Get Run
I ~ "gh: Marcos-cat/Iris"

┌─╴Display
  ~ {
    Monitor ← I.Texture.LoadImage˜↯0 480_480_3
    Vis ← I.Texture.LoadImage˜↯0 256_256_3
    Mode ← 0
  }
  DrawMonitor ← I.Texture.Draw⊙(600_600 0_0)°⊸I.Texture.Image⊙Monitor
  DrawVis     ← I.Draw.Texture⊙(600_600 600_0)°⊸I.Texture.Image⊙Vis
  FlipMode    ← ⍜Mode(◿₂+₁)
└─╴

DispTextScreen ← Display.DrawMonitor⍉×⌟Green⬚0↯480_480 layout20+@\0◿₁₂₈⊏⊏/⊂+⌟⇡3×₃⇡8↯∞_40▽<₁₂₀⊸◿₁₂₈°⊏↙⟜↘1024CPU.M
DispLRScreen   ← Display.DrawMonitor⍉×⌟Green≡▽12▽10÷15↯48_40≡⊂⊃(◿₁₆|⌊÷₁₆)⊏⊏/⊂+⌟⇡3×₃⇡8↯∞_40▽<₁₂₀⊸◿₁₂₈°⊏↙⟜↘1024CPU.M
DispVis        ← Display.DrawVis↯256_256_3⌝⊸⊡⊙Green⊙(⌝⊸⊡⊙Red)⊃(+₂₅₆CPU.S|CPU.PC|÷256⍉˙⊟₃CPU.M)
Keyboard       ← (-@\0I.Rayua.GetCharPressed)

FormattedTime ← ($"_\__"⊓/$"_\__"/$"_:_"⊃↙↘3 datetime now)
SaveState     ← &p$"_ _""Saved state:"⟜&fwa ⍣(⊡1&args|$"saves/_.cpu"FormattedTime) compress"deflate"binary

Emulate ← ⍥(⍣(⊸send0⌝⊸Get49152tryrecv0|∘)Run)∞

I.Open 1200_600 "Emulator"

Display

⍣(°binary⌝compress"deflate"&frab ⊡2&args
| ⊂⊚⋕₁₆"D000"↘8192&frab"apple2.rom"
  CPU 0
  °⊸CPU.PC Addr⊸∩⌟(Get⋕₁₆) "FFFC" "FFFD"
  ⌝⊸Get 64680 96
)

spawn(Emulate)
I.Loop!(
  ◡(⟜⊃(⨬(DispTextScreen|DispLRScreen)◡⋅Display.Mode) DispVis recv)⟜send⊙0
  ⍡(⋅⊙Display.FlipMode⍩°258|⊙∘SaveState⍩°344|⊸˜send+₁₂₈13◌⍩°257|⊸˜send+₁₂₈8◌⍩°263|⋅⋅⊙∘)I.Rayua.GetKeyPressed
  ⨬(⊸˜send+₁₂₈◿₁₂₈|◌)⊸=₀Keyboard
)
