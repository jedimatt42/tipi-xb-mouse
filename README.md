# TIPI XB Mouse

TIPI Extended BASIC mouse driver compatible with Mechatronics Mouse interface

[Mechatronics Documentation](http://ftp.whtech.com/datasheets%20and%20manuals/Hardware/Mechatronic/Mechatronic%20Mouse.pdf)

## API

CALL INIT::CALL LOAD("TIPI.TMOUSE/O")

CALL LINK("MOUSE0") 
- Will block until mouse button 1 is pressed. A subsequent
  CALL PEEK(10000,VPOS,HPOS) will read location data.
  MKEY will be 255.

CALL LINK("MOUSE1")
- Install an interupt service routine to update the mouse location and
  button status. 
  Control flow returns to the calling XB
  program. Subsequent CALL PEEK(10000,VPOS,HPOS,MKEY) calls will
  provide the updated status. 

CALL LINK("MCLR")
- Uninstalls the interrupt service routine.

CALL LOAD(10003,VHOME,HHOME)
- stores the value of VHOME and HHOME in address 10003 and 10004. The
  driver will move the pointer to this position if second mouse button
  is pressed.

CALL LOAD(10005,LEFT,RIGHT,TOP,BOTTOM)
- stores a bounding box to contain the pointer.

## Notes

You should use CALL LOAD to set VHOME, HHOME, LEFT, RIGHT, TOP and BOTTOM
limits before using CALL LINK to execute the routines. 

You should also CALL LOAD to set VPOS, HPOS, and MKEY to avoid initial 
jumps of the mouse.

## Building

With xdt99 suite on your path:

```
make clean
make
```

This will produce a tmouse.o file in TIFILES format. It is a DIS/FIX 80, 
non-compressed, relocatable object file that can be loaded in XB or other
compatible BASICs for the TI-99/4A.