CC=gcc
CFLAGS=-l.

 ta: ta.o
	$(CC) -o ta ta.o -lpthread

 
clean: 
	rm ta.o ta 



