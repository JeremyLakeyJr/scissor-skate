# Example Configurations for Scissor-Skate

This file contains pre-configured parameter sets for different use cases. Copy these into the main `scissor_skate.scad` file to quickly try different designs.

## Configuration 1: Compact Commuter (Default)

Perfect for daily commuting and easy storage in a backpack.

```openscad
// Overall board dimensions (when extended)
deck_length_extended = 24 * 25.4;   // 24 inches (61cm)
deck_width = 9 * 25.4;               // 9 inches (23cm)

// Collapsed dimensions
collapsed_length = 13 * 25.4;        // 13 inches (33cm)
collapsed_height = 80;               // 80mm vertical height

// Scissor mechanism (arms ARE the riding surface)
num_scissor_pairs = 3;               // 3 side-by-side pairs for width
arm_width = 60;                      // 60mm arm width
arm_thickness = 8;                   // 8mm arm thickness
arm_spacing = 5;                     // 5mm gap between arm pairs
pivot_diameter = 8;                  // 8mm pivots
pivot_tolerance = 0.3;               // 0.3mm clearance

// Foot platforms (flat pads on top of scissor arms)
foot_platform_length = 100;          // 100mm foot pad length
foot_platform_width = 200;           // 200mm foot pad width
foot_platform_thickness = 4;         // 4mm platform thickness
grip_texture_depth = 1;              // 1mm grip texture

// Truck mounting (brackets at scissor endpoints)
truck_mounting_hole_diameter = 5;    // 5mm holes
truck_mounting_pattern_width = 2.125 * 25.4;  // Standard pattern
truck_bracket_thickness = 6;         // 6mm bracket thickness

// Locking mechanism
locking_pin_diameter = 8;            // 8mm locking pins
locking_slot_width = 10;             // 10mm slots
```

## Configuration 2: Cruiser Board

Longer, more stable ride for casual cruising.

```openscad
// Overall board dimensions (when extended)
deck_length_extended = 28 * 25.4;   // 28 inches (71cm) - LONGER
deck_width = 9.5 * 25.4;             // 9.5 inches (24cm) - WIDER

// Collapsed dimensions
collapsed_length = 15 * 25.4;        // 15 inches (38cm)
collapsed_height = 90;               // 90mm vertical height

// Scissor mechanism (arms ARE the riding surface)
num_scissor_pairs = 4;               // 4 side-by-side pairs - WIDER
arm_width = 65;                      // 65mm arm width - WIDER
arm_thickness = 9;                   // 9mm arm thickness - THICKER
arm_spacing = 5;                     // 5mm gap between arm pairs
pivot_diameter = 9;                  // 9mm pivots - LARGER
pivot_tolerance = 0.3;               // 0.3mm clearance

// Foot platforms (flat pads on top of scissor arms)
foot_platform_length = 120;          // 120mm foot pad length - LONGER
foot_platform_width = 220;           // 220mm foot pad width - WIDER
foot_platform_thickness = 5;         // 5mm platform thickness - THICKER
grip_texture_depth = 1;              // 1mm grip texture

// Truck mounting (brackets at scissor endpoints)
truck_mounting_hole_diameter = 5;
truck_mounting_pattern_width = 2.125 * 25.4;
truck_bracket_thickness = 7;         // 7mm bracket thickness - THICKER

// Locking mechanism
locking_pin_diameter = 9;            // 9mm locking pins - LARGER
locking_slot_width = 11;             // 11mm slots
```

## Configuration 3: Mini Pocket Board

Ultra-compact for maximum portability.

```openscad
// Overall board dimensions (when extended)
deck_length_extended = 20 * 25.4;   // 20 inches (51cm) - SHORTER
deck_width = 8 * 25.4;               // 8 inches (20cm) - NARROWER

// Collapsed dimensions
collapsed_length = 11 * 25.4;        // 11 inches (28cm) - VERY COMPACT
collapsed_height = 70;               // 70mm vertical height

// Scissor mechanism (arms ARE the riding surface)
num_scissor_pairs = 2;               // 2 side-by-side pairs - NARROWER
arm_width = 50;                      // 50mm arm width - NARROWER
arm_thickness = 7;                   // 7mm arm thickness - THINNER
arm_spacing = 5;                     // 5mm gap between arm pairs
pivot_diameter = 7;                  // 7mm pivots - SMALLER
pivot_tolerance = 0.3;               // 0.3mm clearance

// Foot platforms (flat pads on top of scissor arms)
foot_platform_length = 80;           // 80mm foot pad length - SHORTER
foot_platform_width = 160;           // 160mm foot pad width - NARROWER
foot_platform_thickness = 3;         // 3mm platform thickness - THINNER
grip_texture_depth = 0.8;            // 0.8mm grip texture

// Truck mounting (brackets at scissor endpoints)
truck_mounting_hole_diameter = 5;
truck_mounting_pattern_width = 2.125 * 25.4;
truck_bracket_thickness = 5;         // 5mm bracket thickness

// Locking mechanism
locking_pin_diameter = 7;            // 7mm locking pins
locking_slot_width = 9;              // 9mm slots
```

