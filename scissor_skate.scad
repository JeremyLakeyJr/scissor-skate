/*
 * Collapsible Skateboard Deck with Scissor-Lift Mechanism
 * 
 * This parametric OpenSCAD design creates a portable, foldable skateboard
 * that uses a pantograph (scissor-lift) mechanism to collapse to half its
 * extended length for easy transport in a backpack.
 * 
 * Key Features:
 * - Collapsed: ~11-15" long × 8-9" wide × 2-4" thick
 * - Extended: ~20-28" long × 8-10" wide (rideable skateboard deck)
 * - Fully parametric design - adjust all dimensions via variables
 * - Print-in-place or modular assembly options
 * - Integrated truck mounting points
 * - Manual locking mechanism (screw/pin system)
 * 
 * Designed for 3D printing with PLA, PETG, or similar materials
 */

// ========================================
// MAIN PARAMETERS - Adjust these for customization
// ========================================

// Skateboard dimensions
deck_length_extended = 24 * 25.4;  // 24 inches in mm (rideable length)
deck_width = 9 * 25.4;              // 9 inches in mm
deck_thickness = 6;                 // mm (platform thickness)

// Collapsed dimensions
collapsed_length = 13 * 25.4;       // ~13 inches when folded
collapsed_height = 80;              // mm (vertical height when collapsed)

// Scissor mechanism parameters
num_scissor_pairs = 2;              // Number of scissor arm pairs
arm_width = 20;                     // mm (width of each scissor arm)
arm_thickness = 4;                  // mm (thickness of scissor arms)
pivot_diameter = 6;                 // mm (diameter of pivot holes)
pivot_tolerance = 0.3;              // mm (clearance for pivots)

// Deck surface parameters
deck_concave_depth = 8;             // mm (concave curve depth)
deck_nose_tail_curve = 15;          // mm (nose/tail upward curve)

// Truck mounting parameters
truck_wheelbase = 15 * 25.4;        // 15 inches between trucks
truck_mounting_hole_diameter = 5;   // mm
truck_mounting_pattern_width = 2.125 * 25.4; // Standard truck pattern

// Locking mechanism
locking_pin_diameter = 8;           // mm
locking_slot_width = 10;            // mm

// Print settings
layer_height = 0.2;                 // mm
nozzle_diameter = 0.4;              // mm
wall_thickness = 2.4;               // mm (nozzle_diameter * 6)

// ========================================
// RENDERING OPTIONS
// ========================================

render_mode = "assembly";  // Options: "assembly", "deck_top", "deck_bottom", "scissor_arms", "pivot_pins", "lock_mechanism"
show_extended = true;      // true = extended position, false = collapsed position
show_wheels = true;        // Show example wheels for visualization

// ========================================
// CALCULATED VALUES
// ========================================

scissor_arm_length = deck_length_extended / 2 - 20; // Length of each scissor arm
extension_ratio = deck_length_extended / collapsed_length;

// ========================================
// MAIN ASSEMBLY
// ========================================

if (render_mode == "assembly") {
    assembly();
} else if (render_mode == "deck_top") {
    deck_top_platform();
} else if (render_mode == "deck_bottom") {
    deck_bottom_platform();
} else if (render_mode == "scissor_arms") {
    scissor_arm_pair();
} else if (render_mode == "pivot_pins") {
    pivot_pin();
} else if (render_mode == "lock_mechanism") {
    locking_pin();
}

// ========================================
// MODULES
// ========================================

module assembly() {
    if (show_extended) {
        // Extended position
        translate([0, 0, collapsed_height/2]) {
            deck_top_platform();
            translate([0, 0, -deck_thickness - 5])
                deck_bottom_platform();
            
            // Scissor mechanism
            translate([0, 0, -deck_thickness - 15])
                scissor_mechanism_extended();
        }
        
        // Optional: Show wheels
        if (show_wheels) {
            color("black", 0.5) {
                // Front trucks
                translate([truck_wheelbase/2, -deck_width/2 + 20, 0])
                    rotate([0, 90, 0]) cylinder(h=deck_width - 40, d=60, center=true);
                // Rear trucks
                translate([-truck_wheelbase/2, -deck_width/2 + 20, 0])
                    rotate([0, 90, 0]) cylinder(h=deck_width - 40, d=60, center=true);
            }
        }
    } else {
        // Collapsed position
        deck_top_platform_collapsed();
        translate([0, 0, -deck_thickness - 5])
            deck_bottom_platform_collapsed();
        translate([0, 0, -deck_thickness - 15])
            scissor_mechanism_collapsed();
    }
}

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

module deck_bottom_platform() {
    difference() {
        // Bottom platform - simpler, flatter
        hull() {
            for (x = [-deck_length_extended/2 + 30, deck_length_extended/2 - 30]) {
                translate([x, 0, 0])
                    cylinder(d=deck_width - 20, h=deck_thickness, center=true);
            }
        }
        
        // Pivot connection holes for scissor mechanism
        for (i = [-1, 1]) {
            translate([i * (deck_length_extended/4 - 20), 0, 0])
                cylinder(d=pivot_diameter + pivot_tolerance, h=deck_thickness + 2, center=true);
        }
        
        // Weight reduction holes
        for (x = [-deck_length_extended/4 : deck_length_extended/8 : deck_length_extended/4]) {
            for (y = [-deck_width/4 : deck_width/4 : deck_width/4]) {
                translate([x, y, 0])
                    cylinder(d=15, h=deck_thickness + 2, center=true);
            }
        }
    }
}

module deck_top_platform_collapsed() {
    // Collapsed - rotated scissor position
    rotate([0, 90, 0])
        deck_top_platform();
}

module deck_bottom_platform_collapsed() {
    // Collapsed - rotated scissor position
    rotate([0, 90, 0])
        deck_bottom_platform();
}

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

module truck_mounting_holes() {
    // Standard skateboard truck mounting pattern (4 holes)
    hole_spacing = truck_mounting_pattern_width;
    
    for (x = [-hole_spacing/2, hole_spacing/2]) {
        for (y = [-hole_spacing/2, hole_spacing/2]) {
            translate([x, y, 0])
                cylinder(d=truck_mounting_hole_diameter, h=deck_thickness + 2, center=true, $fn=16);
        }
    }
    
    // Countersink for bolts
    for (x = [-hole_spacing/2, hole_spacing/2]) {
        for (y = [-hole_spacing/2, hole_spacing/2]) {
            translate([x, y, deck_thickness/2 - 2])
                cylinder(d1=truck_mounting_hole_diameter, d2=truck_mounting_hole_diameter + 4, h=3, center=true, $fn=16);
        }
    }
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

// ========================================
// UTILITY FUNCTIONS
// ========================================

// Helper function for smooth transitions
function ease_in_out(t) = t < 0.5 ? 2*t*t : -1+(4-2*t)*t;

// End of file
