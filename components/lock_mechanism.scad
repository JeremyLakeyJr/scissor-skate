/*
 * Scissor-Skate: Lock Mechanism Module
 *
 * Manual locking pin to secure the mechanism in extended position.
 * The pin passes through aligned holes in the crossbar and scissor arm
 * when extended, preventing the mechanism from collapsing while riding.
 *
 * SAFETY NOTE — Consider double pins or secondary latches for critical
 * safety.  For redundancy you can:
 *   • Use two locking pins per side (front and rear of each crossbar).
 *   • Add a spring-loaded detent ball or captive clip as a backup.
 *   • Pair printed pins with a metal bolt or carabiner through the same
 *     hole for extra shear strength.
 * Always verify all locks are fully engaged before riding.
 */

include <parameters.scad>

module locking_pin() {
    // Pin length must pass through crossbar + arm + clearance
    // Crossbar thickness equals arm_thickness in the current design
    pin_length = arm_thickness * 3 + 6;
    
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