## Configuration 4: Heavy-Duty Longboard

Maximum strength for heavier riders or rough terrain.

```openscad
// Overall board dimensions (when extended)
deck_length_extended = 32 * 25.4;   // 32 inches (81cm) - LONGBOARD
deck_width = 10 * 25.4;              // 10 inches (25cm) - WIDE

// Collapsed dimensions
collapsed_length = 17 * 25.4;        // 17 inches (43cm)
collapsed_height = 100;              // 100mm vertical height

// Scissor mechanism (arms ARE the riding surface)
num_scissor_pairs = 5;               // 5 side-by-side pairs - MAXIMUM WIDTH
arm_width = 70;                      // 70mm arm width - WIDE
arm_thickness = 10;                  // 10mm arm thickness - VERY THICK
arm_spacing = 5;                     // 5mm gap between arm pairs
pivot_diameter = 10;                 // 10mm pivots - LARGE
pivot_tolerance = 0.3;               // 0.3mm clearance

// Foot platforms (flat pads on top of scissor arms)
foot_platform_length = 130;          // 130mm foot pad length - LONGER
foot_platform_width = 240;           // 240mm foot pad width - WIDER
foot_platform_thickness = 6;         // 6mm platform thickness - THICK
grip_texture_depth = 1.2;            // 1.2mm grip texture - DEEPER

// Truck mounting (brackets at scissor endpoints)
truck_mounting_hole_diameter = 5;
truck_mounting_pattern_width = 2.125 * 25.4;
truck_bracket_thickness = 8;         // 8mm bracket thickness - THICK

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

Based on 0.2mm layer height, 50% infill. All parts print flat without supports.

- **Compact Commuter**: ~30 hours total
- **Cruiser Board**: ~40 hours total
- **Mini Pocket**: ~20 hours total
- **Heavy-Duty**: ~55 hours total

## Filament Usage Estimates

- **Compact Commuter**: ~500g
- **Cruiser Board**: ~700g
- **Mini Pocket**: ~350g
- **Heavy-Duty**: ~1100g

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
- Adjust `foot_platform_length` proportionally for comfort

### For More/Less Grip
- More grip: Increase `grip_texture_depth` (1-1.5mm)
- Less grip: Decrease `grip_texture_depth` (0.5-0.8mm)
- Wider foot pads: Increase `foot_platform_width`

### For Different Wheel Sizes
- Small wheels (50-54mm): Use mini or compact config
- Medium wheels (55-60mm): Use commuter or cruiser config
- Large wheels (65mm+): Use cruiser or heavy-duty config

### For Improved Portability
- Minimize `collapsed_length` (but keep > 50% of extended length)
- Reduce `collapsed_height` (but keep structural integrity)
- Reduce `num_scissor_pairs` (minimum 2 recommended)

### For Maximum Strength
- Increase `num_scissor_pairs` (4-5 pairs)
- Increase `arm_thickness` (9-12mm)
- Increase `arm_width` (65-80mm)
- Increase `foot_platform_thickness` (5-7mm)
- Use higher infill (60-80%)
- Use stronger materials (Nylon, carbon fiber reinforced)

## Testing Your Configuration

Before committing to a full print:

1. **Quick Preview** (F5): Check proportions visually
2. **Print One Scissor Arm**: Test mechanism scale and fit
3. **Print Pivot Pins**: Verify tolerance fit
4. **Print One Foot Platform**: Check comfort and grip texture
5. **Full Render** (F6): Check for errors
6. **Measure STL**: Verify dimensions in slicer
7. **Print Remaining Parts**: Once validated

Happy customizing! 🎨
