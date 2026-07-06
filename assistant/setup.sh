#!/usr/bin/env bash
# setup.sh — Instala as skills da Study Wiki no Hermes
# Execute este script na raiz da wiki: ./assistant/setup.sh
set -euo pipefail

HERMES_SKILLS_DIR="${HOME}/.hermes/skills"
WIKI_ROOT="$(cd "$(dirname "$0")/.." && pwd)"

echo "Study Wiki — Setup de Skills"
echo "   Wiki: ${WIKI_ROOT}"
echo "   Skills: ${HERMES_SKILLS_DIR}"
echo ""

# Atualizar wiki_path nos metadados das skills para refletir o path real
echo "Atualizando wiki_path nos adapters..."
for adapter in "${WIKI_ROOT}/assistant/adapters/hermes/"*.md; do
    sed -i '' "s|^  wiki_path:.*|  wiki_path: ${WIKI_ROOT}|" "$adapter"
done
echo "  ✓ wiki_path → ${WIKI_ROOT}"
echo ""

# Instalar via symlink para manter sincronia automática com a wiki
install_skill() {
    local name="$1"
    local source="${WIKI_ROOT}/assistant/adapters/hermes/${name}.md"
    local target_dir="${HERMES_SKILLS_DIR}/wiki-${name}"
    local target_file="${target_dir}/SKILL.md"

    if [ ! -f "$source" ]; then
        echo "  ✗ ${name}: fonte não encontrada em ${source}"
        return 1
    fi

    # Remove instalação anterior se existir
    rm -rf "$target_dir" 2>/dev/null || true

    mkdir -p "$target_dir"
    ln -s "$source" "$target_file"

    echo "  ✓ wiki-${name}"
}

# Lista de skills
SKILLS=(
    ingest prepare ask assess lint crystallize progress
)

echo "Instalando skills..."
for skill in "${SKILLS[@]}"; do
    install_skill "$skill"
done

echo ""
echo "✅ ${#SKILLS[@]} skills instaladas com sucesso!"
echo ""
echo "Para verificar:"
echo "  hermes skills list | grep wiki-"
echo ""
echo "As skills são symlinks para a wiki → sempre atualizadas automaticamente."
