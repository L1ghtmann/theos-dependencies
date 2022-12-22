build:
	cd legacy/ && make clean package FINALPACKAGE=1
	cd current/ && make clean package FINALPACKAGE=1

PKGS = $(wildcard **/packages/*.deb)

copy:
	mkdir -p debs/
	cp $(PKGS) debs/

all : build copy

clean:
	rm -rf debs/ legacy/packages/ current/packages/

fresh: clean all

.PHONY: build copy all clean fresh
