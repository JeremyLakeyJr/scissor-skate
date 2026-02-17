#!/bin/bash
#
# Export Script for Scissor-Skate Components
#
# This script helps automate the export of STL files from the OpenSCAD design.
# Requires OpenSCAD to be installed and available in your PATH.
#
# Usage: ./export_stls.sh [output_directory]
#

set -e  # Exit on error

# Configuration
SCAD_FILE="scissor_skate.scad"
OUTPUT_DIR="${1:-./stl_output}"
OPENSCAD_BIN="${OPENSCAD_BIN:-openscad}"

# Color codes for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Check if OpenSCAD is installed
if ! command -v "$OPENSCAD_BIN" &> /dev/null; then
    echo -e "${RED}Error: OpenSCAD not found!${NC}"
    echo "Please install OpenSCAD from https://openscad.org/downloads.html"
    echo "Or set OPENSCAD_BIN environment variable to point to your OpenSCAD binary"
    exit 1
fi

# Check if main SCAD file exists
if [ ! -f "$SCAD_FILE" ]; then
    echo -e "${RED}Error: $SCAD_FILE not found!${NC}"
    echo "Please run this script from the scissor-skate directory"
    exit 1
fi

# Create output directory
mkdir -p "$OUTPUT_DIR"
echo -e "${GREEN}Output directory: $OUTPUT_DIR${NC}"
echo ""

# Components to export
declare -a components=(
    "scissor_arms:Scissor Arms (print 4x per pair, default 12x total)"
    "crossbar:Crossbar (print 4x — 2 upper, 2 lower)"
    "foot_platform:Foot Platforms (print 2x — front and rear)"
    "truck_bracket:Truck Mount Brackets (print 2x — front and rear)"
    "pivot_pins:Pivot Pins (print 10-14x)"
    "lock_mechanism:Locking Pins (print 2-4x)"
)

# Export each component
echo "Exporting STL files..."
echo "Note: This may take several minutes depending on your system."
echo ""

for component in "${components[@]}"; do
    # Split component into name and description
    IFS=':' read -r name description <<< "$component"
    
    output_file="$OUTPUT_DIR/${name}.stl"
    
    echo -e "${YELLOW}Rendering: $description${NC}"
    echo "  Output: $output_file"
    
    # Run OpenSCAD with the specific render_mode
    "$OPENSCAD_BIN" \
        -o "$output_file" \
        -D "render_mode=\"$name\"" \
        "$SCAD_FILE" 2>&1 | grep -v "^ECHO:" || true
    
    if [ -f "$output_file" ]; then
        file_size=$(du -h "$output_file" | cut -f1)
        echo -e "  ${GREEN}✓ Success${NC} (${file_size})"
    else
        echo -e "  ${RED}✗ Failed${NC}"
    fi
    echo ""
done

echo -e "${GREEN}Export complete!${NC}"
echo ""
echo "STL files are in: $OUTPUT_DIR"
echo ""
echo "Next steps:"
echo "  1. Import STL files into your slicer (Cura, PrusaSlicer, etc.)"
echo "  2. Configure print settings (see README.md for recommendations)"
echo "  3. Slice and export G-code"
echo "  4. Print and assemble!"
echo ""
echo "Print quantities needed:"
echo "  - scissor_arms.stl: 4x per scissor pair (default: 12x total for 3 pairs)"
echo "  - crossbar.stl: 4x (2 upper + 2 lower)"
echo "  - foot_platform.stl: 2x (front and rear)"
echo "  - truck_bracket.stl: 2x (front and rear)"
echo "  - pivot_pins.stl: 10-14x total"
echo "  - lock_mechanism.stl: 2-4x"
