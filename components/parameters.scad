/*
 * Scissor-Skate: Shared Parameters
 *
 * All configurable parameters for the collapsible skateboard design.
 * Include this file in any component that needs access to global dimensions.
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
// CALCULATED VALUES
// ========================================

scissor_arm_length = deck_length_extended / 2 - 20; // Length of each scissor arm
extension_ratio = deck_length_extended / collapsed_length;
