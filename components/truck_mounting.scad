/*
 * Scissor-Skate: Truck Mounting Holes Module
 *
 * Standard skateboard truck mounting hole pattern with countersinks.
 * Used by truck_mount_bracket in scissor_mechanism.scad.
 */

include <parameters.scad>

module truck_mounting_holes() {
    // Standard skateboard truck mounting pattern (4 holes)
    hole_spacing = truck_mounting_pattern_width;
    
    for (x = [-hole_spacing/2, hole_spacing/2]) {
        for (y = [-hole_spacing/2, hole_spacing/2]) {
            translate([x, y, 0])
                cylinder(d=truck_mounting_hole_diameter, h=truck_bracket_thickness + 2, center=true, $fn=16);
        }
    }
    
    // Countersink for bolts on top surface
    for (x = [-hole_spacing/2, hole_spacing/2]) {
        for (y = [-hole_spacing/2, hole_spacing/2]) {
            translate([x, y, truck_bracket_thickness/2 - 2])
                cylinder(d1=truck_mounting_hole_diameter, d2=truck_mounting_hole_diameter + 4, h=3, center=true, $fn=16);
        }
    }
}
