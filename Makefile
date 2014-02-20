SOURCES = $(shell find src -type f -name \*.erl)

all: images

beams:
	# Can't rebuild things twice???
	rm -fr ebin
	mkdir -p ebin
	erlc -o ebin/ -pa ebin $(SOURCES)

release: beams
	rm -fr _rel
	mkdir -p _rel/releases/1.0
	cd ebin && erl -noshell -s see make_scripts
	cp ebin/see.boot _rel/releases/1.0
	cp config/vm.args _rel/releases/1.0
	touch _rel/releases/1.0/sys.config
	mkdir -p _rel/lib/see-1.0/ebin
	cp ebin/*.beam _rel/lib/see-1.0/ebin

images: release
	$(NERVES_ROOT)/scripts/rel2fw.sh _rel

clean:
	rm -fr _rel ebin _images
