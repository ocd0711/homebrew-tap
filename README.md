# Homebrew Tap

Homebrew tap for [CodexStack](https://github.com/ocd0711/CodexStack) and related tools.

## Install

```bash
brew tap ocd0711/tap
```

## Casks

### codex-stack

Native macOS menu bar app for managing local Codex sessions.

```bash
brew install --cask ocd0711/tap/codex-stack
```

## Update / Uninstall

```bash
brew update
brew upgrade --cask codex-stack

# uninstall
brew uninstall --cask codex-stack

# uninstall + remove user data
brew uninstall --cask --zap codex-stack
```
