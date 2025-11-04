all: json.cpp block_allocator.cpp
	clang $(CVMFS_BASE_CXX_FLAGS) --target=aarch64-linux-android24 -I. -fPIC -c -o json.o json.cpp
	clang $(CVMFS_BASE_CXX_FLAGS) --target=aarch64-linux-android24 -I. -fPIC -c -o block_allocator.o block_allocator.cpp
	ar cru libvjson.a json.o block_allocator.o
	ranlib libvjson.a

clean:
	rm -f *.o
	rm -f libvjson.a

