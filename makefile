all: $(patsubst drawings/%.svg, kicad/footprints/%.kicad_mod, $(wildcard drawings/*.svg)) flipped


flipped: kicad/footprints/ldr_image_flipped.kicad_mod kicad/footprints/page_motor_image_flipped.kicad_mod


kicad/footprints/%_flipped.kicad_mod: kicad/footprints/%.kicad_mod
	sed 's/F.SilkS/B.SilkS/g' $< > $@


kicad/footprints/%.kicad_mod: drawings/%.svg
	svg2mod -i $< -o $@ --format pretty --precision 0.4


.PHONY: all flipped
