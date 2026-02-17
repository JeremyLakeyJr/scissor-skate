/*
 * Scissor-Skate: Shared Parameters
 *
 * All configurable parameters for the collapsible skateboard design.
 * Include this file in any component that needs access to global dimensions.
 *
 * Design concept: No separate top or bottom deck platforms. The rider
 * stands directly on the scissor mechanism itself. Wide scissor arms
 * with integrated foot platforms serve as the riding surface.
 * Truck mount brackets attach at the scissor arm endpoints.
 *
 * Assembly overview (extended position, side view):
 *
 *       [foot platform]        [foot platform]
 *     ----====----    ----====----
 *        \  /  X  \  /
 *         \/    \  \/
 *         /\    /  /\
 *        /  \  X  /  \
 *     [truck]--------[truck]
 *
 * Each "X" is a pair of crossing arms connected at the center pivot.
 * Multiple X-pairs sit side-by-side (Y axis) for board width.
 */

// ========================================
// MAIN PARAMETERS - Adjust these for customization
// ========================================

// Overall board dimensions (when extended)
deck_length_extended = 24 * 25.4;  // 24 inches in mm (rideable length)
deck_width = 9 * 25.4;              // 9 inches in mm

// Collapsed dimensions
collapsed_length = 13 * 25.4;       // ~13 inches when folded
collapsed_height = 80;              // mm (vertical height when collapsed)

// Scissor mechanism parameters (arms ARE the deck)
num_scissor_pairs = 3;              // Number of scissor arm pairs (side by side for width)
arm_width = 60;                     // mm (wide arms - these are the riding surface)
arm_thickness = 8;                  // mm (thick for strength - rider stands on these)
arm_spacing = 5;                    // mm (gap between parallel arm pairs)
pivot_diameter = 8;                 // mm (diameter of pivot holes - larger for strength)
// pivot_tolerance (default 0.3): Calibrate per printer/filament—print a
// single joint test first and adjust 0.1–0.5 mm for smooth rotation with
// minimal slop. Lower values (0.1–0.2) suit resin or well-tuned FDM;
// higher values (0.4–0.5) may be needed for low-res or fast prints.
pivot_tolerance = 0.3;              // mm (clearance for pivots)

// --- Metal shoulder-bolt pivot parameters ---
// For production use, replace print-in-place pins with metal shoulder bolts.
// Recommended: M5 × 10 mm shoulder bolt (or 10-24 × 3/8" for imperial).
pivot_bolt_dia = 5;                 // mm (shoulder bolt shank diameter, e.g. M5)
pivot_clearance = 0.2;              // mm (extra clearance around bolt shank)
shoulder_length = 10;               // mm (length of shoulder/shank portion)
bolt_head_dia = 8;                  // mm (bolt head or washer outer diameter)
bolt_head_height = 3.5;             // mm (bolt head recess depth)

// Foot platform parameters (flat pads on top of scissor arms)
foot_platform_length = 100;         // mm (length of each foot pad along X)
foot_platform_width = 200;          // mm (width spanning across arm pairs along Y)
foot_platform_thickness = 4;        // mm (thin platform on top of arms)
grip_texture_depth = 1;             // mm (grip texture height)

// Ergonomic foot platform options
foot_concave_depth = 1.5;           // mm (gentle bowl/concave depth on platform surface)
kick_angle = 5;                     // degrees (nose/tail kick ramp angle)
kick_length = 30;                   // mm (length of kick ramp at platform ends)

// Truck mounting parameters (mounted at scissor endpoints)
truck_mounting_hole_diameter = 5;   // mm
truck_mounting_pattern_width = 2.125 * 25.4; // Standard truck pattern
truck_bracket_thickness = 6;        // mm

// Locking mechanism
locking_pin_diameter = 8;           // mm
locking_slot_width = 10;            // mm

// Print settings
layer_height = 0.2;                 // mm
nozzle_diameter = 0.4;              // mm
wall_thickness = 2.4;               // mm (nozzle_diameter * 6)

// ========================================
// CALCULATED VALUES
// ========================================

// Each scissor arm length (half-span minus clearance)
scissor_arm_length = deck_length_extended / 2 - 20;

// Half-length from center pivot to endpoint
arm_half = scissor_arm_length / 2 - arm_width / 2;

// Extension angle: when extended, arms are nearly flat
// The arm endpoint height offset = arm_half * sin(angle)
// The arm endpoint horizontal offset = arm_half * cos(angle)
extension_angle = 15;   // degrees from horizontal when extended

// Collapse angle: arms nearly vertical
collapse_angle = 70;    // degrees from horizontal when collapsed

// Effective half-span when extended (center pivot to arm endpoint, horizontal)
extended_half_span = arm_half * cos(extension_angle);

// Height from center pivot to arm endpoint when extended
extended_height = arm_half * sin(extension_angle);

// Total mechanism width (all arm pairs side-by-side)
total_mechanism_width = num_scissor_pairs * arm_width + (num_scissor_pairs - 1) * arm_spacing;

// Extension ratio
extension_ratio = deck_length_extended / collapsed_length;
