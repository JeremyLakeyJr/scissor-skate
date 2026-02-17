/*
 * Scissor-Skate: Lock Mechanism Module
 *
 * Manual locking pin to secure the deck in extended position.
 */

include <parameters.scad>

module locking_pin() {
    // Manual locking pin to secure extended position
    pin_length = 40;
    
    difference() {
        union() {
            // Pin shaft
            cylinder(d=locking_pin_diameter, h=pin_length, center=true, $fn=16);
            
            // Handle/grip
            translate([0, 0, pin_length/2 + 5])
                sphere(d=15, $fn=32);
        }
        
        // Grip texture
        for (angle = [0 : 30 : 330]) {
            rotate([0, 0, angle])
                translate([locking_pin_diameter/2, 0, pin_length/2 + 5])
                    cube([2, 1, 12], center=true);
        }
    }
}
