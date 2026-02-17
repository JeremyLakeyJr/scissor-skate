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
 *
 * Component files are in the components/ directory:
 *   - components/parameters.scad    : All configurable parameters
 *   - components/deck_surface.scad  : Deck surface shape module
 *   - components/truck_mounting.scad: Truck mounting hole pattern
 *   - components/deck_top.scad      : Top deck platform
 *   - components/deck_bottom.scad   : Bottom deck platform
 *   - components/scissor_mechanism.scad : Scissor arms and mechanism
 *   - components/pivot_pin.scad     : Pivot pin for joints
 *   - components/lock_mechanism.scad: Locking pin for extended position
 */

// ========================================
// INCLUDE COMPONENT FILES
// ========================================

include <components/parameters.scad>
use <components/deck_surface.scad>
use <components/truck_mounting.scad>
use <components/deck_top.scad>
use <components/deck_bottom.scad>
use <components/scissor_mechanism.scad>
use <components/pivot_pin.scad>
use <components/lock_mechanism.scad>

// ========================================
// RENDERING OPTIONS
// ========================================

render_mode = "assembly";  // Options: "assembly", "deck_top", "deck_bottom", "scissor_arms", "pivot_pins", "lock_mechanism"
show_extended = true;      // true = extended position, false = collapsed position
show_wheels = true;        // Show example wheels for visualization

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

// ========================================
// UTILITY FUNCTIONS
// ========================================

// Helper function for smooth transitions
function ease_in_out(t) = t < 0.5 ? 2*t*t : -1+(4-2*t)*t;

// End of file
