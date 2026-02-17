/*
 * Scissor-Skate: Scissor Mechanism Module
 *
 * Scissor-lift (pantograph) arms that serve as the riding surface.
 * The rider stands directly on the scissor arms — no separate deck platforms.
 * Arms are wide and strong enough to support rider weight.
 *
 * ASSEMBLY GUIDE:
 *
 * Each scissor X-pair consists of two arms (A and B) that cross at
 * their center pivot holes. Multiple X-pairs are arranged side-by-side
 * along the Y axis to create the board width.
 *
 * Assembly order:
 *   1. Take arm A and arm B, cross them at center, insert center pivot pin.
 *   2. Repeat for each of the num_scissor_pairs side-by-side pairs.
 *   3. Connect all left-side arm endpoints to the left crossbar via pins.
 *   4. Connect all right-side arm endpoints to the right crossbar via pins.
 *   5. Attach truck mount brackets to the bottom of each crossbar.
 *   6. Place foot platforms on the top of each crossbar.
 *   7. Insert locking pins through the locking holes to secure extended position.
 *   8. Mount standard skateboard trucks on the truck brackets.
 *
 *  Side view (extended, one X-pair):
 *
 *   [foot pad]                       [foot pad]
 *   ===crossbar===              ===crossbar===
 *        \       /  center   \       /
 *         \     / pivot(X)    \     /
 *          \   /     |         \   /
 *           \ /      |          \ /
 *            X ------+---------- X
 *           / \      |          / \
 *          /   \     |         /   \
 *         /     \    |        /     \
 *        /       \   |       /       \
 *   ===crossbar===              ===crossbar===
 *   [truck bracket]              [truck bracket]
 */

include <parameters.scad>
use <truck_mounting.scad>

// ========================================
// SINGLE SCISSOR ARM
// ========================================

// One arm with 3 pivot holes: left end, center, right end.
// The arm is oriented along the X axis, flat on XY plane.
module scissor_arm() {
    difference() {
        // Main arm body — wide and flat for standing on
        hull() {
            translate([-(scissor_arm_length/2 - arm_width/2), 0, 0])
                cylinder(d=arm_width, h=arm_thickness, center=true, $fn=48);
            translate([(scissor_arm_length/2 - arm_width/2), 0, 0])
                cylinder(d=arm_width, h=arm_thickness, center=true, $fn=48);
        }
        
        // Left endpoint pivot hole
        translate([-(scissor_arm_length/2 - arm_width/2), 0, 0])
            cylinder(d=pivot_diameter + pivot_tolerance, h=arm_thickness + 2, center=true, $fn=24);
        
        // Center pivot hole
        cylinder(d=pivot_diameter + pivot_tolerance, h=arm_thickness + 2, center=true, $fn=24);
        
        // Right endpoint pivot hole
        translate([(scissor_arm_length/2 - arm_width/2), 0, 0])
            cylinder(d=pivot_diameter + pivot_tolerance, h=arm_thickness + 2, center=true, $fn=24);
        
        // Locking pin hole — near the right endpoint of the arm.
        // When the mechanism is extended, a locking pin can be inserted
        // through the upper crossbar and this hole to prevent collapse.
        translate([(scissor_arm_length/2 - arm_width/2) - 25, 0, 0])
            cylinder(d=locking_pin_diameter + pivot_tolerance, h=arm_thickness + 2, center=true, $fn=24);
    }
}

// Print layout: two arms side by side for efficient printing
module scissor_arm_pair() {
    scissor_arm();
    translate([0, arm_width + 10, 0])
        scissor_arm();
}

// ========================================
// CROSSBAR — connects arm endpoints across all pairs
// ========================================

// A crossbar runs along the Y axis, connecting the endpoints of all
// side-by-side scissor pairs at one end. It provides the surface
// for foot platforms on top and truck brackets below.
module crossbar() {
    crossbar_length = total_mechanism_width + 30;  // extends past outer arms
    crossbar_width = arm_width;                     // same width as arm endpoint
    crossbar_thickness = arm_thickness;             // same thickness for strength
    
    difference() {
        // Main crossbar body
        hull() {
            translate([0, -crossbar_length/2, 0])
                cylinder(d=crossbar_width, h=crossbar_thickness, center=true, $fn=48);
            translate([0, crossbar_length/2, 0])
                cylinder(d=crossbar_width, h=crossbar_thickness, center=true, $fn=48);
        }
        
        // Pivot holes — one for each scissor pair's arm endpoint
        for (p = [0 : num_scissor_pairs - 1]) {
            y_pos = (p - (num_scissor_pairs - 1) / 2) * (arm_width + arm_spacing);
            translate([0, y_pos, 0])
                cylinder(d=pivot_diameter + pivot_tolerance, h=crossbar_thickness + 2, center=true, $fn=24);
        }
        
        // Locking pin hole through crossbar (aligns with arm locking hole when extended)
        cylinder(d=locking_pin_diameter + pivot_tolerance, h=crossbar_thickness + 2, center=true, $fn=24);
    }
}

