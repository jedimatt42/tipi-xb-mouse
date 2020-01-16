# TIPI XB Mouse

TIPI Extended BASIC mouse driver compatible with Mechatronics Mouse interface

[Mechatronics Documentation](http://ftp.whtech.com/datasheets%20and%20manuals/Hardware/Mechatronic/Mechatronic%20Mouse.pdf)

## Binary

Latest build can be found in github releases:

[releases](https://github.com/jedimatt42/tipi-xb-mouse/releases)

## API

CALL INIT::CALL LOAD("TIPI.TMOUSE/O")

CALL LINK("MOUSE0") 
- Will block until mouse button 1 is pressed. A subsequent CALL PEEK(10000,VPOS,HPOS) will read location data. MKEY will be 255.

CALL LINK("MOUSE1")
- Install an interupt service routine to update the mouse location and button status. Control flow returns to the calling XB program. Subsequent CALL PEEK(10000,VPOS,HPOS,MKEY) calls will provide the updated status. 

CALL LINK("MCLR")
- Uninstalls the interrupt service routine.

CALL LOAD(10003,VHOME,HHOME)
- stores the value of VHOME and HHOME in address 10003 and 10004. The driver will move the pointer to this position if second mouse button is pressed.

CALL LOAD(10005,LEFT,RIGHT,TOP,BOTTOM)
- stores a bounding box to contain the pointer.

## Notes

The Mechatronics driver claims to load into 0x2710 - 0x28C3 ( about 355 bytes ). This TIPI driver is relocatable, but uses the addresses 0x2710 - 0x2719 to preserve the same 'mailbox' communication addresses through CALL LOAD and CALL PEEK.

## Building

With xdt99 suite on your path:

```
make clean
make
```

This will produce a tmouse.o file in TIFILES format. It is a DIS/FIX 80, non-compressed, relocatable object file that can be loaded in XB or other compatible BASICs for the TI-99/4A.