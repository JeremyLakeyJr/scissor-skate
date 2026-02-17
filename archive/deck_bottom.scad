/*
 * Legacy separate deck design — current uses integrated arms as surface.
 *
 * Scissor-Skate: Deck Bottom Platform Module
 *
 * Lower structural platform with weight reduction features.
 */

include <parameters.scad>

module deck_bottom_platform() {
    difference() {
        // Bottom platform - simpler, flatter
        hull() {
            for (x = [-deck_length_extended/2 + 30, deck_length_extended/2 - 30]) {
                translate([x, 0, 0])
                    cylinder(d=deck_width - 20, h=deck_thickness, center=true);
            }
        }
        
        // Pivot connection holes for scissor mechanism
        for (i = [-1, 1]) {
            translate([i * (deck_length_extended/4 - 20), 0, 0])
                cylinder(d=pivot_diameter + pivot_tolerance, h=deck_thickness + 2, center=true);
        }
        
        // Weight reduction holes
        for (x = [-deck_length_extended/4 : deck_length_extended/8 : deck_length_extended/4]) {
            for (y = [-deck_width/4 : deck_width/4 : deck_width/4]) {
                translate([x, y, 0])
                    cylinder(d=15, h=deck_thickness + 2, center=true);
            }
        }
    }
}

module deck_bottom_platform_collapsed() {
    // Collapsed - rotated scissor position
    rotate([0, 90, 0])
        deck_bottom_platform();
}
