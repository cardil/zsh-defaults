# zsh-defaults
Defaults to be used for all my ZSH installs

## Installation

0. install zsh
1. Install antigen to `/opt/antigen`:
```bash
sudo git clone https://github.com/zsh-users/antigen.git /opt/antigen
# Optionally, make it upgradable for users in admin group
sudo chmod -R g+w /opt/antigen
sudo chgrp -R admin /opt/antigen
sudo find /opt/antigen -type d -exec chmod g+s {} +
```
2. Checkout this repo to: `/etc/zsh/customize`:
```bash
sudo git clone https://github.com/cardil/zsh-defaults.git /etc/zsh/customize
# Optionally, make it changable for users in admin group
sudo chmod -R g+w /etc/zsh/customize
sudo chgrp -R admin /etc/zsh/customize
sudo find /etc/zsh/customize -type d -exec chmod g+s {} +
```
3. For users that should use this themed ZSH place those lines at begining of `~/.zshrc` file:

```bash
# Use Cardil's ZSH theme
source /etc/zsh/customize/zsh-defaults.zsh
```
