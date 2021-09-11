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


echo "Installing VS Code Extensions"
cat vscode_extensions | xargs -L 1 code --install-extension


# This works to solve the Insecure Directories issue:
# compaudit | xargs chmod go-w
# But this is from the Homebrew site, though `-R` was needed:
# https://docs.brew.sh/Shell-Completion#configuring-completions-in-zsh
chmod -R go-w "$(brew --prefix)/share"
