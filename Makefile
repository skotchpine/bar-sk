CC	= cc
CFLAGS += -Wall -std=c99 -Os -DVERSION="\"$(VERSION)\"" -I/usr/include/freetype2
LDFLAGS += -lxcb -lxcb-xinerama -lxcb-randr -lX11 -lX11-xcb -lXft -lfreetype -lz -lfontconfig
CFDEBUG = -g3 -pedantic -Wall -Wunused-parameter -Wlong-long \
          -Wsign-conversion -Wconversion -Wimplicit-function-declaration

SRCS = lemonbar.c
OBJS = ${SRCS:.c=.o}

all: lemonbar

lemonbar: ${OBJS}
	@echo CC -o $@
	@${CC} -o $@ ${OBJS} ${LDFLAGS}

install:
	mkdir -p $(DESTDIR)$(PREFIX)/bin/
	cp -f lemonbar $(DESTDIR)$(PREFIX)/bin/

clean:
	rm -f lemonbar lemonbar.o

