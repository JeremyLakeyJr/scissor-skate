/*
 * Scissor-Skate: Scissor Mechanism Module
 *
 * Scissor-lift (pantograph) arms and mechanism for extending/collapsing the deck.
 */

include <parameters.scad>

module scissor_arm() {
    difference() {
        // Main arm body
        hull() {
            for (end = [-1, 1]) {
                translate([end * (scissor_arm_length/2 - arm_width/2), 0, 0])
                    cylinder(d=arm_width, h=arm_thickness, center=true, $fn=32);
            }
        }
        
        // Pivot holes at ends
        for (end = [-1, 1]) {
            translate([end * (scissor_arm_length/2 - arm_width/2), 0, 0])
                cylinder(d=pivot_diameter + pivot_tolerance, h=arm_thickness + 2, center=true, $fn=16);
        }
        
        // Center pivot hole
        cylinder(d=pivot_diameter + pivot_tolerance, h=arm_thickness + 2, center=true, $fn=16);
        
        // Weight reduction slots
        for (x = [-scissor_arm_length/3 : scissor_arm_length/6 : scissor_arm_length/3]) {
            translate([x, 0, 0])
                cube([scissor_arm_length/8, arm_width - 8, arm_thickness + 2], center=true);
        }
    }
}

module scissor_arm_pair() {
    // For printing - lay flat
    scissor_arm();
    translate([0, arm_width + 5, 0])
        scissor_arm();
}

module scissor_mechanism_extended() {
    // Extended scissor arms
    extension_angle = 25; // degrees from horizontal when extended
    
    for (pair = [0 : num_scissor_pairs - 1]) {
        z_offset = pair * (arm_thickness + 2);
        
        // Left scissor arm (top)
        color("blue", 0.7)
        translate([-deck_length_extended/4, 0, z_offset])
            rotate([0, extension_angle, 0])
                scissor_arm();
        
        // Right scissor arm (top)
        color("blue", 0.7)
        translate([deck_length_extended/4, 0, z_offset])
            rotate([0, -extension_angle, 0])
                scissor_arm();
        
        // Left scissor arm (bottom)
        color("green", 0.7)
        translate([-deck_length_extended/4, 0, z_offset + arm_thickness + 1])
            rotate([0, -extension_angle, 0])
                scissor_arm();
        
        // Right scissor arm (bottom)
        color("green", 0.7)
        translate([deck_length_extended/4, 0, z_offset + arm_thickness + 1])
            rotate([0, extension_angle, 0])
                scissor_arm();
    }
}

module scissor_mechanism_collapsed() {
    // Collapsed scissor arms (nearly vertical)
    collapse_angle = 75; // degrees from horizontal when collapsed
    
    for (pair = [0 : num_scissor_pairs - 1]) {
        z_offset = pair * (arm_thickness + 2);
        
        color("blue", 0.7)
        translate([0, 0, z_offset])
            rotate([0, collapse_angle, 0])
                scissor_arm();
        
        color("green", 0.7)
        translate([0, 0, z_offset + arm_thickness + 1])
            rotate([0, -collapse_angle, 0])
                scissor_arm();
    }
}
