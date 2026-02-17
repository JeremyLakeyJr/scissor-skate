# Quick Start Guide

Get your collapsible skateboard built in 5 steps!

## 🚀 5-Minute Setup

### Step 1: Install OpenSCAD (5 min)

**Windows:**
```
1. Download from https://openscad.org/downloads.html
2. Run installer
3. Launch OpenSCAD
```

**MacOS:**
```
brew install --cask openscad
# or download from https://openscad.org/downloads.html
```

**Linux:**
```bash
# Ubuntu/Debian
sudo apt-get install openscad

# Fedora
sudo dnf install openscad

# Arch
sudo pacman -S openscad
```

### Step 2: Open the Design (1 min)

```bash
# Clone or download this repository
git clone https://github.com/JeremyLakeyJr/scissor-skate.git
cd scissor-skate

# Open in OpenSCAD
openscad scissor_skate.scad
```

### Step 3: Preview Your Board (2 min)

In OpenSCAD:
1. Press **F5** to preview
2. Rotate view with mouse to inspect design
3. See your collapsible skateboard!

### Step 4: Customize (Optional, 5 min)

Edit the parameters at the top of `scissor_skate.scad`:

```openscad
deck_length_extended = 24 * 25.4;  // Change to 28 for longer board
deck_width = 9 * 25.4;              // Change to 10 for wider board
num_scissor_pairs = 3;              // Change to 4 for stronger/wider build
arm_width = 60;                     // mm — width of each arm (you stand on these)
arm_thickness = 8;                  // mm — thickness for rider weight
```

**Or** copy a pre-made config from `CONFIGURATIONS.md`

### Step 5: Export STL Files (10 min)

**Option A - Automated (Linux/Mac):**
```bash
./export_stls.sh
# STL files will be in ./stl_output/
```

**Option B - Manual:**

For each component:

1. Change `render_mode = "scissor_arms"` (or other component name)
2. Press **F6** to render (wait 2-5 minutes)
3. File → Export → Export as STL
4. Save as `scissor_arms.stl`

Repeat for:
- `scissor_arms` → `scissor_arms.stl`
- `crossbar` → `crossbar.stl`
- `foot_platform` → `foot_platform.stl`
- `truck_bracket` → `truck_bracket.stl`
- `pivot_pins` → `pivot_pins.stl`
- `lock_mechanism` → `lock_mechanism.stl`

**Tip:** Use `render_mode = "exploded"` to see how all parts fit together.

## 🖨️ Print Settings Cheat Sheet

### Quick Settings (works for most printers)
```
Material: PETG
Layer Height: 0.2mm
Infill: 50%
Supports: Yes
Brim: 8mm
Nozzle Temp: 235°C
Bed Temp: 80°C
```

### Print Quantities
- Scissor Arms: **12** (4 per pair, 3 pairs)
- Crossbars: **4** (2 upper + 2 lower)
- Foot Platforms: **2**
- Truck Mount Brackets: **2**
- Pivot Pins: **10-14**
- Locking Pins: **2-4**

### Print Time Estimate
- **Total**: ~27-35 hours
- **All Scissor Arms**: ~14 hours
- **Crossbars**: ~4 hours
- **Foot Platforms**: ~4 hours
- **Truck Brackets**: ~3 hours
- **Pins**: ~3-5 hours

## 🔧 Assembly Cheat Sheet

### Tools Needed
- Small mallet or hammer
- Skateboard trucks (2)
- Skateboard wheels (4)
- Mounting bolts (8)

### Assembly Steps
1. **Cross two scissor arms** at their center pivot holes, insert center pivot pin
2. **Repeat for each scissor pair** (3 pairs side by side)
3. **Attach lower crossbars** to bottom arm endpoints with pivot pins
4. **Attach upper crossbars** to top arm endpoints with pivot pins
5. **Insert locking pins** through crossbar and arm locking holes
6. **Bolt foot platforms** on top of upper crossbars
7. **Bolt truck brackets** below lower crossbars
8. **Mount trucks and wheels** to truck brackets
9. **Test ride!** (start slow)

**Tip:** Use `render_mode = "exploded"` in OpenSCAD to see assembly order.

## ⚠️ First Ride Checklist

- [ ] All pivot pins fully inserted
- [ ] Locking pins engaged in extended position
- [ ] No cracks or defects visible
- [ ] Trucks and wheels secure
- [ ] Tested with static weight (stand on it still)
- [ ] Wearing helmet and pads
- [ ] Starting on flat, smooth surface
- [ ] Beginning at walking speed

## 🎯 Common First-Time Issues

### "Pivots won't fit!"
→ Increase `pivot_tolerance` to 0.4mm and reprint

### "Mechanism is too stiff"
→ Sand pivot pins with fine sandpaper

### "Deck is too flexy"
→ Increase infill to 60% or add another scissor pair

### "Can't export STL - takes forever"
→ Normal! F6 render can take 5-10 minutes. Be patient.

### "Print failed/warped"
→ Use brim, ensure bed level, increase bed temp

## 📊 Material Shopping List

### For One Complete Board

**3D Printing:**
- ~600-800g PETG filament (~$15-20)
- Print time: ~35-40 hours

**Hardware:**
- 2× Skateboard trucks (~$25-40)
- 4× Skateboard wheels (~$20-35)
- 8× Mounting bolts with nuts (~$5)
- Bearings if not included with wheels (~$10-15)

**Total Cost**: ~$75-125 (depending on component quality)

**Compare to**:
- Traditional skateboard: $50-150
- Folding skateboard (commercial): $200-500+

## 🏆 Success Tips

1. **Start with default settings** - they're tested and work well
2. **Print one scissor arm first** - test fit before printing all 8
3. **Use PETG over PLA** - more durable for actual riding
4. **Don't skip supports** - deck overhangs need them
5. **Test the mechanism** - fold/unfold 20+ times before riding
6. **Inspect before each ride** - check for cracks or wear

## 📱 Share Your Build!

Built your scissor-skate? We'd love to see it!
- Tag photos with #scissorskate
- Open an issue to share photos/modifications
- Submit improvements via pull request

## 🆘 Need Help?

1. **Check README.md** - detailed build instructions
2. **Check TECHNICAL.md** - engineering details
3. **Check CONFIGURATIONS.md** - pre-made settings
4. **Open an issue** - ask questions on GitHub
5. **Review troubleshooting section** in README.md

## ⏭️ Next Steps After Your First Build

1. **Ride and test** - note what works and what doesn't
2. **Iterate** - adjust parameters and reprint weak parts
3. **Try different configs** - mini board, cruiser, longboard
4. **Experiment with materials** - try Nylon, carbon fiber PETG
5. **Customize** - add your own modifications
6. **Share** - help others with your learnings!

---

**Now go build something awesome! 🛹**
