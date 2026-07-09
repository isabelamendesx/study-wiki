#!/usr/bin/env bash
# setup.sh — Instala as skills da Study Wiki no Hermes e Claude Code
# Execute este script na raiz da wiki: ./assistant/setup.sh
set -euo pipefail

HERMES_SKILLS_DIR="${HOME}/.hermes/skills"
CLAUDE_SKILLS_DIR="${HOME}/.claude/skills"
WIKI_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
SKILLS_SRC="${WIKI_ROOT}/assistant/skills"

echo "Study Wiki — Setup de Skills"
echo "   Wiki: ${WIKI_ROOT}"
echo "   Skills: ${SKILLS_SRC}"
echo ""

# Atualizar wiki_path nas skills centrais (fonte única)
echo "Atualizando wiki_path nas skills..."
for skill_dir in "${SKILLS_SRC}/wiki-"*; do
    skill_file="${skill_dir}/SKILL.md"
    if [ -f "$skill_file" ]; then
        sed -i '' "s|^  wiki_path:.*|  wiki_path: ${WIKI_ROOT}|" "$skill_file"
    fi
done
echo "  ✓ wiki_path → ${WIKI_ROOT}"
echo ""

SKILLS=(ingest prepare ask assess lint crystallize progress)

install_skill() {
    local name="$1"
    local target_base="$2"
    local label="$3"

    local source="${SKILLS_SRC}/wiki-${name}/SKILL.md"
    local target_dir="${target_base}/wiki-${name}"
    local target_file="${target_dir}/SKILL.md"

    if [ ! -f "$source" ]; then
        echo "  ✗ ${name}: fonte não encontrada em ${source}"
        return 1
    fi

    rm -rf "$target_dir" 2>/dev/null || true
    mkdir -p "$target_dir"
    ln -s "$source" "$target_file"
}

# === Hermes ===
echo "┌─ Hermes ──────────────────────────────"
echo "│  Destino: ${HERMES_SKILLS_DIR}"
for skill in "${SKILLS[@]}"; do
    install_skill "$skill" "$HERMES_SKILLS_DIR" "Hermes"
    echo "│  ✓ wiki-${skill}"
done
echo "│  ✅ ${#SKILLS[@]} skills"
echo "└───────────────────────────────────────"
echo ""

# === Claude Code ===
echo "┌─ Claude Code ─────────────────────────"
echo "│  Destino: ${CLAUDE_SKILLS_DIR}"
for skill in "${SKILLS[@]}"; do
    install_skill "$skill" "$CLAUDE_SKILLS_DIR" "Claude Code"
    echo "│  ✓ wiki-${skill}"
done
echo "│  ✅ ${#SKILLS[@]} skills"
echo "└───────────────────────────────────────"
echo ""

echo "As skills são symlinks diretos para assistant/skills/ → sempre atualizadas."
echo ""
echo "Para verificar:"
echo "  hermes skills list | grep wiki-"
echo "  ls ~/.claude/skills/wiki-*/"
