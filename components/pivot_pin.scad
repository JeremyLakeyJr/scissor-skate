/*
 * Scissor-Skate: Pivot Pin Module
 *
 * Pin for connecting scissor arms at pivot points.
 * Sized for the wider, stronger arms of the platform-less design.
 *
 * For production builds, use metal shoulder bolts instead of printed pins.
 * See the shoulder_bolt_hole() module below and recommended hardware in
 * README.md / BOM.md (M5 × 10 mm shoulder bolts or 10-24 × 3/8").
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

// Shoulder-bolt pivot hole — subtract this from arms/crossbars when
// using metal shoulder bolts instead of printed pivot pins.
// Includes a small 0.5 mm chamfer at each opening for easy insertion.
module shoulder_bolt_hole(through_thickness) {
    hole_dia = pivot_bolt_dia + pivot_clearance;
    chamfer = 0.5;  // mm entry chamfer
    
    // Main through-hole
    cylinder(d=hole_dia, h=through_thickness + 2, center=true, $fn=32);
    
    // Top chamfer
    translate([0, 0, through_thickness/2 - chamfer/2])
        cylinder(d1=hole_dia, d2=hole_dia + 2*chamfer,
                 h=chamfer + 0.01, center=true, $fn=32);
    
    // Bottom chamfer
    translate([0, 0, -(through_thickness/2 - chamfer/2)])
        cylinder(d1=hole_dia + 2*chamfer, d2=hole_dia,
                 h=chamfer + 0.01, center=true, $fn=32);
}

// Optional head recess — subtract on the bolt-head side of a part
module bolt_head_recess() {
    cylinder(d=bolt_head_dia + pivot_clearance,
             h=bolt_head_height + 0.2, center=true, $fn=32);
}
