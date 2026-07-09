#!/usr/bin/env bash
# setup.sh — Instala as skills da Study Wiki no Hermes e Claude Code
# Execute este script na raiz da wiki: ./assistant/setup.sh
set -euo pipefail

HERMES_SKILLS_DIR="${HOME}/.hermes/skills"
CLAUDE_SKILLS_DIR="${HOME}/.claude/skills"
WIKI_ROOT="$(cd "$(dirname "$0")/.." && pwd)"

echo "Study Wiki — Setup de Skills"
echo "   Wiki: ${WIKI_ROOT}"
echo ""

# === Hermes ===
echo "┌─ Hermes ──────────────────────────────"
echo "│  Skills dir: ${HERMES_SKILLS_DIR}"

# Atualizar wiki_path nos metadados das skills para refletir o path real
echo "│  Atualizando wiki_path nos adapters..."
for adapter in "${WIKI_ROOT}/assistant/adapters/hermes/"*.md; do
    sed -i '' "s|^  wiki_path:.*|  wiki_path: ${WIKI_ROOT}|" "$adapter"
done
echo "│  ✓ wiki_path → ${WIKI_ROOT}"

install_hermes_skill() {
    local name="$1"
    local source="${WIKI_ROOT}/assistant/adapters/hermes/${name}.md"
    local target_dir="${HERMES_SKILLS_DIR}/wiki-${name}"
    local target_file="${target_dir}/SKILL.md"

    if [ ! -f "$source" ]; then
        echo "│  ✗ ${name}: fonte não encontrada"
        return 1
    fi

    rm -rf "$target_dir" 2>/dev/null || true
    mkdir -p "$target_dir"
    ln -s "$source" "$target_file"
    echo "│  ✓ wiki-${name}"
}

SKILLS=(ingest prepare ask assess lint crystallize progress)

echo "│  Instalando skills..."
for skill in "${SKILLS[@]}"; do
    install_hermes_skill "$skill"
done
echo "│  ✅ ${#SKILLS[@]} skills instaladas"
echo "└───────────────────────────────────────"
echo ""

# === Claude Code ===
echo "┌─ Claude Code ─────────────────────────"
echo "│  Skills dir: ${CLAUDE_SKILLS_DIR}"

# Atualizar wiki_path nos adapters Claude Code
echo "│  Atualizando wiki_path nos adapters..."
for adapter in "${WIKI_ROOT}/assistant/adapters/claude-code/"*.md; do
    sed -i '' "s|^  wiki_path:.*|  wiki_path: ${WIKI_ROOT}|" "$adapter"
done
echo "│  ✓ wiki_path → ${WIKI_ROOT}"

install_claude_skill() {
    local name="$1"
    local source="${WIKI_ROOT}/assistant/adapters/claude-code/${name}.md"
    local target_dir="${CLAUDE_SKILLS_DIR}/wiki-${name}"
    local target_file="${target_dir}/SKILL.md"

    if [ ! -f "$source" ]; then
        echo "│  ✗ ${name}: fonte não encontrada"
        return 1
    fi

    rm -rf "$target_dir" 2>/dev/null || true
    mkdir -p "$target_dir"
    ln -s "$source" "$target_file"
    echo "│  ✓ wiki-${name}"
}

echo "│  Instalando skills..."
for skill in "${SKILLS[@]}"; do
    install_claude_skill "$skill"
done
echo "│  ✅ ${#SKILLS[@]} skills instaladas"
echo "└───────────────────────────────────────"
echo ""

echo "As skills são symlinks para a wiki → sempre atualizadas automaticamente."
echo ""
echo "Para verificar:"
echo "  hermes skills list | grep wiki-"
echo "  ls ~/.claude/skills/wiki-*/"
