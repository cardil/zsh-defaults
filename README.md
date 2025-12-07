# Cardil's ZSH

Defaults to be used for all my ZSH installs

Uses [Powerlevel10k](https://github.com/romkatv/powerlevel10k) theme.

![Cardil's ZSH screenshot](https://github.com/cardil/zsh-defaults/raw/master/cardil-zsh.png)

Terminal: [Tilix](https://gnunn1.github.io/tilix-web/)
Font: [JetBrainsMono Nerd Font](http://nerdfonts.com/)

## Installation

0. install zsh: `apt install -y zsh`
1. Install antigen to `/opt/antigen`:
```bash
sudo git clone https://github.com/zsh-users/antigen.git /opt/antigen
sudo chmod -R g+w /opt/antigen
sudo chgrp -R "$([ -f /etc/redhat-release ] && echo wheel || echo admin)" /opt/antigen
sudo find /opt/antigen -type d -exec chmod g+s {} +
```
2. Checkout this repo to: `/etc/zsh/customize`:
```bash
sudo git clone https://github.com/cardil/zsh-defaults.git /etc/zsh/customize
sudo chmod -R g+w /etc/zsh/customize
sudo chgrp -R "$([ -f /etc/redhat-release ] && echo wheel || echo admin)" /etc/zsh/customize
sudo find /etc/zsh/customize -type d -exec chmod g+s {} +
```
3. For users that should use this themed ZSH place those lines at begining of `~/.zshrc` file:

```bash
cat << EOF >> ~/.zshrc
# Use Cardil's ZSH theme
source /etc/zsh/customize/zsh-defaults.zsh
EOF
```
