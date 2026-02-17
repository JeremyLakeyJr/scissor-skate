# Contributing to Scissor-Skate

Thank you for your interest in improving the Scissor-Skate project! This guide will help you contribute effectively.

## 🎯 Ways to Contribute

1. **Build Reports** - Share your build experience, photos, and lessons learned
2. **Bug Reports** - Report issues with the design or documentation
3. **Design Improvements** - Suggest or implement design enhancements
4. **Documentation** - Improve guides, add translations, fix typos
5. **Configuration Presets** - Add new pre-configured designs
6. **Testing** - Test with different materials, printers, or use cases

## 📸 Sharing Your Build

We'd love to see your completed scissor-skate! Please share:

### What to Include

- **Photos**: 
  - Collapsed state (show portability)
  - Extended state (ready to ride)
  - In use (riding, if possible)
  - Close-ups of mechanism
  
- **Build Details**:
  - Configuration used (compact/cruiser/custom)
  - Filament type and brand
  - Print settings (infill, layer height)
  - Total print time
  - Any modifications made
  
- **Performance Notes**:
  - Rider weight
  - How it performs (smooth, stable, etc.)
  - Any issues encountered
  - Recommendations for others

### How to Share

1. **GitHub Issue**: Open an issue with "Build Report:" in the title
2. **Pull Request**: Add photos to a `/builds` folder (if created)
3. **Social Media**: Tag with #scissorskate and link to this repo

## 🐛 Reporting Bugs or Issues

### Design Issues

If you encounter a problem with the 3D model:

1. **Check Existing Issues**: Search to see if already reported
2. **Create New Issue**: Use the bug report template
3. **Include Details**:
   - OpenSCAD version
   - Parameter values used
   - Expected behavior
   - Actual behavior
   - Screenshots if applicable
   - Error messages (if any)

### Documentation Issues

For typos, unclear instructions, or missing information:

1. **Quick Fixes**: Submit a pull request with corrections
2. **Major Changes**: Open an issue first to discuss
3. **Be Specific**: Point to exact file and line if possible

## 💡 Suggesting Enhancements

### Design Improvements

Have an idea for a better mechanism or feature?

1. **Open an Issue** with "Enhancement:" prefix
2. **Describe the Problem**: What current limitation does it address?
3. **Propose Solution**: How would your idea improve the design?
4. **Consider Trade-offs**: Print time, complexity, material usage, etc.

### New Configurations

Want to add a new preset configuration?

1. **Test Thoroughly**: Ensure it works well
2. **Document It**: Include specs, use case, recommendations
3. **Add to CONFIGURATIONS.md**: Follow existing format
4. **Submit Pull Request**: Include your changes

## 🔨 Development Process

### Setting Up

1. Fork the repository
2. Clone your fork:
   ```bash
   git clone https://github.com/YOUR_USERNAME/scissor-skate.git
   cd scissor-skate
   ```
3. Create a branch:
   ```bash
   git checkout -b feature/your-feature-name
   ```

### Making Changes

#### For OpenSCAD Design Changes

1. **Make Small Changes**: Iterate incrementally
2. **Test Each Change**: Render and verify in OpenSCAD (F5 preview, F6 render)
3. **Update Parameters**: Ensure new parameters are documented
4. **Add Comments**: Explain complex geometry or logic
5. **Test Export**: Verify STL export works correctly

#### For Documentation Changes

1. **Use Markdown**: Follow existing formatting style
2. **Check Links**: Ensure all links work
3. **Spell Check**: Use a spell checker
4. **Preview**: Review how it renders on GitHub

### Testing Your Changes

Before submitting:

- [ ] OpenSCAD preview works (F5)
- [ ] Full render completes without errors (F6)
- [ ] STL export succeeds for all components
- [ ] Documentation is clear and accurate
- [ ] No broken links in markdown files
- [ ] Code follows existing style and conventions

### Submitting Changes

1. **Commit Your Changes**:
   ```bash
   git add .
   git commit -m "Brief description of changes"
   ```
   
2. **Push to Your Fork**:
   ```bash
   git push origin feature/your-feature-name
   ```
   
3. **Open Pull Request**:
   - Go to the original repository
   - Click "New Pull Request"
   - Select your branch
   - Fill in the template with details

### Pull Request Guidelines

- **Title**: Clear, concise description
- **Description**: 
  - What does it change?
  - Why is this change needed?
  - How was it tested?
  - Any breaking changes?
- **Screenshots**: If visual changes, include before/after
- **References**: Link related issues

## 📝 Code Style Guidelines

### OpenSCAD Code

- **Indentation**: 4 spaces (no tabs)
- **Comments**: 
  - Module headers explain purpose
  - Inline comments for complex logic
  - Parameter descriptions
- **Naming**:
  - `snake_case` for variables and modules
  - Descriptive names (not `x`, `y`, but `deck_width`, `arm_length`)
- **Organization**:
  - Parameters at top
  - Modules grouped by function
  - Helper functions at bottom

### Documentation

- **Markdown**: Standard GitHub-flavored markdown
- **Headers**: Use hierarchy (# for main, ## for sections)
- **Lists**: Use consistent formatting
- **Code Blocks**: Always specify language for syntax highlighting
- **Links**: Use descriptive text, not "click here"

## 🎨 Design Philosophy

When proposing changes, keep in mind our core principles:

1. **Simplicity**: Avoid over-engineering
2. **Printability**: Must be feasible on common FDM printers
3. **Parametric**: Everything adjustable via variables
4. **Modularity**: Separate parts for easy printing and replacement
5. **Safety**: Structural integrity for rider safety
6. **Documentation**: Changes must be well-documented

## 🚀 Feature Roadmap

Interested in working on one of these? Great! Let us know:

### High Priority
- [ ] Improved locking mechanism designs
- [ ] Larger deck split for smaller print beds
- [ ] Weight optimization studies
- [ ] Material testing results

### Medium Priority  
- [ ] Alternative wheel mounting systems
- [ ] Integrated carry handle design
- [ ] LED lighting integration
- [ ] Modular deck sections

### Future Ideas
- [ ] Electric-assist folding mechanism
- [ ] Smartphone app for design customization
- [ ] Pre-sliced G-code for common printers
- [ ] Video assembly guide
- [ ] Multi-language documentation

## 🏆 Recognition

Contributors will be acknowledged in:
- README.md contributors section (if created)
- Release notes for significant contributions
- Comments in code for specific improvements

## 📜 Licensing

By contributing, you agree that your contributions will be licensed under the same license as the project (see LICENSE file).

## ❓ Questions?

- **General Questions**: Open a GitHub issue with "Question:" prefix
- **Design Help**: Check TECHNICAL.md first, then ask
- **Build Help**: Check README.md and QUICKSTART.md first

## 🤝 Code of Conduct

### Our Standards

- **Be Respectful**: Value diverse perspectives and experiences
- **Be Constructive**: Provide helpful feedback
- **Be Patient**: Remember everyone is learning
- **Be Inclusive**: Welcome newcomers and help them contribute

### Unacceptable Behavior

- Harassment or discriminatory language
- Personal attacks or insults
- Trolling or inflammatory comments
- Spam or off-topic content

## 📧 Contact

For private concerns, contact the maintainers directly via GitHub.

---

**Thank you for helping make Scissor-Skate better!** 🛹

Every contribution, no matter how small, helps improve the project for everyone. Whether you're fixing a typo, sharing a build report, or implementing a new feature, your help is appreciated!
