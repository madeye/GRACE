usertrigger.so: pbzip2trigger.c
	gcc -fPIC -shared pbzip2trigger.c -o $@ -I../../bin/include ../../bin/lib/libcm-util.a
clean:
	rm -rf usertrigger.so
