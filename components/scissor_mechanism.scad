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
 * along the X axis to create the board width.
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
 *  Top view (extended, one X-pair):
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
// Includes parametric concave curvature and optional nose/tail kick ramps
// (set foot_concave_depth, kick_angle, and kick_length in parameters.scad).
module foot_platform() {
    difference() {
        union() {
            // Main platform pad — rounded rectangle
            hull() {
                for (x = [-foot_platform_length/2 + 10, foot_platform_length/2 - 10]) {
                    for (y = [-foot_platform_width/2 + 10, foot_platform_width/2 - 10]) {
                        translate([x, y, 0])
                            cylinder(d=20, h=foot_platform_thickness, center=true, $fn=24);
                    }
                }
            }

            // Nose/tail kick ramps at each end
            if (kick_angle > 0 && kick_length > 0) {
                for (dir = [-1, 1]) {
                    translate([dir * (foot_platform_length/2 - kick_length/2), 0, 0])
                        rotate([0, dir * kick_angle, 0])
                            hull() {
                                for (y = [-foot_platform_width/2 + 10, foot_platform_width/2 - 10]) {
                                    translate([0, y, 0])
                                        cylinder(d=20, h=foot_platform_thickness, center=true, $fn=24);
                                }
                            }
                }
            }
        }
        
        // Concave bowl — subtract a large inverted sphere to create a
        // gentle bowl shape on the top surface (foot_concave_depth mm deep).
        // Sphere radius from the spherical-cap formula: r = w²/(8d) + d/2
        // where w = platform width and d = concave depth.
        if (foot_concave_depth > 0) {
            concave_r = (foot_platform_width * foot_platform_width) /
                        (8 * foot_concave_depth) + foot_concave_depth / 2;
            translate([0, 0, foot_platform_thickness/2 + concave_r - foot_concave_depth])
                sphere(r=concave_r, $fn=64);
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
    // Arms are oriented along Y (direction of travel) and rotate in the YZ plane
    // so the board extends lengthwise. Pairs are arranged side-by-side along X.
    for (pair = [0 : num_scissor_pairs - 1]) {
        x_pos = (pair - (num_scissor_pairs - 1) / 2) * (arm_width + arm_spacing);
        
        // Arm A — oriented along Y, rotated +extension_angle (upper layer)
        color("SteelBlue", 0.9)
        translate([x_pos, 0, z_upper])
            rotate([0, 0, 90 + extension_angle])
                scissor_arm();
        
        // Arm B — oriented along Y, rotated -extension_angle (lower layer), crossing arm A
        color("SlateGray", 0.85)
        translate([x_pos, 0, z_lower])
            rotate([0, 0, 90 - extension_angle])
                scissor_arm();
    }
    
    // --- Crossbars at each end (connect all arm endpoints) ---
    // Arms extend along Y, so endpoints are at Y offsets.
    // Crossbars run along X (perpendicular to travel = truck axle direction).
    
    rear_y = -arm_half * cos(extension_angle);
    front_y = arm_half * cos(extension_angle);
    
    // Upper crossbars (at arm A endpoint height)
    color("CadetBlue", 0.9) {
        translate([0, rear_y, z_upper])
            crossbar();
        translate([0, front_y, z_upper])
            crossbar();
    }
    
    // Lower crossbars (at arm B endpoint height)
    color("DarkSlateGray", 0.85) {
        translate([0, rear_y, z_lower])
            crossbar();
        translate([0, front_y, z_lower])
            crossbar();
    }
    
    // --- Foot platforms on top of the upper crossbars (rider stands here) ---
    top_z = z_upper + arm_thickness/2 + foot_platform_thickness/2;
    
    color("DodgerBlue", 0.8) {
        // Rear foot platform
        translate([0, rear_y, top_z])
            rotate([0, 0, 90])
                foot_platform();
        
        // Front foot platform
        translate([0, front_y, top_z])
            rotate([0, 0, 90])
                foot_platform();
    }
    
    // --- Truck mount brackets below the lower crossbars ---
    bottom_z = z_lower - arm_thickness/2 - truck_bracket_thickness/2;
    
    color("DimGray", 0.9) {
        // Rear truck bracket
        translate([0, rear_y, bottom_z])
            rotate([0, 0, 90])
                truck_mount_bracket();
        
        // Front truck bracket
        translate([0, front_y, bottom_z])
            rotate([0, 0, 90])
                truck_mount_bracket();
    }
}

// ========================================
// COLLAPSED ASSEMBLY
// ========================================

// Full mechanism in collapsed (portable) position.
// Arms are nearly perpendicular to Y in XY plane, crossbars stack close together.
module scissor_mechanism_collapsed() {
    z_upper = arm_thickness / 2;
    z_lower = -arm_thickness / 2;
    
    // --- Scissor arm X-pairs ---
    // Arms oriented along Y, collapse by rotating toward X.
    for (pair = [0 : num_scissor_pairs - 1]) {
        x_pos = (pair - (num_scissor_pairs - 1) / 2) * (arm_width + arm_spacing);
        
        color("SteelBlue", 0.9)
        translate([x_pos, 0, z_upper])
            rotate([0, 0, 90 + collapse_angle])
                scissor_arm();
        
        color("SlateGray", 0.85)
        translate([x_pos, 0, z_lower])
            rotate([0, 0, 90 - collapse_angle])
                scissor_arm();
    }
    
    // Collapsed crossbar positions (endpoints close together along Y)
    collapsed_y = arm_half * cos(collapse_angle);
    
    // Upper crossbars
    color("CadetBlue", 0.9) {
        translate([0, -collapsed_y, z_upper])
            crossbar();
        translate([0, collapsed_y, z_upper])
            crossbar();
    }
    
    // Lower crossbars
    color("DarkSlateGray", 0.85) {
        translate([0, -collapsed_y, z_lower])
            crossbar();
        translate([0, collapsed_y, z_lower])
            crossbar();
    }
    
    // Foot platforms rest on top
    top_z = z_upper + arm_thickness/2 + foot_platform_thickness/2;
    color("DodgerBlue", 0.8) {
        translate([0, -collapsed_y, top_z])
            rotate([0, 0, 90])
                foot_platform();
        translate([0, collapsed_y, top_z])
            rotate([0, 0, 90])
                foot_platform();
    }
    
    // Truck brackets below
    bottom_z = z_lower - arm_thickness/2 - truck_bracket_thickness/2;
    color("DimGray", 0.9) {
        translate([0, -collapsed_y, bottom_z])
            rotate([0, 0, 90])
                truck_mount_bracket();
        translate([0, collapsed_y, bottom_z])
            rotate([0, 0, 90])
                truck_mount_bracket();
    }
}
