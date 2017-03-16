# This snippet has been shmelessly stol^Hborrowed from thestinger's repose Makefile
VERSION = 1.1
GIT_DESC=$(shell test -d .git && git describe --always 2>/dev/null)

ifneq "$(GIT_DESC)" ""
	VERSION=$(GIT_DESC)
endif

CC	?= gcc
CFLAGS += -Wall -std=c99 -Os -DVERSION="\"$(VERSION)\"" -I/usr/include/freetype2
LDFLAGS += -lxcb -lxcb-xinerama -lxcb-randr -lX11 -lX11-xcb -lXft -lfreetype -lz -lfontconfig
CFDEBUG = -g3 -pedantic -Wall -Wunused-parameter -Wlong-long \
          -Wsign-conversion -Wconversion -Wimplicit-function-declaration

EXEC = lemonbar
SRCS = lemonbar.c
OBJS = ${SRCS:.c=.o}

PREFIX?=/usr
BINDIR=${PREFIX}/bin

all: ${EXEC}

.c.o:
	${CC} ${CFLAGS} -o $@ -c $<

${EXEC}: ${OBJS}
	${CC} -o ${EXEC} ${OBJS} ${LDFLAGS}
