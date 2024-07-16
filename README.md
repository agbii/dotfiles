# dotfiles
dotfiles.agbii

Configuring dotfiles
from [eieio](http://github.com/eieioxyz/dotfiles_macos)
http://dotfiles.eieio.xyz/



## Decommission Computer
Backup / sync files: 
- Commit and Push to remote repositories
- Run `code --list-extensions > vscode_extensions` from `~/.dotfiles` to export [VS Code extensions](vscode_extensions)
- Commit and Push to remote repositories
- Dropbox / Google Drive

Deactivate licenses:
- Dropbox (`Preferences > Account > Unlink`)
- Sign Out of App Store (`Menu > Store > Sign Out`)

## Restore Instructions

1. `xcode-select --install` (Command Line Tools are required for Git and Homebrew)
2. `git clone https://github.com/agbii/dotfiles ~/.dotfiles`. We'll start with `https` but switch to `ssh` after everything is installed.
3. `cd ~/.dotfiles`
4. Do one last Software Audit by editing [Brewfile](Brewfile) directly.
5. [`./install`](install)
6. Restart computer.
7. Setup up Dropbox (use multifactor authentication!) and allow files to sync before setting up dependent applications. Alfred settings are stored here. Mackup depends on this as well (and thus so do Terminal and VS Code).
8. Run `mackup restore`. Consider doing a `mackup restore --dry-run --verbose` first.
9. [Generate ssh key](https://docs.github.com/en/authentication/connecting-to-github-with-ssh/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent), add to GitHub, and switch remotes.

```zsh
    # Generate SSH key in default location (~/.ssh/config)
    ssh-keygen -t ed25519 -C "10401133+agbii@users.noreply.github.com"

    # Start the ssh-agent
    eval "$(ssh-agent -s)"

    # Create config file with necessary settings
    << EOF > ~/.ssh/config
    Host *
      AddKeysToAgent yes
      UseKeychain yes
      IdentityFile ~/.ssh/id_ed25519
    EOF

    # Add private key to ssh-agent 
    ssh-add -K ~/.ssh/id_ed25519

    # Copy public key and add to github.com > Settings > SSH and GPG keys
    pbcopy < ~/.ssh/id_ed25519.pub

    # Test SSH connection, then verify fingerprint and username
    # https://docs.github.com/en/authentication/connecting-to-github-with-ssh/testing-your-ssh-connection
    ssh -T git@github.com

    # Switch from HTTPS to SSH
    git remote set-url origin git@github.com:agbii/dotfiles.git
```


### Manual Steps

#### Alfred

1. `System Preferences > Keyboard > Shortcuts > Spotlight > Show Spotlight search (cmd+space)` uncheck.
2. `Alfred Preferences > Powerpack` add License.
3. `Alfred Preferences > General > Request Permissions`.
4. `Alfred Preferences > General > Alfred Hotkey` change to `cmd+space`.
5. `Alfred Preferences > Advanced > Set preferences folder` and set to `~/Dropbox/dotfiles/Alfred`.
