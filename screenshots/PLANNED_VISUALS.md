# Planned Screenshots & Animations

The following additional visuals would help document the scissor-skate project.
Contributions are welcome — render them in OpenSCAD and submit a PR!

## Planned Renders

| Visual | Description | How to Generate |
|--------|-------------|-----------------|
| Exploded View | All parts separated vertically for assembly reference | Set `render_mode = "exploded"` in `scissor_skate.scad`, press F6, screenshot |
| Collapsed vs Extended | Side-by-side comparison of both states | Render with `show_extended = true` and `false`, combine images |
| Pivot Close-Up | Detail of shoulder bolt hole with chamfer cross-section | Zoom into a single arm pivot, render cross-section |
| Collapse Motion (GIF) | Animated sequence from extended → collapsed | Animate `extension_angle` from 15° to 70° across frames, assemble into GIF |
| Foot Platform Detail | Close-up showing concave bowl and kick ramp geometry | Render `foot_platform` mode, zoom to edge |
| Lock Mechanism Engaged | Cross-section showing locking pin through crossbar and arm | Render assembly with section cut through locking pin |

## Tips for Generating Renders

1. Use OpenSCAD's **View → Camera → Viewall** for consistent framing
2. Export at 1920×1080 for high-quality screenshots
3. Use **File → Export → Export as PNG** for consistent output
4. For animations, use OpenSCAD's built-in animation feature (`View → Animate`)
   or script frame export with the command-line interface
