# Scissor-Skate: Collapsible Skateboard Deck

A portable, collapsible skateboard deck incorporating a scissor-lift (pantograph) mechanism that folds and unfolds for compact storage and transport.

## 📐 Design Specifications

### Collapsed Dimensions
- **Length**: ~11-15 inches (279-381mm)
- **Width**: ~8-9 inches (203-229mm)
- **Thickness**: 2-4 inches (51-102mm)
- **Profile**: Slim elongated pack, fits lengthwise in backpack

### Extended Dimensions
- **Length**: ~20-28 inches (508-711mm) - full rideable skateboard
- **Width**: ~8-10 inches (203-254mm)
- **Profile**: Standard skateboard deck platform

## 🎯 Features

- **Parametric OpenSCAD Design**: Fully customizable through variables
- **Scissor-Lift Mechanism**: Pantograph design for smooth folding/unfolding
- **3D Printable**: Designed for PLA, PETG, or tougher filaments
- **Print-in-Place or Modular**: Options for smooth pivoting joints
- **Integrated Truck Mounts**: Standard skateboard truck mounting patterns
- **Manual Locking System**: Screw/pin mechanism for secure riding position
- **Lightweight Structure**: Weight reduction features built-in
- **Concave Deck Surface**: Comfortable riding profile

## 🛠️ Building Your Scissor-Skate

### Prerequisites

- **OpenSCAD** (latest version recommended): https://openscad.org/downloads.html
- **3D Printer** with build volume at least 250mm x 250mm
- **3D Printing Filament**: 
  - PLA (easiest to print, rigid)
  - PETG (more durable, slight flex)
  - Nylon or TPU blends (for high-strength applications)

### Step 1: Customize the Design

Open `scissor_skate.scad` in OpenSCAD and adjust the parameters at the top of the file:

```openscad
// Skateboard dimensions
deck_length_extended = 24 * 25.4;  // 24 inches in mm
deck_width = 9 * 25.4;              // 9 inches in mm

// Collapsed dimensions  
collapsed_length = 13 * 25.4;       // ~13 inches when folded

// Scissor mechanism
num_scissor_pairs = 2;              // Number of scissor arm pairs
arm_width = 20;                     // mm
arm_thickness = 4;                  // mm

// Deck surface
deck_concave_depth = 8;             // mm
deck_nose_tail_curve = 15;          // mm

// Truck mounting
truck_wheelbase = 15 * 25.4;        // 15 inches between trucks
```

### Step 2: Render Individual Components

Change the `render_mode` variable to export different parts:

```openscad
render_mode = "deck_top";      // Options: "assembly", "deck_top", "deck_bottom", 
                                // "scissor_arms", "pivot_pins", "lock_mechanism"
```

#### Components to Print:

1. **Deck Top Platform** (`render_mode = "deck_top"`)
   - Main riding surface with concave and truck mounts
   - May need to be split into multiple pieces if larger than your print bed

2. **Deck Bottom Platform** (`render_mode = "deck_bottom"`)
   - Lower structural platform
   - Includes weight reduction features

3. **Scissor Arms** (`render_mode = "scissor_arms"`)
   - Print 4 arms per pair (2 pairs minimum)
   - Print quantity: `num_scissor_pairs * 4`

4. **Pivot Pins** (`render_mode = "pivot_pins"`)
   - Connect scissor arms to deck and each other
   - Print quantity: ~6-8 pins per scissor pair

5. **Locking Pins** (`render_mode = "lock_mechanism"`)
   - Secures the deck in extended position
   - Print quantity: 2-4 pins

### Step 3: Export STL Files

For each component:

1. Set the appropriate `render_mode`
2. Press **F6** to render (may take a few minutes)
3. **File → Export → Export as STL**
4. Save with descriptive name (e.g., `deck_top.stl`, `scissor_arm.stl`)

### Step 4: 3D Printing Settings

#### Recommended Settings:
```
Layer Height: 0.2mm (0.3mm for faster, less detailed prints)
Infill: 30-50% (higher for structural parts)
Wall Count: 4-6 perimeters
Top/Bottom Layers: 5-6 layers
Support: Yes (for deck platforms)
Adhesion: Brim recommended for larger parts
```

#### Print Order:
1. Start with one scissor arm to test pivot hole tolerances
2. Print pivot pins and test fit
3. Adjust `pivot_tolerance` if needed (default 0.3mm)
4. Print remaining scissor arms
5. Print deck platforms (may need to split if too large)

### Step 5: Assembly

1. **Insert Pivot Pins**: Connect scissor arms at their pivot points
2. **Attach to Deck Platforms**: Connect scissor mechanism to top and bottom platforms using pivot pins
3. **Test Mechanism**: Ensure smooth folding/unfolding motion
4. **Add Locking Pins**: Install locking mechanism for extended position
5. **Mount Trucks and Wheels**: Use standard skateboard trucks and wheels

#### Tools Needed:
- Small mallet (for pressing in pivot pins if tight)
- Drill (if pivot holes need adjustment)
- Skateboard trucks and wheels
- Mounting hardware (bolts and nuts)

