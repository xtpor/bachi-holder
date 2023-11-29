.PHONY: all clean

all: bachi-holder-2x1.stl bachi-holder-2x2.stl bachi-holder-2x4.stl bachi-holder-2x6.stl bachi-holder-2x8.stl

clean:
	rm *.stl

bachi-holder-2x1.stl: bachi-holder.scad
	openscad -o $@ -D 'gridx=2' -D 'gridy=1' bachi-holder.scad

bachi-holder-2x2.stl: bachi-holder.scad
	openscad -o $@ -D 'gridx=2' -D 'gridy=2' bachi-holder.scad

bachi-holder-2x4.stl: bachi-holder.scad
	openscad -o $@ -D 'gridx=2' -D 'gridy=4' bachi-holder.scad

bachi-holder-2x6.stl: bachi-holder.scad
	openscad -o $@ -D 'gridx=2' -D 'gridy=6' bachi-holder.scad

bachi-holder-2x8.stl: bachi-holder.scad
	openscad -o $@ -D 'gridx=2' -D 'gridy=8' bachi-holder.scad