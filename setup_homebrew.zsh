#!/usr/bin/env zsh

echo "\n<<< Starting Homebrew Setup>>>\n"

if exists brew; then
  echo "<<Brew $(brew --version) already exists, skipping install>>"
else
  echo "<<Installing Brew>>"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi


# Currently, you can't do `brew bundle --no-quarantine` as an option.
# export HOMEBREW_CASK_OPTS="--no-quarantine --no-binaries"

brew bundle --verbose


echo "Enter superuser (sudo) password to accept Xcode license"
sudo xcodebuild -license accept
sudo xcodebuild -runFirstLaunch