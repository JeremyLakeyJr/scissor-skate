# Example Configurations for Scissor-Skate

This file contains pre-configured parameter sets for different use cases. Copy these into the main `scissor_skate.scad` file to quickly try different designs.

## Configuration 1: Compact Commuter (Default)

Perfect for daily commuting and easy storage in a backpack.

```openscad
// Skateboard dimensions
deck_length_extended = 24 * 25.4;   // 24 inches (61cm)
deck_width = 9 * 25.4;               // 9 inches (23cm)
deck_thickness = 6;                  // 6mm platform

// Collapsed dimensions
collapsed_length = 13 * 25.4;        // 13 inches (33cm)
collapsed_height = 80;               // 80mm vertical height

// Scissor mechanism
num_scissor_pairs = 2;               // 2 pairs of arms
arm_width = 20;                      // 20mm arm width
arm_thickness = 4;                   // 4mm arm thickness
pivot_diameter = 6;                  // 6mm pivots
pivot_tolerance = 0.3;               // 0.3mm clearance

// Deck surface
deck_concave_depth = 8;              // 8mm concave
deck_nose_tail_curve = 15;           // 15mm nose/tail kick

// Truck mounting
truck_wheelbase = 15 * 25.4;         // 15 inches (38cm)
truck_mounting_hole_diameter = 5;    // 5mm holes
truck_mounting_pattern_width = 2.125 * 25.4;  // Standard pattern

// Locking mechanism
locking_pin_diameter = 8;            // 8mm locking pins
locking_slot_width = 10;             // 10mm slots
```

## Configuration 2: Cruiser Board

Longer, more stable ride for casual cruising.

```openscad
// Skateboard dimensions
deck_length_extended = 28 * 25.4;   // 28 inches (71cm) - LONGER
deck_width = 9.5 * 25.4;             // 9.5 inches (24cm) - WIDER
deck_thickness = 7;                  // 7mm platform - THICKER

// Collapsed dimensions
collapsed_length = 15 * 25.4;        // 15 inches (38cm)
collapsed_height = 90;               // 90mm vertical height

// Scissor mechanism
num_scissor_pairs = 3;               // 3 pairs - STRONGER
arm_width = 22;                      // 22mm arm width - WIDER
arm_thickness = 5;                   // 5mm arm thickness - THICKER
pivot_diameter = 7;                  // 7mm pivots - LARGER
pivot_tolerance = 0.3;               // 0.3mm clearance

// Deck surface
deck_concave_depth = 10;             // 10mm concave - DEEPER
deck_nose_tail_curve = 18;           // 18mm nose/tail kick

// Truck mounting
truck_wheelbase = 18 * 25.4;         // 18 inches (46cm) - LONGER
truck_mounting_hole_diameter = 5;
truck_mounting_pattern_width = 2.125 * 25.4;

// Locking mechanism
locking_pin_diameter = 9;            // 9mm locking pins - LARGER
locking_slot_width = 11;             // 11mm slots
```

## Configuration 3: Mini Pocket Board

Ultra-compact for maximum portability.

```openscad
// Skateboard dimensions
deck_length_extended = 20 * 25.4;   // 20 inches (51cm) - SHORTER
deck_width = 8 * 25.4;               // 8 inches (20cm) - NARROWER
deck_thickness = 5;                  // 5mm platform - THINNER

// Collapsed dimensions
collapsed_length = 11 * 25.4;        // 11 inches (28cm) - VERY COMPACT
collapsed_height = 70;               // 70mm vertical height

// Scissor mechanism
num_scissor_pairs = 2;               // 2 pairs
arm_width = 18;                      // 18mm arm width - NARROWER
arm_thickness = 4;                   // 4mm arm thickness
pivot_diameter = 5;                  // 5mm pivots - SMALLER
pivot_tolerance = 0.3;               // 0.3mm clearance

// Deck surface
deck_concave_depth = 6;              // 6mm concave - SHALLOW
deck_nose_tail_curve = 12;           // 12mm nose/tail kick

// Truck mounting
truck_wheelbase = 12 * 25.4;         // 12 inches (30cm) - SHORTER
truck_mounting_hole_diameter = 5;
truck_mounting_pattern_width = 2.125 * 25.4;

// Locking mechanism
locking_pin_diameter = 7;            // 7mm locking pins
locking_slot_width = 9;              // 9mm slots
```

