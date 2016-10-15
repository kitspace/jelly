all: jelly logo name ldr_image resistor


jelly: kicad/footprints/jelly.kicad_mod


logo: kicad/footprints/logo.kicad_mod


name: kicad/footprints/name.kicad_mod


ldr_image: kicad/footprints/ldr_image_flipped.kicad_mod


resistor:  kicad/footprints/resistor.kicad_mod



kicad/footprints/ldr_image_flipped.kicad_mod: kicad/footprints/ldr_image.kicad_mod
	sed 's/F.SilkS/B.SilkS/g' $< > $@


clean:
	rm -f kicad/footprints/name.kicad_mod
	rm -f kicad/footprints/logo.kicad_mod
	rm -f kicad/footprints/jelly.kicad_mod


kicad/footprints/%.kicad_mod: drawings/%.svg
	svg2mod -i $< -o $@ --format pretty --precision 0.4


.PHONY: all jelly logo name clean
