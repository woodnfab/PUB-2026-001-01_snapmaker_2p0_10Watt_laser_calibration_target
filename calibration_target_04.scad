// ==========================================================
// Snapmaker 2.0 – 10W Laser Calibration Target (OEM-style)
// 60 x 60 x 2 mm, massief boven, honingraat onder
// ==========================================================
//
// Honeycomb pattern library by Gael Lafond (2017)
// License: Creative Commons – Attribution (CC BY)
// Source: https://github.com/smkent/honeycomb-openscad/blob/main/honeycomb.scad
//
// This script uses the honeycomb module from the library
// to create an inverted honeycomb under the top plate.
// ==========================================================

$fn = 48;

// ---------- Hoofdparameters ----------
plate = 60;               // totale plaatgrootte
thickness = 2;            // totale dikte
top_thickness = 0.6;      // bovenplaat dikte
honey_depth   = thickness - top_thickness; // hoogte honingraat
border        = 4;        // rand rondom honingraat
engrave_depth = 0.3;      // diepte van gravure

// Honingraat parameters
cell_dia = 10;            // diameter van hexagon
spacing  = 2;             // afstand tussen hexagons

// Tekst
title_size  = 2;
footer_size = 1.5;

// ==========================================================
// USE EXTERNE HONEYCOMB MODULE
// ==========================================================
use <lib/honeycomb.scad>; // je originele module

// ==========================================================
// MODEL
// ==========================================================
difference() {

    // -------------------- MASSIEF BOVENBLOK --------------------
    linear_extrude(height = thickness)
        rounded_square_2d(plate, 3);

    // -------------------- TEKST EN HOEKMARKERING --------------------
    translate([0, 0, thickness - engrave_depth])
        linear_extrude(height = engrave_depth)
            union() {
                corner_marks_inward();

            }

    // -------------------- HONINGRAAT --------------------
    // gebruik externe module via use
    translate([border, border, 0])
        linear_extrude(height = honey_depth)
            difference() {
                // volledige honingraat vullen
                square([plate - 2*border, plate - 2*border]);

                honeycomb(
                    x = plate - 2*border,
                    y = plate - 2*border,
                    dia = cell_dia,
                    wall = spacing,
                    whole_only = false
                );
            }
}

// ==========================================================
// MODULES
// ==========================================================

// Afgeronde vierkant bovenzijde
module rounded_square_2d(size, r) {
    offset(r = r)
        offset(delta = -r)
            square([size, size], center = false);
}

// Hoekmarkeringen binnenin
module corner_marks_inward() {
    m = 10;    // afstand van de rand
    s = 5;     // lengte streepje
    w = 0.8;   // breedte streepje

    // Linksboven
    translate([m, plate - m - w]) {
        square([s, w]);
        translate([0, -s]) square([w, s]);
    }

    // Rechtsboven
    translate([plate - m - s, plate - m - w]) {
        square([s, w]);
        translate([s - w, -s]) square([w, s]);
    }

    // Linksonder
    translate([m, m]) {
        square([s, w]);
        translate([0, w]) square([w, s]);
    }

    // Rechtsonder
    translate([plate - m - s, m]) {
        square([s, w]);
        translate([s - w, w]) square([w, s]);
    }
}
