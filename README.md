Bare 6502 emulation logic can be found in [main.ua](main.ua). Currently, there's a check to make certain memory read-only, as Applesoft BASIC performs a series of write-tests to figure out how much RAM is available. If you want to do non-Apple \]\[ stuff, remove this check (it is in the STA command).

Apple \]\[ logic is in [apple2plus.ua](apple2plus.ua), and loads a ROM including Applesoft BASIC and the system monitor. The emulation runs in a separate thread from the graphics.

[Apple \]\[ ROM](apple2.rom) file from AppleWin via [this site](https://6502disassembly.com/a2-rom/), which also has a very thorough disassembly.
