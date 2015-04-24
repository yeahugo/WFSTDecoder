CC = g++
CFLAG = -Wall -g -O2

INC = -I. -I./loaddata
LIB = -lpthread

SRC_EXT = c
SRCS = $(wildcard *.c)
SRCS += $(wildcard loaddata/*.c)
OBJS = $(patsubst %.c, %.o, $(SRCS))

TARGET = wfstdecoder

$(TARGET):$(OBJS)
	$(CC) $(OBJS) $(LIB) -o $@
%.o : %.c
	$(CC) $(INC) $(CFLAG) -c $< -o $@

clean:
	rm -f $(OBJS) $(TARGET)
	rm -f core*
