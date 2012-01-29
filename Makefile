CC=gcc
CFLAGS=-g -Wall
LDFLAGS=-lssl -lpthread
#SOURCES := $(shell find . -name '*.c')
SOURCES=common.c  sslthread.c
EXECUTABLES=$(SOURCES:%.c=%)

OBJ=$(SOURCES:.c=.o)
HEADERS=$(SOURCES:%.c=%.h)


objects: $(OBJ)

clean:
	rm $(EXECUTABLE) $(OBJ) client server
.o:  
	$(CC) $(CFLAGS) -c $*.c

client: client.c $(SOURCES) 
	$(CC) $(CFLAGS) $?  $(LDFLAGS)  -o $@
server: server.c $(SOURCES)
	$(CC) $(CFLAGS) $?  $(LDFLAGS)  -o $@
all: server client


