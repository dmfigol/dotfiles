#!/usr/bin/env bash
if [ `uname` = "Darwin" ]; then
  # disable font smoothing
  defaults -currentHost write -g AppleFontSmoothing -int 0
  # disable autocorrection
  defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
  # software updates
  softwareupdate --all --install --force
  # dev tools
  if ! xcode-select --print-path &> /dev/null; then
    xcode-select --install &> /dev/null
  fi

  # homebrew
  if [ ! -x /opt/homebrew/bin/brew ]; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  fi
  eval "$(/opt/homebrew/bin/brew shellenv)"
  brew bundle --file="Brewfile"
fi

# git config
git config --global push.autoSetupRemote true
git config --global user.name "Dmitry Figol"
