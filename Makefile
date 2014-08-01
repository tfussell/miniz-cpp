
INCLUDE = -I../
CFLAGS = -ggdb $(INCLUDE) -std=c11 -Werror -Wall -Wextra -pedantic
CPPFLAGS = -ggdb $(INCLUDE) -std=c++11 -Werror -Wall -Wextra -pedantic

.PHONY: all clean

all: test pipe read write

test: test.o zip_file.o miniz.o
	g++ $(CPPFLAGS) -o test test.o zip_file.o miniz.o

pipe: pipe.o zip_file.o miniz.o
	g++ $(CPPFLAGS) -o pipe pipe.o zip_file.o miniz.o

read: read.o zip_file.o miniz.o
	g++ $(CPPFLAGS) -o read read.o zip_file.o miniz.o

write: write.o zip_file.o miniz.o
	g++ $(CPPFLAGS) -o write write.o zip_file.o miniz.o

test.o: test.cpp
	g++ $(CPPFLAGS) -o test.o -c test.cpp

pipe.o: pipe.cpp
	g++ $(CPPFLAGS) -o pipe.o -c pipe.cpp

read.o: read.cpp
	g++ $(CPPFLAGS) -o read.o -c read.cpp

write.o: write.cpp
	g++ $(CPPFLAGS) -o write.o -c write.cpp

zip_file.o: zip_file.cpp
	g++ $(CPPFLAGS) -o zip_file.o -c zip_file.cpp

miniz.o: miniz.c
	gcc $(CFLAGS) -o miniz.o -c miniz.c

clean:
	@rm -f *.o *~ test pipe read write