## Configuration 4: Heavy-Duty Longboard

Maximum strength for heavier riders or rough terrain.

```openscad
// Skateboard dimensions
deck_length_extended = 32 * 25.4;   // 32 inches (81cm) - LONGBOARD
deck_width = 10 * 25.4;              // 10 inches (25cm) - WIDE
deck_thickness = 8;                  // 8mm platform - VERY THICK

// Collapsed dimensions
collapsed_length = 17 * 25.4;        // 17 inches (43cm)
collapsed_height = 100;              // 100mm vertical height

// Scissor mechanism
num_scissor_pairs = 4;               // 4 pairs - MAXIMUM STRENGTH
arm_width = 25;                      // 25mm arm width - WIDE
arm_thickness = 6;                   // 6mm arm thickness - VERY THICK
pivot_diameter = 8;                  // 8mm pivots - LARGE
pivot_tolerance = 0.3;               // 0.3mm clearance

// Deck surface
deck_concave_depth = 12;             // 12mm concave - DEEP
deck_nose_tail_curve = 20;           // 20mm nose/tail kick

// Truck mounting
truck_wheelbase = 22 * 25.4;         // 22 inches (56cm) - LONG
truck_mounting_hole_diameter = 5;
truck_mounting_pattern_width = 2.125 * 25.4;

// Locking mechanism
locking_pin_diameter = 10;           // 10mm locking pins - LARGE
locking_slot_width = 12;             // 12mm slots
```

## Material Recommendations by Configuration

| Configuration | Recommended Filament | Infill | Notes |
|--------------|---------------------|--------|-------|
| Compact Commuter | PLA or PETG | 40-50% | Good for riders up to 160 lbs |
| Cruiser Board | PETG or Nylon | 50-60% | Good for riders up to 180 lbs |
| Mini Pocket | PLA | 30-40% | Lightweight, riders up to 140 lbs |
| Heavy-Duty | Nylon or CF-PETG | 60-80% | Riders up to 220+ lbs |

## Print Time Estimates

Based on 0.2mm layer height, 50% infill:

- **Compact Commuter**: ~35 hours total
- **Cruiser Board**: ~45 hours total  
- **Mini Pocket**: ~25 hours total
- **Heavy-Duty**: ~60 hours total

## Filament Usage Estimates

- **Compact Commuter**: ~600g
- **Cruiser Board**: ~800g
- **Mini Pocket**: ~400g
- **Heavy-Duty**: ~1200g

## Quick Switching Between Configurations

To quickly try a different configuration:

1. Open `scissor_skate.scad`
2. Find the "MAIN PARAMETERS" section (around line 20)
3. Copy the desired configuration from this file
4. Paste over the existing parameters
5. Press F5 to preview the changes
6. If satisfied, press F6 to render
7. Export STL files

## Custom Configuration Tips

### For Taller/Shorter Riders
- Taller riders: Increase `deck_length_extended` by 2-4 inches
- Shorter riders: Decrease by 2-3 inches
- Adjust `truck_wheelbase` proportionally (60-70% of deck length)

### For More/Less Concave
- Standard skateboards: 6-8mm concave
- Street skating: 8-12mm concave (more control)
- Cruising: 4-6mm concave (more comfort)

### For Different Wheel Sizes
- Small wheels (50-54mm): Use mini or compact config
- Medium wheels (55-60mm): Use commuter or cruiser config
- Large wheels (65mm+): Use cruiser or heavy-duty config

### For Improved Portability
- Minimize `collapsed_length` (but keep > 50% of extended length)
- Reduce `collapsed_height` (but keep structural integrity)
- Reduce `deck_thickness` slightly (minimum 5mm recommended)

### For Maximum Strength
- Increase `num_scissor_pairs` (3-4 pairs)
- Increase `arm_thickness` (5-7mm)
- Increase `arm_width` (22-28mm)
- Increase `deck_thickness` (7-10mm)
- Use higher infill (60-80%)
- Use stronger materials (Nylon, carbon fiber reinforced)

## Testing Your Configuration

Before committing to a full print:

1. **Quick Preview** (F5): Check proportions visually
2. **Print One Scissor Arm**: Test mechanism scale
3. **Print Pivot Pins**: Verify tolerance fit
4. **Full Render** (F6): Check for errors
5. **Measure STL**: Verify dimensions in slicer
6. **Print Remaining Parts**: Once validated

Happy customizing! 🎨
