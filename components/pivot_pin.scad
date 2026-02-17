/*
 * Scissor-Skate: Pivot Pin Module
 *
 * Pin for connecting scissor arms at pivot points.
 * Sized for the wider, stronger arms of the platform-less design.
 */

include <parameters.scad>

module pivot_pin() {
    // Pin for connecting scissor arms
    pin_length = arm_thickness * 4 + 6; // longer pin for multiple arm layers
    
    difference() {
        union() {
            // Main pin shaft
            cylinder(d=pivot_diameter - pivot_tolerance, h=pin_length, center=true, $fn=24);
            
            // Head
            translate([0, 0, pin_length/2])
                cylinder(d=pivot_diameter + 4, h=2.5, center=true, $fn=24);
            
            // Base flange
            translate([0, 0, -pin_length/2])
                cylinder(d=pivot_diameter + 4, h=2.5, center=true, $fn=24);
        }
    }
}
