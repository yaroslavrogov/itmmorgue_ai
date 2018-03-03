CC = gcc
CFLAGS = --std=gnu99 -pedantic -Wall -Wextra -Werror -ggdb3 -DDEBUG
LIBS = -lncursesw
INCS = -I /usr/include/ncursesw

HDRS = $(wildcard *.h)
SRCS = main.c squaere.c entity.c movement.c common.c chunk.c
OBJS = $(SRCS:.c=.o)

TARGET = main

all: $(TARGET)

$(TARGET): $(OBJS)
	$(CC) $^ $(CFLAGS) $(LIBS) $(INCS) -o $@

%.o: %.c $(HDRS)
	$(CC) -c $< $(CFLAGS) $(LIBS) $(INCS) -o $@

clean:
	$(RM) $(OBJS) $(TARGET)

todo:
	@echo
	@grep -i TODO $(SRCS) $(HDRS)
	@echo
