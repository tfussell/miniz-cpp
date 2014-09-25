CC = clang
CXX = clang++

WARN = -Werror -Wall -Wextra -pedantic -Weverything -Wno-c++98-compat -Wno-c++98-compat-pedantic -Wno-padded
DEBUG = -g
CFLAGS = $(DEBUG) -std=c11
CPPFLAGS = $(DEBUG) -std=c++1y $(WARN)

.PHONY: all clean

all: test pipe read write

test: test.o zip_file.o miniz.o
	$(CXX) $(CPPFLAGS) -o test test.o zip_file.o miniz.o

pipe: pipe.o zip_file.o miniz.o
	$(CXX) $(CPPFLAGS) -o pipe pipe.o zip_file.o miniz.o

read: read.o zip_file.o miniz.o
	$(CXX) $(CPPFLAGS) -o read read.o zip_file.o miniz.o

write: write.o zip_file.o miniz.o
	$(CXX) $(CPPFLAGS) -o write write.o zip_file.o miniz.o

test.o: test.cpp
	$(CXX) $(CPPFLAGS) -o test.o -c test.cpp

pipe.o: pipe.cpp
	$(CXX) $(CPPFLAGS) -o pipe.o -c pipe.cpp

read.o: read.cpp
	$(CXX) $(CPPFLAGS) -o read.o -c read.cpp

write.o: write.cpp
	$(CXX) $(CPPFLAGS) -o write.o -c write.cpp

zip_file.o: zip_file.cpp
	$(CXX) $(CPPFLAGS) -o zip_file.o -c zip_file.cpp

miniz.o: miniz.c
	$(CC) $(CFLAGS) -o miniz.o -c miniz.c

clean:
	@rm -f *.o *~ test pipe read write