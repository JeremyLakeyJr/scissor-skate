/*
 * Scissor-Skate: Lock Mechanism Module
 *
 * Manual locking pin to secure the mechanism in extended position.
 * The pin passes through aligned holes in the crossbar and scissor arm
 * when extended, preventing the mechanism from collapsing while riding.
 */

include <parameters.scad>

module locking_pin() {
    // Pin length must pass through crossbar + arm thickness
    pin_length = arm_thickness * 2 + truck_bracket_thickness + 10;
    
    difference() {
        union() {
            // Pin shaft — slightly smaller than locking hole for fit
            cylinder(d=locking_pin_diameter - pivot_tolerance, h=pin_length, center=true, $fn=24);
            
            // Handle/grip sphere at top
            translate([0, 0, pin_length/2 + 5])
                sphere(d=15, $fn=32);
            
            // Retaining flange at bottom (prevents pin from falling through)
            translate([0, 0, -pin_length/2])
                cylinder(d=locking_pin_diameter + 4, h=2, center=true, $fn=24);
        }
        
        // Grip texture on the handle sphere
        for (angle = [0 : 30 : 330]) {
            rotate([0, 0, angle])
                translate([locking_pin_diameter/2, 0, pin_length/2 + 5])
                    cube([2, 1, 12], center=true);
        }
    }
}
