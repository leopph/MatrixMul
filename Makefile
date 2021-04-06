bin := run
IDIR := src/include
CPPFLAGS := -I$(IDIR)
CFLAGS := -m32
LDFLAGS := -static

all: $(bin)

$(bin): src/main.c src/matrix_print.c src/matrix_mul.S
	$(CC) $(CPPFLAGS) $(CFLAGS) $(LDFLAGS) -o $@ $^

clean:
	rm -rf $(bin)