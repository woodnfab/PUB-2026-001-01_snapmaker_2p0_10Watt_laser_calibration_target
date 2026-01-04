// Snapmaker 2.0 – 10W Laser Calibration Target
// 60 x 60 x 2 mm
// OEM-achtige look: afgeronde hoeken, juiste hoekmarkeringen, tekst boven & onder

$fn = 48;

// ---------- Parameters ----------
plate = 60;
thickness = 2;

top_thickness = 0.8;
honey_depth = thickness - top_thickness;

corner_radius = 3;
engrave_depth = 0.4;

hex_radius = 5;

// Tekstinstellingen
title_size = 2;      // kleiner dan eerder
footer_size = 1.5;

// ---------- Model ----------
difference() {

    // === Basisvorm ===
    linear_extrude(height = thickness)
        rounded_square_2d(plate, corner_radius);

    // === Honingraat onderzijde ===
    linear_extrude(height = honey_depth)
        honeycomb_2d(plate, plate, hex_radius);

    // === Hoekmarkeringen (bovenkant, correct georiënteerd) ===
    translate([0, 0, thickness - engrave_depth])
        linear_extrude(height = engrave_depth)
            corner_marks_inward();

    // === Tekst bovenkant ===
    translate([plate/2, plate*0.9, thickness - engrave_depth])
        linear_extrude(height = engrave_depth)
            text(
                "Calibration Target",
                size = title_size,
                halign = "center",
                valign = "center"
            );

    // === Tekst onderkant ===
    translate([plate/2, plate*0.10, thickness - engrave_depth])
        linear_extrude(height = engrave_depth)
            text(
                "Make sure the red dot is within the framed area.",
                size = footer_size,
                halign = "center",
                valign = "center"
            );
}

// ---------- Modules ----------

module rounded_square_2d(size, r) {
    offset(r = r)
        offset(delta = -r)
            square([size, size], center = false);
}

// Honingraat
module honeycomb_2d(w, h, r) {
    row_h = r * sqrt(3);

    for (y = [-row_h : row_h : h + row_h])
        for (x = [-3*r : 3*r : w + 3*r]) {

            translate([
                x + (floor(y / row_h) % 2) * 1.5 * r,
                y
            ])
            hexagon(r);
        }
}

// Hexagon
module hexagon(r) {
    hh = r * sqrt(3) / 2;
    polygon([
        [ r, 0 ],
        [ r/2,  hh ],
        [ -r/2, hh ],
        [ -r, 0 ],
        [ -r/2, -hh ],
        [ r/2, -hh ]
    ]);
}

// Hoekmarkeringen – open zijde naar binnen
module corner_marks_inward() {
    m = 10;     // afstand tot rand
    s = 5;     // lengte
    w = 0.8;   // lijndikte

    // Linksonder
    translate([m, m]) {
        square([s, w]);
        square([w, s]);
    }

    // Rechtsonder
    translate([plate - m - s, m]) {
        square([s, w]);
        translate([s - w, 0]) square([w, s]);
    }

    // Linksboven
    translate([m, plate - m - s]) {
        translate([0, s - w]) square([s, w]);
        square([w, s]);
    }

    // Rechtsboven
    translate([plate - m - s, plate - m - s]) {
        translate([0, s - w]) square([s, w]);
        translate([s - w, 0]) square([w, s]);
    }
}
