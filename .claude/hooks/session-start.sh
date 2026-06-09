#!/bin/bash
set -euo pipefail

# ApplicantLens — SessionStart hook
#
# Auto-detects the project's stack and installs dependencies so tests and
# linters are ready when a Claude Code session starts. It is intentionally
# stack-agnostic right now because the application code is being rebuilt from
# a handoff bundle; once the real stack lands this should be tightened to it.
#
# Properties: idempotent, non-interactive, safe to run on an empty repo.

PROJECT_DIR="${CLAUDE_PROJECT_DIR:-$(pwd)}"
cd "$PROJECT_DIR"

log() { echo "[session-start] $*"; }

installed_any=false

# --- Node / JavaScript / TypeScript ---
if [ -f package.json ]; then
  installed_any=true
  if [ -f pnpm-lock.yaml ]; then
    log "Detected pnpm-lock.yaml -> pnpm install"
    pnpm install --prefer-offline
  elif [ -f yarn.lock ]; then
    log "Detected yarn.lock -> yarn install"
    yarn install
  else
    log "Detected package.json -> npm install"
    npm install
  fi
fi

# --- Python ---
if [ -f pyproject.toml ] && grep -q "tool.poetry" pyproject.toml 2>/dev/null && command -v poetry >/dev/null 2>&1; then
  installed_any=true
  log "Detected Poetry project -> poetry install"
  poetry install
elif [ -f requirements.txt ]; then
  installed_any=true
  log "Detected requirements.txt -> pip install"
  pip install -r requirements.txt
fi

# --- Ruby ---
if [ -f Gemfile ]; then
  installed_any=true
  log "Detected Gemfile -> bundle install"
  bundle install
fi

# --- Go ---
if [ -f go.mod ]; then
  installed_any=true
  log "Detected go.mod -> go mod download"
  go mod download
fi

if [ "$installed_any" = false ]; then
  log "No dependency manifest found yet — nothing to install (repo is still empty)."
fi

log "done"
