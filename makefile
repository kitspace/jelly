all:
	rm -f kicad/footprints/jelly.kicad_mod
	svg2mod -i drawings/jelly.svg -o kicad/footprints/jelly.kicad_mod --format pretty
