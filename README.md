## Apple ][ Emulation
To run the emulator:
```
uiua run apple2plus.ua [save_filepath] [load_filepath]  
```
Both save and load arguments are optional. Without save path, it will generate a unique save name. Without load path, it will default to a blank Apple \]\[ ROM. Specifiying a load path requires specifying a save path.

While the emulator is running, pressing the right shift button will save the emulator state to the specified file path.

To toggle between text and low-res graphics mode (I have not implemented hi-res, split, or color modes), press tab.

### Using the Apple ][ (Plus)
The Apple \]\[ Plus boots into Applesoft BASIC. From here, BASIC commands can be used to interact with the computer, and can be strung into programs. I found [this](https://www.calormen.com/jsbasic/reference.html) list of commands helpful. Here are some basics:
- To run a command immediately, type it out and hit enter
- To add a line to a program, type it after a line number, and hit enter
- To see your program, use "LIST"
- To run your program, use "RUN"

### Mandelbrot
To run the Mandelbrot generator, run
```
uiua run apple2plus.ua demo/mandelbrot.cpu demo/mandelbrot.cpu
```
then type "RUN", hit enter, and press tab to switch to lo-res graphics mode.

## Project Structure/Credits
Bare 6502 emulation logic can be found in [main.ua](main.ua). Currently, there's a check to make certain memory read-only, as Applesoft BASIC performs a series of write-tests to figure out how much RAM is available. If you want to do non-Apple \]\[ stuff, remove this check (it is in the STA command).

Apple \]\[ logic is in [apple2plus.ua](apple2plus.ua), and loads a ROM including Applesoft BASIC and the system monitor. The emulation runs in a separate thread from the graphics.

The [Apple \]\[ ROM](apple2.rom) file is from AppleWin via [this site](https://6502disassembly.com/a2-rom/), which also has a very thorough disassembly.

