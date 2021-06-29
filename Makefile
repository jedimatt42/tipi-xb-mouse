
XAS=xas99.py
XDM=xdm99.py

all: tmouse.o tmororg.o

clean:
	rm -f *.obj
	rm -f *.o
	rm -f *.lst

%.obj: %.a99
	$(XAS) -R -L $(patsubst %.obj,%.lst,$@) -o $@ $<

%.o: %.obj
	$(XDM) --to-fiad $< -t -f DIS/FIX80 -o $@


