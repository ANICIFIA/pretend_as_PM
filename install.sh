#!/bin/bash
# pretend_as_PM — Install to Claude Code global skills directory
set -e

SKILLS_DIR="${HOME}/.claude/skills"
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
SOURCE_DIR="${SCRIPT_DIR}/skills"

echo "=== pretend_as_PM Installer ==="
echo ""

# Create skills directory if not exists
mkdir -p "${SKILLS_DIR}"

# Copy skill directories
for skill in pretend_as_PM pm-decision pm-summary; do
    if [ -d "${SOURCE_DIR}/${skill}" ]; then
        rm -rf "${SKILLS_DIR}/${skill}"
        cp -r "${SOURCE_DIR}/${skill}" "${SKILLS_DIR}/${skill}"
        echo "✓ Installed: ${skill}"
    else
        echo "✗ Missing: ${skill}"
    fi
done

echo ""
echo "=== Installation complete ==="
echo ""
echo "Recommended: Add the following to your CLAUDE.md for stronger trigger reliability:"
echo ""
echo "  ~/.claude/CLAUDE.md (global)"
echo "  or <project>/.claude/CLAUDE.md (per-project)"
echo ""
echo '  - 涉及方案抉择时，触发 pretend_as_PM Skill 记录决策后再修改代码。'
echo '    修改完成后输出 📋 决策已记录：PM-xxx（无方案抉择则无需输出）。'
echo '    若用户发现应记录但未记录，可手动 /pm-decision。'
echo ""
