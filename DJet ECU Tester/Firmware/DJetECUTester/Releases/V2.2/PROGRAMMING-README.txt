DJET ECU TESTER PROGRAMMING
===========================

AA, June 2021

Note - the version of avrdude in this folder was taken from:

  https://github.com/mariusgreuel/avrdude/releases/download/v6.3.1.1-windows/avrdude-v6.3.1.1-windows.zip

1. Copy the firmware hex file into this folder.

2. Connect the tester board to your PC and find the COM port number using the Device Manager.

3. Open a command prompt (Windows key -> type "cmd" -> press Enter)

4. cd to this folder, e.g.

  cd C:\Users\me\Downloads\djetecufirmware

5. Enter and run:

  avrdude -p atmega328p -b 115200 -c arduino -P COM13 -e -v -U flash:w:djet-ecu-tester-firmware-r49.hex

changing the COM port and hex filename as needed.

6. Expected output:

avrdude: Version 6.3.1.1-windows
         Copyright (c) 2000-2005 Brian Dean, http://www.bdmicro.com/
         Copyright (c) 2007-2014 Joerg Wunsch

         System wide configuration file is "C:\Users\andy\Downloads\avrdude-v6.3.1.1-windows\avrdude.conf"

         Using Port                    : COM13
         Using Programmer              : arduino
         Overriding Baud Rate          : 115200
avrdude: Found device at port 'COM13'
         AVR Part                      : ATmega328P
         Chip Erase delay              : 9000 us
         PAGEL                         : PD7
         BS2                           : PC2
         RESET disposition             : dedicated
         RETRY pulse                   : SCK
         serial program mode           : yes
         parallel program mode         : yes
         Timeout                       : 200
         StabDelay                     : 100
         CmdexeDelay                   : 25
         SyncLoops                     : 32
         ByteDelay                     : 0
         PollIndex                     : 3
         PollValue                     : 0x53
         Memory Detail                 :

                                  Block Poll               Page                       Polled
           Memory Type Mode Delay Size  Indx Paged  Size   Size #Pages MinW  MaxW   ReadBack
           ----------- ---- ----- ----- ---- ------ ------ ---- ------ ----- ----- ---------
           eeprom        65    20     4    0 no       1024    4      0  3600  3600 0xff 0xff
           flash         65     6   128    0 yes     32768  128    256  4500  4500 0xff 0xff
           lfuse          0     0     0    0 no          1    0      0  4500  4500 0x00 0x00
           hfuse          0     0     0    0 no          1    0      0  4500  4500 0x00 0x00
           efuse          0     0     0    0 no          1    0      0  4500  4500 0x00 0x00
           lock           0     0     0    0 no          1    0      0  4500  4500 0x00 0x00
           calibration    0     0     0    0 no          1    0      0     0     0 0x00 0x00
           signature      0     0     0    0 no          3    0      0     0     0 0x00 0x00

         Programmer Type : Arduino
         Description     : Arduino
         Hardware Version: 3
         Firmware Version: 4.4
         Vtarget         : 0.3 V
         Varef           : 0.3 V
         Oscillator      : 28.800 kHz
         SCK period      : 3.3 us

avrdude: AVR device initialized and ready to accept instructions

Reading | ################################################## | 100% 0.01s

avrdude: Device signature = 0x1e950f (probably m328p)
avrdude: safemode: lfuse reads as 0
avrdude: safemode: hfuse reads as 0
avrdude: safemode: efuse reads as 0
avrdude: erasing chip
avrdude: reading input file "djet-ecu-tester-firmware-r49.hex"
avrdude: input file djet-ecu-tester-firmware-r49.hex auto detected as Intel Hex
avrdude: writing flash (12290 bytes):

Writing | ################################################## | 100% 4.65s

avrdude: 12290 bytes of flash written
avrdude: verifying flash memory against djet-ecu-tester-firmware-r49.hex:
avrdude: load data flash data from input file djet-ecu-tester-firmware-r49.hex:
avrdude: input file djet-ecu-tester-firmware-r49.hex auto detected as Intel Hex
avrdude: input file djet-ecu-tester-firmware-r49.hex contains 12290 bytes
avrdude: reading on-chip flash data:

Reading | ################################################## | 100% 4.16s

avrdude: verifying ...
avrdude: 12290 bytes of flash verified

avrdude: safemode: lfuse reads as 0
avrdude: safemode: hfuse reads as 0
avrdude: safemode: efuse reads as 0
avrdude: safemode: Fuses OK (E:00, H:00, L:00)

avrdude done.  Thank you.

