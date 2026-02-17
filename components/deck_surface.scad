/*
 * Scissor-Skate: Deck Surface Module
 *
 * Creates the shaped deck surface with concave profile and nose/tail curves.
 */

module deck_surface(length, width, thickness, concave_depth, nose_curve) {
    hull() {
        // Create concave surface using multiple cross-sections
        for (x = [-length/2 : length/10 : length/2]) {
            translate([x, 0, 0]) {
                // Concave cross-section
                intersection() {
                    // Outer width
                    cube([length/10 + 0.1, width, thickness], center=true);
                    
                    // Concave curve
                    translate([0, 0, -concave_depth])
                        rotate([90, 0, 0])
                            cylinder(h=width + 2, r=width/2 + concave_depth, center=true, $fn=64);
                }
            }
        }
        
        // Nose and tail curves
        for (end = [-1, 1]) {
            translate([end * (length/2 - 20), 0, nose_curve * abs(end)])
                sphere(d=40, $fn=32);
        }
    }
}