// ========================================
// FOOT PLATFORM — sits on top of a crossbar
// ========================================

// Flat pad with grip texture. Attaches to a crossbar via bolts through
// matching holes. The rider stands on these.
module foot_platform() {
    difference() {
        // Main platform pad — rounded rectangle
        hull() {
            for (x = [-foot_platform_length/2 + 10, foot_platform_length/2 - 10]) {
                for (y = [-foot_platform_width/2 + 10, foot_platform_width/2 - 10]) {
                    translate([x, y, 0])
                        cylinder(d=20, h=foot_platform_thickness, center=true, $fn=24);
                }
            }
        }
        
        // Mounting holes — match crossbar pivot hole positions for bolt-through
        for (p = [0 : num_scissor_pairs - 1]) {
            y_pos = (p - (num_scissor_pairs - 1) / 2) * (arm_width + arm_spacing);
            translate([0, y_pos, 0])
                cylinder(d=truck_mounting_hole_diameter, h=foot_platform_thickness + 2, center=true, $fn=16);
        }
        
        // Grip texture — cross-hatch pattern on top surface
        for (x = [-foot_platform_length/2 : 8 : foot_platform_length/2]) {
            translate([x, 0, foot_platform_thickness/2 - grip_texture_depth/2])
                cube([1.5, foot_platform_width + 10, grip_texture_depth + 0.1], center=true);
        }
        for (y = [-foot_platform_width/2 : 8 : foot_platform_width/2]) {
            translate([0, y, foot_platform_thickness/2 - grip_texture_depth/2])
                cube([foot_platform_length + 10, 1.5, grip_texture_depth + 0.1], center=true);
        }
    }
}

// ========================================
// TRUCK MOUNT BRACKET — attaches below a crossbar
// ========================================

// Bracket with standard skateboard truck hole pattern.
// Bolts through the crossbar from below.
module truck_mount_bracket() {
    bracket_width = total_mechanism_width + 20;
    bracket_length = 80;
    
    difference() {
        // Bracket body
        hull() {
            for (x = [-bracket_length/2 + 7, bracket_length/2 - 7]) {
                for (y = [-bracket_width/2 + 7, bracket_width/2 - 7]) {
                    translate([x, y, 0])
                        cylinder(d=15, h=truck_bracket_thickness, center=true, $fn=24);
                }
            }
        }
        
        // Standard skateboard truck mounting holes (4-hole pattern)
        truck_mounting_holes();
        
        // Bolt-through holes to attach bracket to crossbar
        for (p = [0 : num_scissor_pairs - 1]) {
            y_pos = (p - (num_scissor_pairs - 1) / 2) * (arm_width + arm_spacing);
            translate([0, y_pos, 0])
                cylinder(d=truck_mounting_hole_diameter, h=truck_bracket_thickness + 2, center=true, $fn=16);
        }
    }
}

// ========================================
// EXTENDED ASSEMBLY
// ========================================

// Full mechanism in extended (riding) position.
// Each X-pair: arm A rotated +angle, arm B rotated -angle, crossing at center.
// Crossbars at endpoints, foot platforms on top, truck brackets below.
module scissor_mechanism_extended() {
    // Vertical layer offset: arm A sits on top of arm B at the crossing
    z_upper = arm_thickness / 2;
    z_lower = -arm_thickness / 2;
    
    // --- Scissor arm X-pairs (one per num_scissor_pairs, side by side) ---
    for (pair = [0 : num_scissor_pairs - 1]) {
        y_pos = (pair - (num_scissor_pairs - 1) / 2) * (arm_width + arm_spacing);
        
        // Arm A — tilted at +extension_angle (upper layer)
        color("SteelBlue", 0.9)
        translate([0, y_pos, z_upper])
            rotate([0, extension_angle, 0])
                scissor_arm();
        
        // Arm B — tilted at -extension_angle (lower layer), crossing arm A
        color("SlateGray", 0.85)
        translate([0, y_pos, z_lower])
            rotate([0, -extension_angle, 0])
                scissor_arm();
    }
    
    // --- Crossbars at each end (connect all arm endpoints) ---
    // Left crossbar: at x = -arm_half * cos(angle), z = ±arm_half * sin(angle)
    // Arm A left endpoint is at upper height going left-down
    // Arm B left endpoint is at lower height going left-up
    // The crossbar sits at the average Z, at the endpoint X
    
