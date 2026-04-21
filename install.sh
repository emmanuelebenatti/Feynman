#!/usr/bin/env bash
set -euo pipefail

# Feynman installer
# Usage: curl -fsSL https://feynman.is/install | bash

REPO="emmanuelebenatti/feynman"
BINARY="feynman"
INSTALL_DIR="${FEYNMAN_INSTALL_DIR:-$HOME/.local/bin}"

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
BOLD='\033[1m'
RESET='\033[0m'

info()    { printf "${CYAN}  info${RESET}  %s\n" "$*"; }
success() { printf "${GREEN}  done${RESET}  %s\n" "$*"; }
warn()    { printf "${YELLOW}  warn${RESET}  %s\n" "$*"; }
error()   { printf "${RED} error${RESET}  %s\n" "$*" >&2; exit 1; }

# ── Banner ────────────────────────────────────────────────────────────────────

printf "\n${BOLD}  Feynman installer${RESET}\n"
printf "  ─────────────────\n\n"

# ── Detect OS ─────────────────────────────────────────────────────────────────

detect_os() {
  case "$(uname -s)" in
    Linux*)  echo "linux" ;;
    Darwin*) echo "darwin" ;;
    *)       error "Unsupported OS: $(uname -s). Only Linux and macOS are supported." ;;
  esac
}

# ── Detect architecture ───────────────────────────────────────────────────────

detect_arch() {
  case "$(uname -m)" in
    x86_64 | amd64)  echo "x86_64" ;;
    aarch64 | arm64) echo "arm64" ;;
    *)               error "Unsupported architecture: $(uname -m)." ;;
  esac
}

# ── Check required tools ──────────────────────────────────────────────────────

check_deps() {
  for cmd in curl tar; do
    command -v "$cmd" >/dev/null 2>&1 || error "'$cmd' is required but not found. Please install it and retry."
  done
}

# ── Fetch latest release tag from GitHub ─────────────────────────────────────

fetch_latest_version() {
  local url="https://api.github.com/repos/${REPO}/releases/latest"
  local version

  version=$(curl -fsSL "$url" 2>/dev/null \
    | grep '"tag_name"' \
    | sed -E 's/.*"tag_name": *"([^"]+)".*/\1/')

  [[ -z "$version" ]] && error "Could not determine the latest release. Check your internet connection."
  echo "$version"
}

# ── Build download URL ────────────────────────────────────────────────────────

build_url() {
  local version="$1" os="$2" arch="$3"
  # Expected asset pattern: feynman-<version>-<os>-<arch>.tar.gz
  echo "https://github.com/${REPO}/releases/download/${version}/${BINARY}-${version}-${os}-${arch}.tar.gz"
}

# ── Download and install ──────────────────────────────────────────────────────

install_binary() {
  local url="$1"
  local tmp_dir
  tmp_dir=$(mktemp -d)
  # shellcheck disable=SC2064
  trap "rm -rf '$tmp_dir'" EXIT

  info "Downloading ${BINARY} …"
  if ! curl -fsSL --progress-bar "$url" -o "$tmp_dir/feynman.tar.gz"; then
    error "Download failed. URL: $url"
  fi

  info "Extracting …"
  tar -xzf "$tmp_dir/feynman.tar.gz" -C "$tmp_dir"

  local bin_path
  bin_path=$(find "$tmp_dir" -type f -name "$BINARY" | head -1)
  [[ -z "$bin_path" ]] && error "Binary '${BINARY}' not found in archive."

  mkdir -p "$INSTALL_DIR"
  chmod +x "$bin_path"
  mv "$bin_path" "$INSTALL_DIR/$BINARY"
}

# ── PATH check ────────────────────────────────────────────────────────────────

check_path() {
  if ! echo ":$PATH:" | grep -q ":${INSTALL_DIR}:"; then
    warn "${INSTALL_DIR} is not in your PATH."
    printf "\n  Add the following line to your shell profile (~/.bashrc, ~/.zshrc, …):\n\n"
    printf "    ${CYAN}export PATH=\"\$PATH:${INSTALL_DIR}\"${RESET}\n\n"
    printf "  Then restart your shell or run:\n\n"
    printf "    ${CYAN}source ~/.bashrc${RESET}  (or your profile file)\n\n"
  fi
}

# ── Main ──────────────────────────────────────────────────────────────────────

main() {
  check_deps

  local os arch version url
  os=$(detect_os)
  arch=$(detect_arch)

  info "Detected platform: ${os}/${arch}"

  version=$(fetch_latest_version)
  info "Latest release:    ${version}"

  url=$(build_url "$version" "$os" "$arch")
  info "Install directory: ${INSTALL_DIR}"

  install_binary "$url"

  success "${BINARY} ${version} installed to ${INSTALL_DIR}/${BINARY}"
  check_path

  printf "  Run ${BOLD}feynman --help${RESET} to get started.\n\n"
}

main "$@"
