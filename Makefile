
XAS=xas99.py
XDM=xdm99.py

all: tmouse.o

clean:
	rm -f *.obj
	rm -f *.o

%.obj: %.a99
	$(XAS) -R -o $@ $<

%.o: %.obj
	$(XDM) --to-fiad $< -t -f DIS/FIX80 -o $@