    left_x = -arm_half * cos(extension_angle);
    right_x = arm_half * cos(extension_angle);
    upper_endpoint_z = arm_half * sin(extension_angle);   // arm A left end goes up
    lower_endpoint_z = -arm_half * sin(extension_angle);  // arm A right end goes down
    
    // Upper-left crossbar (arm A left endpoints = high side)
    color("CadetBlue", 0.9)
    translate([left_x, 0, z_upper + upper_endpoint_z])
        rotate([0, 0, 90])
            crossbar();
    
    // Lower-left crossbar (arm B left endpoints = low side)
    color("DarkSlateGray", 0.85)
    translate([left_x, 0, z_lower - upper_endpoint_z])
        rotate([0, 0, 90])
            crossbar();
    
    // Upper-right crossbar (arm A right endpoints = low side)
    color("CadetBlue", 0.9)
    translate([right_x, 0, z_upper - upper_endpoint_z])
        rotate([0, 0, 90])
            crossbar();
    
    // Lower-right crossbar (arm B right endpoints = high side)
    color("DarkSlateGray", 0.85)
    translate([right_x, 0, z_lower + upper_endpoint_z])
        rotate([0, 0, 90])
            crossbar();
    
    // --- Foot platforms on top of the upper crossbars (rider stands here) ---
    top_z_left = z_upper + upper_endpoint_z + arm_thickness/2 + foot_platform_thickness/2;
    top_z_right = z_lower + upper_endpoint_z + arm_thickness/2 + foot_platform_thickness/2;
    
    color("DodgerBlue", 0.8) {
        // Left foot platform (rear foot)
        translate([left_x, 0, top_z_left])
            foot_platform();
        
        // Right foot platform (front foot)
        translate([right_x, 0, top_z_right])
            foot_platform();
    }
    
    // --- Truck mount brackets below the lower crossbars ---
    bottom_z_left = z_lower - upper_endpoint_z - arm_thickness/2 - truck_bracket_thickness/2;
    bottom_z_right = z_upper - upper_endpoint_z - arm_thickness/2 - truck_bracket_thickness/2;
    
    color("DimGray", 0.9) {
        // Left truck bracket
        translate([left_x, 0, bottom_z_left])
            truck_mount_bracket();
        
        // Right truck bracket
        translate([right_x, 0, bottom_z_right])
            truck_mount_bracket();
    }
}

// ========================================
// COLLAPSED ASSEMBLY
// ========================================

// Full mechanism in collapsed (portable) position.
// Arms are nearly vertical, crossbars stack close together.
module scissor_mechanism_collapsed() {
    z_upper = arm_thickness / 2;
    z_lower = -arm_thickness / 2;
    
    // --- Scissor arm X-pairs ---
    for (pair = [0 : num_scissor_pairs - 1]) {
        y_pos = (pair - (num_scissor_pairs - 1) / 2) * (arm_width + arm_spacing);
        
        color("SteelBlue", 0.9)
        translate([0, y_pos, z_upper])
            rotate([0, collapse_angle, 0])
                scissor_arm();
        
        color("SlateGray", 0.85)
        translate([0, y_pos, z_lower])
            rotate([0, -collapse_angle, 0])
                scissor_arm();
    }
    
    // Collapsed crossbar positions
    collapsed_x = arm_half * cos(collapse_angle);
    collapsed_z_offset = arm_half * sin(collapse_angle);
    
    // Upper crossbars
    color("CadetBlue", 0.9) {
        translate([-collapsed_x, 0, z_upper + collapsed_z_offset])
            rotate([0, 0, 90]) crossbar();
        translate([collapsed_x, 0, z_upper - collapsed_z_offset])
            rotate([0, 0, 90]) crossbar();
    }
    
    // Lower crossbars
    color("DarkSlateGray", 0.85) {
        translate([-collapsed_x, 0, z_lower - collapsed_z_offset])
            rotate([0, 0, 90]) crossbar();
        translate([collapsed_x, 0, z_lower + collapsed_z_offset])
            rotate([0, 0, 90]) crossbar();
    }
    
    // Foot platforms rest on top
    top_z = z_upper + collapsed_z_offset + arm_thickness/2 + foot_platform_thickness/2;
    color("DodgerBlue", 0.8) {
        translate([-collapsed_x, 0, top_z])
            foot_platform();
        translate([collapsed_x, 0, top_z])
            foot_platform();
    }
    
    // Truck brackets below
    bottom_z = z_lower - collapsed_z_offset - arm_thickness/2 - truck_bracket_thickness/2;
    color("DimGray", 0.9) {
        translate([-collapsed_x, 0, bottom_z])
            truck_mount_bracket();
        translate([collapsed_x, 0, bottom_z])
            truck_mount_bracket();
    }
}
