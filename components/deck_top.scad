/*
 * Scissor-Skate: Deck Top Platform Module
 *
 * Main riding surface with concave profile, truck mounts, and reinforcement ribs.
 */

include <parameters.scad>
use <deck_surface.scad>
use <truck_mounting.scad>

module deck_top_platform() {
    difference() {
        // Main deck surface with concave
        deck_surface(
            length = deck_length_extended,
            width = deck_width,
            thickness = deck_thickness,
            concave_depth = deck_concave_depth,
            nose_curve = deck_nose_tail_curve
        );
        
        // Truck mounting holes (front)
        translate([truck_wheelbase/2, 0, 0])
            truck_mounting_holes();
        
        // Truck mounting holes (rear)
        translate([-truck_wheelbase/2, 0, 0])
            truck_mounting_holes();
        
        // Pivot connection holes for scissor mechanism
        for (i = [-1, 1]) {
            translate([i * (deck_length_extended/4 - 20), 0, -deck_thickness/2])
                cylinder(d=pivot_diameter + pivot_tolerance, h=deck_thickness + 2, center=true);
        }
    }
    
    // Reinforcement ribs on underside
    translate([0, 0, -deck_thickness/2 + 1]) {
        for (x = [-deck_length_extended/3 : deck_length_extended/6 : deck_length_extended/3]) {
            translate([x, 0, 0])
                cube([wall_thickness, deck_width - 40, 3], center=true);
        }
    }
}

module deck_top_platform_collapsed() {
    // Collapsed - rotated scissor position
    rotate([0, 90, 0])
        deck_top_platform();
}
