all: lib

lib:
	mkdir -p js/Control/
	psc src/Control/Arrow.purs.hs \
	  -o js/Control/Arrow.js \
	  -e js/Control/Arrow.e.purs.hs \
	  --module Control.Arrow
