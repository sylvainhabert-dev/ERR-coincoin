#!/usr/bin/env bash

set -euo pipefail

# ============================================================
# VERSION PORTABLE GIT BASH (Windows)
# ============================================================
#
# Compatible :
# - Git Bash
# - MINGW64
# - MSYS2
#
# Nécessite :
# - git
# - unzip
#
# ============================================================

# ------------------------------------------------------------
# CONFIGURATION
# ------------------------------------------------------------

ZIP1="E:/ERRv2.2.7.3-541-2-2-7-3-1778726116.zip"
ZIP2="E:/Seamless Co-op v1.9.9-510-1-9-9-1776812412.zip"

GIT_PATH="E:/ERR-coincoin"

GIT_BRANCH="main"

# ------------------------------------------------------------
# OUTILS
# ------------------------------------------------------------

log() {
    echo
    echo "[>] $1"
}

success() {
    echo "[OK] $1"
}

error() {
    echo "[ERREUR] $1"
    exit 1
}

# ------------------------------------------------------------
# VERIFICATIONS
# ------------------------------------------------------------

log "Verification des prerequis"

command -v git >/dev/null 2>&1 || error "git introuvable"
command -v unzip >/dev/null 2>&1 || error "unzip introuvable"

[[ -f "$ZIP1" ]] || error "ZIP1 introuvable : $ZIP1"
[[ -f "$ZIP2" ]] || error "ZIP2 introuvable : $ZIP2"

[[ -d "$GIT_PATH/.git" ]] || error "Depot git introuvable : $GIT_PATH"

success "Prerequis valides"

# ------------------------------------------------------------
# PREPARATION
# ------------------------------------------------------------

log "Preparation du depot"

cd "$GIT_PATH"

# Nettoyage complet sauf .git et .github
find . -mindepth 1 -maxdepth 1 \
    ! -name ".git" \
    ! -name ".github" \
    ! -name "script" \
    -exec rm -rf {} +

WORKDIR="$(mktemp -d)"
ZIP2_DIR="$WORKDIR/zip2"

mkdir -p "$ZIP2_DIR"

success "Depot nettoye"

# ------------------------------------------------------------
# EXTRACTION ZIP1
# ------------------------------------------------------------

log "Extraction du mod ERR"

unzip -q "$ZIP1" -d "$GIT_PATH"

success "ZIP1 extrait"

# ------------------------------------------------------------
# NORMALISATION DU DOSSIER PRINCIPAL
# ------------------------------------------------------------

ROOTDIR=""

for dir in "$GIT_PATH"/*; do
    if [[ -d "$dir" ]]; then
        name="$(basename "$dir")"

        if [[ "$name" != ".git" && "$name" != ".github" && "$name" != "script" ]]; then
            ROOTDIR="$dir"
            break
        fi
    fi
done

[[ -n "$ROOTDIR" ]] || error "Impossible de trouver le dossier principal"

FINAL_ERR_DIR="$GIT_PATH/ERR"

rm -rf "$FINAL_ERR_DIR"

mv "$ROOTDIR" "$FINAL_ERR_DIR"

ROOTDIR="$FINAL_ERR_DIR"

success "Dossier principal : $ROOTDIR"

# ------------------------------------------------------------
# EXTRACTION ZIP2
# ------------------------------------------------------------

log "Extraction de Seamless Coop"

unzip -q "$ZIP2" -d "$ZIP2_DIR"

success "ZIP2 extrait"

# ------------------------------------------------------------
# LOCALISATION DES FICHIERS
# ------------------------------------------------------------

SRC="$ZIP2_DIR/SeamlessCoop"

[[ -d "$SRC" ]] || error "Dossier SeamlessCoop introuvable"

SRC_LOCALE="$SRC/locale"
SRC_DLL="$SRC/ersc.dll"

[[ -d "$SRC_LOCALE" ]] || error "Dossier locale introuvable"
[[ -f "$SRC_DLL" ]] || error "ersc.dll introuvable"

success "Sources Seamless Coop validees"

# ------------------------------------------------------------
# DOSSIER DESTINATION
# ------------------------------------------------------------

DEST="$ROOTDIR/dll/offline"

mkdir -p "$DEST"

# ------------------------------------------------------------
# COPIE DES FICHIERS
# ------------------------------------------------------------

log "Copie des fichiers"

cp -R "$SRC_LOCALE" "$DEST/"
cp -f "$SRC_DLL" "$DEST/"

success "Fichiers copies"

# ============================================================
# MODIFICATION INI
# ============================================================

INI="$DEST/ersc_settings.ini"

if [[ ! -f "$INI" ]]; then
    echo "[ERREUR] ersc_settings.ini introuvable"
    exit 1
fi

echo
echo "[>] Modification du fichier INI..."

sed -i.bak \
    's/^cooppassword[[:space:]]*=[[:space:]]*$/cooppassword = coincoin/' \
    "$INI"

rm -f "${INI}.bak"

echo "[OK] INI modifie"

# ============================================================
# NETTOYAGE TEMP
# ============================================================

echo
echo "[>] Nettoyage temporaire..."

rm -rf "$WORKDIR"

echo "[OK] Nettoyage effectue"

# ============================================================
# GIT
# ============================================================

echo
echo "[>] Preparation commit git..."

cd "$GIT_PATH"

ZIP_NAME="$(basename "$ZIP1")"

echo "[>] Git add..."

git add .

echo "[>] Git commit..."

git commit -m "$ZIP_NAME"

echo "[>] Git push..."

git push origin "$GIT_BRANCH"

echo
echo "=========================================="
echo "Operation terminee avec succes !"
echo "Commit : $ZIP_NAME"
echo "Depot : $GIT_PATH"
echo "=========================================="

read -p "Appuyez sur Entree pour quitter..."