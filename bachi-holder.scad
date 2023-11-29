
$fa = 8;
$fs = 0.25;

gridx = 4;
gridy = 4;

bachi_width = 27.2;
internal_wall_width = 2;
external_wall_width = 3;
base_height = 2.5;
external_height = 50;

internal_fillet_radius = bachi_width / 2;
external_fillet_radius = 4;
clearance = 0.3;


module rounded_sqaure(wh, r) {
  w = wh[0];
  h = wh[1];

  minkowski() {
    circle(r);
    square([max(w - (2 * r), 0.001), max(h - (2 * r), 0.001)], true);
  }
}

let (
  w = bachi_width + clearance,
  internal_width = w * gridx + internal_wall_width * (gridx - 1),
  internal_length = w * gridy + internal_wall_width * (gridy - 1)
) {
  linear_extrude(base_height)
  rounded_sqaure([internal_width + external_wall_width * 2, internal_length + external_wall_width * 2], external_fillet_radius);

  translate([0, 0, base_height])
  linear_extrude(external_height - base_height)
  difference() {
    rounded_sqaure([internal_width + external_wall_width * 2, internal_length + external_wall_width * 2], external_fillet_radius);

    translate([-internal_width  / 2, -internal_length / 2])
    for (i = [0:gridx - 1])
    for (j = [0:gridy - 1])
    translate([i * (w + internal_wall_width), j * (w + internal_wall_width)])
    translate([w / 2, w / 2])
    rounded_sqaure([w, w], internal_fillet_radius);
  }
}
