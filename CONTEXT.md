# CONTEXT.md

## Project Overview
This is a macOS setup automation script that installs applications and configures system settings via Homebrew and Mac App Store CLI.

## Build/Test/Lint Commands
- **Run setup script**: `bash setup.sh` or `./setup.sh`
- **Test script syntax**: `bash -n setup.sh`
- **Check Homebrew status**: `brew doctor`
- **Validate MAS apps**: `mas list`

## Code Style Guidelines
- **Language**: Bash shell script
- **Shebang**: Use `#!/usr/bin/env bash`
- **Comments**: Use `#` for descriptive comments explaining sections
- **Echo statements**: Use descriptive messages for user feedback
- **Error handling**: Check command availability before execution (e.g., `test ! "$(which brew)"`)
- **Formatting**: Use consistent indentation and spacing
- **Variables**: Use descriptive names, arrays for app lists
- **Quoting**: Quote variables and strings properly for safety

## Project Structure
- `setup.sh` - Main automation script
- `readme.md` - Documentation and usage instructions
- `LICENSE` - GPL v3 license

## License
GPL v3 - Ensure any modifications maintain open source compatibility