## 🎨 Customization Guide

### Adjusting Deck Size

Want a longer or shorter board? Modify these parameters:

```openscad
deck_length_extended = 28 * 25.4;  // Longer board (28 inches)
collapsed_length = 15 * 25.4;       // Adjust collapsed size proportionally
truck_wheelbase = 18 * 25.4;        // Adjust truck spacing
```

### Changing Concave Profile

```openscad
deck_concave_depth = 12;            // Deeper concave (12mm)
deck_nose_tail_curve = 20;          // More pronounced nose/tail kick
```

### Adjusting Mechanism Strength

```openscad
num_scissor_pairs = 3;              // More pairs = stronger, heavier
arm_thickness = 5;                  // Thicker arms = stronger, more rigid
arm_width = 25;                     // Wider arms = more stability
```

### Print Tolerance Adjustment

If pivots are too tight or too loose:

```openscad
pivot_tolerance = 0.4;              // Increase for looser fit
pivot_tolerance = 0.2;              // Decrease for tighter fit
```

## 📊 Technical Details

### Scissor Mechanism Design

The pantograph mechanism works by having crossing arms that pivot at:
- Fixed points on the deck platforms
- Center crossing points that slide
- Connection points that constrain the motion

When extended, the arms spread to their maximum angle (~25°), creating the full deck length.
When collapsed, the arms fold nearly vertical (~75°), reducing the overall length by approximately 50%.

### Material Requirements

For a standard build:
- **PLA/PETG Filament**: ~500-800g total
- **Print Time**: 30-50 hours total (depending on settings)
- **Skateboard Trucks**: 2 standard trucks
- **Wheels**: 4 skateboard wheels (52-60mm recommended)
- **Hardware**: 8 bolts and nuts for truck mounting

### Weight Capacity

Designed for riders up to 200 lbs (91 kg) when using:
- PETG or stronger filament
- 50% or higher infill
- 2+ scissor arm pairs
- Proper assembly

**Important**: Always test the mechanism with weights before riding. 3D printed parts may have limitations compared to traditional skateboard materials.

## ⚠️ Safety Warnings

1. **Prototype Testing**: Thoroughly test the locking mechanism before riding
2. **Material Selection**: Use appropriate filament for your weight and use case
3. **Regular Inspection**: Check for cracks or wear before each use
4. **Locking Verification**: Always ensure locking pins are fully engaged
5. **Start Slow**: Test the board at low speeds first
6. **Wear Protection**: Always wear helmet and pads

## 🔧 Troubleshooting

### Pivots Too Tight
- Increase `pivot_tolerance` by 0.1mm increments
- Sand pivot pins with fine sandpaper
- Use a drill to slightly enlarge pivot holes

### Pivots Too Loose
- Decrease `pivot_tolerance`
- Add small washers or O-rings to pivots
- Use thread-lock or glue on pivot pins

### Deck Too Flexible
- Increase infill percentage to 60-80%
- Add more wall perimeters (6-8)
- Increase `deck_thickness` parameter
- Add more scissor arm pairs

### Won't Lock in Extended Position
- Check locking pin alignment
- Verify all pivot pins are fully seated
- Adjust locking slot dimensions

## 📚 Resources

- **OpenSCAD Documentation**: https://openscad.org/documentation.html
- **3D Printing Guide**: https://all3dp.com/2/3d-printing-support-structures/
- **Skateboard Hardware Guide**: https://www.warehouseskateboards.com/help/Skateboard-Hardware-Mounting-Bolts-Size-Guide

## 🤝 Contributing

Feel free to fork this project and submit improvements! Some ideas:
- Alternative locking mechanisms
- Different deck shapes/profiles
- Optimized arm geometry
- Assembly jigs or tools
- Test results with different materials

## 📄 License

See LICENSE file for details.

## 🎓 Learning Resources

### Understanding Pantograph Mechanisms
- The scissor-lift mechanism is a type of pantograph - a mechanical linkage that creates linear motion
- Key principle: Opposing angles of crossing arms create extension/collapse along one axis
- Used in: Scissor lifts, adjustable desk lamps, folding tables

### OpenSCAD Basics
- Parametric design allows easy customization through variables
- CSG (Constructive Solid Geometry) modeling: union, difference, intersection
- Modular design: Separate modules for each component make editing easier

## 🏁 Quick Start

```bash
# 1. Clone this repository
git clone https://github.com/JeremyLakeyJr/scissor-skate.git
cd scissor-skate

# 2. Open in OpenSCAD
openscad scissor_skate.scad

# 3. Adjust parameters and render
# Press F5 for preview, F6 for full render

# 4. Export STL files for each component
# File → Export → Export as STL

# 5. Slice and print!
```

## 🎯 Next Steps

After building your first scissor-skate:
1. **Test the mechanism** - Ensure smooth operation
2. **Ride test** - Start with short, slow rides
3. **Iterate** - Adjust parameters based on your experience
4. **Share** - Post your build and improvements!

---

**Happy Building and Skating! 🛹**
