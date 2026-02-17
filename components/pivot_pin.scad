/*
 * Scissor-Skate: Pivot Pin Module
 *
 * Pin for connecting scissor arms at pivot points.
 */

include <parameters.scad>

module pivot_pin() {
    // Pin for connecting scissor arms
    pin_length = arm_thickness * 2 + 3;
    
    difference() {
        union() {
            // Main pin shaft
            cylinder(d=pivot_diameter - pivot_tolerance, h=pin_length, center=true, $fn=16);
            
            // Head
            translate([0, 0, pin_length/2])
                cylinder(d=pivot_diameter + 4, h=2, center=true, $fn=16);
            
            // Base flange
            translate([0, 0, -pin_length/2])
                cylinder(d=pivot_diameter + 4, h=2, center=true, $fn=16);
        }
    }
}
