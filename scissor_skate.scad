/*
 * Collapsible Skateboard with Scissor-Lift Mechanism
 * 
 * DESIGN: No separate top or bottom deck. The rider stands directly
 * on the scissor-lift mechanism itself. Wide, sturdy scissor arms
 * with foot platforms serve as the riding surface. Truck mount
 * brackets attach at the outermost scissor arm endpoints via crossbars.
 * 
 * Key Features:
 * - Collapsed: ~11-15" long × 8-9" wide × 2-4" thick
 * - Extended: ~20-28" long × 8-10" wide (rideable)
 * - Stand directly on the scissor mechanism while skating
 * - Foot platforms with grip texture on top of crossbars
 * - Truck brackets below crossbars at scissor endpoints
 * - Crossbars connect all side-by-side arm pairs at each end
 * - Locking pin holes in arms and crossbars to secure extended position
 * - Fully parametric design - adjust all dimensions via variables
 * - 3D printable (PLA, PETG, or similar materials)
 * - All parts designed for real assembly with pivot pins and bolts
 *
 * Component files are in the components/ directory:
 *   - components/parameters.scad        : All configurable parameters
 *   - components/scissor_mechanism.scad : Arms, crossbars, foot platforms, truck brackets
 *   - components/pivot_pin.scad         : Pivot pin for joints
 *   - components/lock_mechanism.scad    : Locking pin for extended position
 *   - components/truck_mounting.scad    : Truck mounting hole pattern
 */

// ========================================
// INCLUDE COMPONENT FILES
// ========================================

include <components/parameters.scad>
use <components/scissor_mechanism.scad>
use <components/pivot_pin.scad>
use <components/lock_mechanism.scad>

// ========================================
// RENDERING OPTIONS
// ========================================

// Render modes for individual component export or full assembly view.
// "assembly"       — full assembled board (use show_extended to toggle position)
// "exploded"       — exploded view showing all parts separated for assembly reference
// "scissor_arms"   — single arm pair for printing
// "crossbar"       — single crossbar for printing
// "foot_platform"  — single foot platform for printing
// "truck_bracket"  — single truck mount bracket for printing
// "pivot_pins"     — single pivot pin for printing
// "lock_mechanism" — single locking pin for printing
render_mode = "assembly";
show_extended = true;      // true = extended position, false = collapsed position
show_wheels = true;        // Show example wheels for visualization (assembly mode only)

// ========================================
// MAIN RENDER SWITCH
// ========================================

if (render_mode == "assembly") {
    assembly();
} else if (render_mode == "exploded") {
    exploded_view();
} else if (render_mode == "scissor_arms") {
    scissor_arm_pair();
} else if (render_mode == "crossbar") {
    crossbar();
} else if (render_mode == "foot_platform") {
    foot_platform();
} else if (render_mode == "truck_bracket") {
    truck_mount_bracket();
} else if (render_mode == "pivot_pins") {
    pivot_pin();
} else if (render_mode == "lock_mechanism") {
    locking_pin();
}

// ========================================
// ASSEMBLY MODULE
// ========================================

module assembly() {
    if (show_extended) {
        // Extended position — rider stands on the scissor mechanism
        scissor_mechanism_extended();
        
        // Optional: Show wheels for visualization
        if (show_wheels) {
            wheel_diameter = 56; // mm (typical skateboard wheel)
            
            // Calculate truck bracket positions (must match scissor_mechanism_extended)
            // Board extends along Y; trucks at Y endpoints with axles along X
            rear_y = -arm_half * cos(extension_angle);
            front_y = arm_half * cos(extension_angle);
            z_lower = -arm_thickness / 2;
            
            // Truck brackets are flat below the lower crossbars
            truck_z = z_lower - arm_thickness/2 - truck_bracket_thickness - wheel_diameter/2;
            
            color("DimGray", 0.6) {
                // Rear wheels (at rear_y, offset along X for truck axle width)
                translate([-total_mechanism_width/2 - 15, rear_y, truck_z])
                    rotate([0, 90, 0]) cylinder(h=10, d=wheel_diameter, center=true, $fn=32);
                translate([total_mechanism_width/2 + 15, rear_y, truck_z])
                    rotate([0, 90, 0]) cylinder(h=10, d=wheel_diameter, center=true, $fn=32);
                // Front wheels (at front_y, offset along X for truck axle width)
                translate([-total_mechanism_width/2 - 15, front_y, truck_z])
                    rotate([0, 90, 0]) cylinder(h=10, d=wheel_diameter, center=true, $fn=32);
                translate([total_mechanism_width/2 + 15, front_y, truck_z])
                    rotate([0, 90, 0]) cylinder(h=10, d=wheel_diameter, center=true, $fn=32);
            }
        }
    } else {
        // Collapsed position
        scissor_mechanism_collapsed();
    }
}

// ========================================
// EXPLODED VIEW — for assembly reference
// ========================================

// Shows all individual parts separated vertically so the builder
// can see how they stack and connect.
module exploded_view() {
    explode_gap = 40;  // mm gap between layers in exploded view
    
    // Layer 1 (top): Foot platforms
    color("DodgerBlue", 0.8) {
        translate([-80, 0, explode_gap * 4])
            foot_platform();
        translate([80, 0, explode_gap * 4])
            foot_platform();
    }
    
    // Layer 2: Upper crossbars
    color("CadetBlue", 0.9) {
        translate([-80, 0, explode_gap * 3])
            rotate([0, 0, 90]) crossbar();
        translate([80, 0, explode_gap * 3])
            rotate([0, 0, 90]) crossbar();
    }
    
    // Layer 3: Scissor arms (one X-pair shown flat)
    color("SteelBlue", 0.9)
    translate([0, 0, explode_gap * 2])
        scissor_arm();
    color("SlateGray", 0.85)
    translate([0, 0, explode_gap * 1.5])
        scissor_arm();
    
    // Layer 4: Lower crossbars
    color("DarkSlateGray", 0.85) {
        translate([-80, 0, explode_gap * 0.5])
            rotate([0, 0, 90]) crossbar();
        translate([80, 0, explode_gap * 0.5])
            rotate([0, 0, 90]) crossbar();
    }
    
    // Layer 5 (bottom): Truck mount brackets
    color("DimGray", 0.9) {
        translate([-80, 0, -explode_gap * 0.5])
            truck_mount_bracket();
        translate([80, 0, -explode_gap * 0.5])
            truck_mount_bracket();
    }
    
    // Pivot pins and locking pins shown to the side
    color("Gold", 0.9) {
        translate([200, -40, explode_gap * 2])
            pivot_pin();
        translate([200, 0, explode_gap * 2])
            pivot_pin();
        translate([200, 40, explode_gap * 2])
            pivot_pin();
    }
    
    color("OrangeRed", 0.9)
    translate([200, 0, explode_gap * 0.5])
        locking_pin();
}

// ========================================
// UTILITY FUNCTIONS
// ========================================

// Helper function for smooth transitions
function ease_in_out(t) = t < 0.5 ? 2*t*t : -1+(4-2*t)*t;

// End of file
